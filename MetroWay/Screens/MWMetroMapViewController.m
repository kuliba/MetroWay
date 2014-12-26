//
//  MMMetroMapViewController.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 06.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWMetroMapViewController.h"
#import "MWStorage.h"
#import "MWLocation.h"
#import "MWDraw.h"
#import "MWDrawFillCircle.h"
#import "MWDrawArc.h"
#import "MWRouter.h"
#import "MWMenuViewController.h"
#import "MWLanguage.h"
#import "MWStation.h"
#import "MWDrawLine.h"
#import "MWRouteButton.h"
#import "MWSearchStationViewController.h"

@interface MWMetroMapViewController ()

@end

@implementation MWMetroMapViewController

@synthesize tapStation;

CALayer *routeLayer;
CALayer *routeListLayer;
CALayer *nearestStationIndicator;
CALayer *startStationIndicator;
CALayer *finishStationIndicator;
UIColor *nearestStationindicatorColor = nil;
static MWStation *currentGeoFoundStation = nil;
static MWStation *oldGeoFoundStation = nil;
float buttonHeight = 75;
static bool firstZoom = TRUE;
UIAlertView *connectingAlert;
MWRouteButton *routeButton1, *routeButton2, *routeButton3;
UIButton *routeButton4;
UITapGestureRecognizer *singleTap;
BOOL isRouteShow = false; // Показывается ли в данный момент маршрут
NSArray *compactRoute;
int selectedRouteIndex = 0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Делаем заголовок темным
    [self setNeedsStatusBarAppearanceUpdate];

    [self initControls];
    [self startGeoLocation];
    
    if ([MWSettings currentMetroMapIdentifier].length == 0) {
        NSString *launchImage;

        if  ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) &&
             ([UIScreen mainScreen].bounds.size.height > 480.0f)) {
            launchImage = @"LaunchImage-700-568h";
        } else {
            launchImage = @"LaunchImage-700";
        }
        self.launchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:launchImage]];
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        self.launchImageView.frame = screenBound;
        [self.view addSubview:self.launchImageView];
    } else {
        [self loadMetroMap];
    }
}

// Есть новое обновление для карты. Спрашиваем, нужно ли обновить карту
- (void)metroMapDownloaded:(NSNotification *)notification
{
    if (!oldMetroMapIdentifier.length) return;
    NSString *identifier = [notification.userInfo objectForKey:@"identifier"];
    if (![identifier isEqualToString:[MWSettings currentMetroMapIdentifier]]) {
        return;
    }
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self stopSpinner];
        connectingAlert = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"SelectMap_UpdateMapAlertTitle"]
                                                 message:nil
                                                delegate:self
                                       cancelButtonTitle:[MWLanguage localizedStringForKey:@"SelectMap_UpdateMapAlertLaterButtonTitle"]
                                       otherButtonTitles:[MWLanguage localizedStringForKey:@"SelectMap_UpdateMapAlertUpdateButtonTitle"], nil];
        connectingAlert.tag = 1;
        [connectingAlert show];
    });
}

// Запуск геолокации
- (void)startGeoLocation
{
    firstZoom = true;
    currentGeoFoundStation = nil;
    
    if (!locationManager && [CLLocationManager locationServicesEnabled]) {
        locationManager = [CLLocationManager new];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) [locationManager requestAlwaysAuthorization];
        [locationManager startUpdatingLocation];
        
    } else {
        // Геолокационные службы не активизированы
        if (locationManager) {
            [locationManager stopUpdatingLocation];
            [locationManager startUpdatingLocation];
        }
    }
}

- (void)initMetroMapControls:(BOOL)setZoomAndContentOffset
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    self.launchImageView.image = nil;
    self.launchImageView = nil;

    self.metroMapImageView.image = nil;
    self.metroMapImageView = nil;
    
    self.metroMapImageView = [[UIImageView alloc] initWithImage:metroMap.image];
    
    self.metroMapScrollView.contentSize = metroMap.image.size;
    self.metroMapScrollView.delegate = self;

    self.metroMapScrollView.minimumZoomScale = metroMap.minimumZoomScale;
    self.metroMapScrollView.maximumZoomScale = metroMap.maximumZoomScale;
    
    if (setZoomAndContentOffset && oldZoom) {
        firstZoom = false;
        [self.metroMapScrollView setZoomScale:oldZoom animated:NO];
        [self.metroMapScrollView setContentOffset:oldOffset animated:NO];
        if (oldGeoFoundStation && currentGeoFoundStation) {
            nearestStationIndicator.opacity = 1;
            nearestStationIndicator.position = currentGeoFoundStation.mapLocation;
            nearestStationIndicator.zPosition = 20;
        }
    } else {
        [self.metroMapScrollView setZoomScale:metroMap.initialZoomScale animated:NO];
        [self.metroMapScrollView setContentOffset:metroMap.contentOffset animated:NO];
        [self hideNearestStationIndicator:false];
    }
    
    [self.metroMapScrollView addSubview:self.metroMapImageView];

    [self setSearchButtons];
    
    [routeLayer removeFromSuperlayer];
    [self.metroMapImageView.layer addSublayer:routeLayer];
    [routeLayer setBounds:CGRectMake(0.0, 0.0, self.metroMapImageView.image.size.width, self.metroMapImageView.image.size.height)];
    [NSThread detachNewThreadSelector:@selector(saveScreenshots) toTarget:self withObject:nil];
}

static NSString *oldMetroMapIdentifier = nil;
static float oldZoom = 0;
static CGPoint oldOffset;

- (void)loadMetroMap
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    static BOOL reload = false;
    
    if (metroMap.englishTextExists && [MWStorage needChangeEnglishSet:metroMap]) {
        [self startSpinner:[MWLanguage localizedStringForKey:metroMap.englishTextDrawn ? @"MetroMap_SpinnerDeletingEnglishTextTitle" : @"MetroMap_SpinnerAddingEnglishTextTitle"]];

        if ([oldMetroMapIdentifier isEqualToString:metroMap.identifier]) {
            oldZoom = self.metroMapScrollView.zoomScale;
            oldOffset = self.metroMapScrollView.contentOffset;
        } else {
            [self initMetroMapControls:NO];
        }
        
        reload = true;
        [NSThread detachNewThreadSelector:@selector(setEnglishTitles) toTarget:self withObject:nil];
    } else if (![metroMap.identifier isEqualToString:oldMetroMapIdentifier]) {
        if (!reload) {
            // Если iOS <= 8, показываем alertView
            NSOperatingSystemVersion version;
            version.majorVersion = 8;
            version.minorVersion = 0;
            version.patchVersion = 0;
            if (![[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:version]) {
                [self startSpinner:[MWLanguage localizedStringForKey:@"MetroMap_SpinnerLoadingMapTitle"]];
            }
            reload = false;
        } else [self startGeoLocation];
        
        [[MWRouter router] clearRoutes];
        [self hideRoutes];
        [self initMetroMapControls:[[MWSettings currentMetroMapIdentifier] isEqualToString:metroMap.identifier]];
        
        oldMetroMapIdentifier = metroMap.identifier;
        [self stopSpinner];
    }
}

// Установка верхних панелей для выбора станций
- (void)setSearchPanel:(BOOL)isStartStation
{
    float animateDuration = 0.5;// firstZoom ? 0 : 0.5;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWStation *station = isStartStation ? metroMap.startStation : metroMap.finishStation;
    UIButton *background = isStartStation ? self.searchStartStationBackgroung : self.searchFinishStationBackground;
    UIButton *icon = isStartStation ? self.searchStartStationButton : self.searchFinishStationButton;
    UILabel *label = isStartStation ? self.searchStartStationLabel : self.searchFinishStationLabel;
    
    background.layer.cornerRadius = 6;
    
    if (station) {
        MWLine *line = [MWRouter lineByStation:station];

        // Удаляем предыдущие обработчики и назначаем новое для сброса начальной или конечной станции
        [icon removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
        [icon addTarget:self action: isStartStation ? @selector(searchStartStationClose:) : @selector(searchFinishStationClose:) forControlEvents:UIControlEventTouchUpInside];
        
        if (isStartStation) {
            startStationIndicator.opacity = 1.0;
            [startStationIndicator setNeedsDisplay];
        } else {
            finishStationIndicator.opacity = 1.0;
            [finishStationIndicator setNeedsDisplay];
        }

        [UIView animateWithDuration:animateDuration animations:^{
            background.backgroundColor = line.color;

            float left = isStartStation ? 69 : 199;
            label.frame = CGRectMake(left, 31, 85, 30);
            label.textColor = [MWDraw readableForegroundColorForBackgroundColor:line.color];
            if (station.nameOriginal.length > 7) {
                label.text = [[station.nameOriginal substringToIndex:7] stringByAppendingString:@"..."];
            } else {
                label.text = station.nameOriginal;
            }
            
            UIImage *magnifierImage = [label.textColor isEqual:[UIColor whiteColor]] ? [UIImage imageNamed:@"CloseWhite.png"] : [UIImage imageNamed:@"CloseBlack.png"];
            [icon setImage:magnifierImage forState:UIControlStateNormal];
            
            left = isStartStation ? 154 : 285;
            icon.frame = CGRectMake(left, 29, 26, 35);

            if (isStartStation) {
                if (startStationIndicator.position.x == -1000) {
                    startStationIndicator.position = metroMap.startStation.mapLocation;
                } else {
                    startStationIndicator.position = metroMap.startStation.mapLocation;
                }
            } else {
                if (finishStationIndicator.position.x == -1000) {
                    finishStationIndicator.position = metroMap.finishStation.mapLocation;
                } else {
                    finishStationIndicator.position = metroMap.finishStation.mapLocation;
                }
            }
        }];
    } else {
        [UIView animateWithDuration:animateDuration animations:^{
            background.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
            
            float offset = 4; // Зазор между иконкой и текстом
            
            [label setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17]];
            label.text = isStartStation ? [MWLanguage localizedStringForKey:@"MetroMap_SearchFrom"] : [MWLanguage localizedStringForKey:@"MetroMap_SearchTo"];
            label.textColor = [UIColor whiteColor];
            
            CGSize textSize = [label.text boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:label.font } context:nil].size;
            float textWidth = textSize.width;
            
            UIImage *magnifierImage = [UIImage imageNamed:@"Magnifier.png"];
            [icon setImage:magnifierImage forState:UIControlStateNormal];
            
            // Удаляем предыдущие обработчики и назначаем новое для вызова формы поиска или выбора станции
            [icon removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
            [icon addTarget:self action:isStartStation ? @selector(searchStartStation:) : @selector(searchFinishStation:) forControlEvents:UIControlEventTouchUpInside];
            
            float delta = (background.bounds.size.width - textWidth - 16/*icon.bounds.size.width*/ - offset) / 2;
            
            float left = background.frame.origin.x + delta;
            
            icon.frame = CGRectMake(left, 39, magnifierImage.size.width, magnifierImage.size.height);
            
            left = icon.frame.origin.x + icon.frame.size.width + offset;
            
            label.frame = CGRectMake(left, 31, textWidth, 30);

            if (isStartStation) {
                startStationIndicator.opacity = 0.0;
            } else {
                finishStationIndicator.opacity = 0.0;
            }
        }
            completion:^(BOOL finished) {
            if (isStartStation) {
                [startStationIndicator setNeedsDisplay];
            } else {
                [finishStationIndicator setNeedsDisplay];
            }
        }];
        
        // Удаляем предыдущие обработчики и назначаем новое для вызова формы поиска или выбора станции
        [icon removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
        [icon addTarget:self action:isStartStation ? @selector(searchStartStation:) : @selector(searchFinishStation:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)setSearchButtons
{
    [self setSearchPanel:YES];
    [self setSearchPanel:NO];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if ([MWSettings currentMetroMapIdentifier].length == 0) {
        MWSelectMapViewController *selectMapViewController = [[MWSelectMapViewController alloc] init];
        [self presentViewController:selectMapViewController animated:YES completion:nil];
    } else {
        [self loadMetroMap];
    }
    
    [self startGeoLocation];
}

// Если нужно, показываем или убираем надписи на английском языке
- (void)setEnglishTitles
{
    static BOOL block = false;
    if (block) {
        return;
    }
    block = true;
    [MWStorage changeEnglishSet];
    oldMetroMapIdentifier = nil;
    [self performSelectorOnMainThread:@selector(loadMetroMap) withObject:nil waitUntilDone:NO];
    block = false;
}

// Инициализация элементов управления
- (void)initControls
{
#ifndef DEBUG
    // Добавляем Flurry-событие для отслеживания времени просмотра схемы метро
    MMMetroMap *metroMap = [MMStorage currentMetroMap];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:metroMap.identifier, @"metro_map_identifier", nil];
    [Flurry logEvent:@"show_metro_map" withParameters:dictionary timed:NO];
#endif
    
    //self.view.backgroundColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];

    self.routeListScrollView.alpha = 0;
    self.routeListScrollView.hidden = NO;
    
    self.routeListView = [[UIView alloc] init];
    self.routeListView.alpha = 1;
    [self.routeListScrollView addSubview:self.routeListView];
    
    routeListLayer = [[CALayer alloc] init];
    routeListLayer.delegate = self;
    [self.routeListView.layer addSublayer:routeListLayer];
    
    routeLayer = [[CALayer alloc] init];
    routeLayer.delegate = self;
    routeLayer.needsDisplayOnBoundsChange = YES;
    routeLayer.zPosition = 20;
    routeLayer.anchorPoint = CGPointMake(0.0, 0.0);
    
    nearestStationIndicator = [[CALayer alloc] init];
    nearestStationIndicator.delegate = self;
    nearestStationIndicator.needsDisplayOnBoundsChange = YES;
    nearestStationIndicator.zPosition = 100;
    [nearestStationIndicator setAnchorPoint:CGPointMake(0.5, 0.5)];
    [nearestStationIndicator setBounds:CGRectMake(0, 0, 200, 200)];
    [routeLayer addSublayer:nearestStationIndicator];
    
    // Настраиваем кнопки маршрутов
    routeButton1 = [[MWRouteButton alloc] initWithPosition:CGPointMake(13, self.view.bounds.size.height)];
    routeButton1.tag = 1;
    routeButton1.state = UIControlStateSelected;
    UITapGestureRecognizer *touchOnView1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnRouteButton1)];
    [routeButton1 addGestureRecognizer:touchOnView1];
    
    routeButton2 = [[MWRouteButton alloc] initWithPosition:CGPointMake(90.5, self.view.bounds.size.height)];
    routeButton2.tag = 2;
    UITapGestureRecognizer *touchOnView2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnRouteButton2)];
    [routeButton2 addGestureRecognizer:touchOnView2];
    
    routeButton3 = [[MWRouteButton alloc] initWithPosition:CGPointMake(168, self.view.bounds.size.height)];
    routeButton3.tag = 3;
    UITapGestureRecognizer *touchOnView3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnRouteButton3)];
    [routeButton3 addGestureRecognizer:touchOnView3];
    
    routeButton4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [routeButton4 setBackgroundImage: [UIImage imageNamed:@"List1.png"] forState:UIControlStateNormal];
    routeButton4.frame = CGRectMake(224.5, self.view.bounds.size.height, 75, 75);
    routeButton4.contentMode = UIViewContentModeCenter;
    routeButton4.tintColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    routeButton4.layer.cornerRadius = 6;
    routeButton4.tag = 4;
    UITapGestureRecognizer *touchOnView4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnRouteButton4)];
    [routeButton4 addGestureRecognizer:touchOnView4];
    
    [self.view addSubview:routeButton1];
    [self.view addSubview:routeButton2];
    [self.view addSubview:routeButton3];
    [self.view addSubview:routeButton4];
    
    routeButton1.hidden = true;
    routeButton2.hidden = true;
    routeButton3.hidden = true;
    routeButton4.hidden = true;
    
    startStationIndicator = [[CALayer alloc] init];
    startStationIndicator.delegate = self;
    startStationIndicator.needsDisplayOnBoundsChange = YES;
    startStationIndicator.zPosition = 100;
    [startStationIndicator setAnchorPoint:CGPointMake(0.5, 0.5)];
    [startStationIndicator setBounds:CGRectMake(0, 0, 126, 126)];
    startStationIndicator.position = CGPointMake(-1000, -1000);
    [routeLayer addSublayer:startStationIndicator];
    
    finishStationIndicator = [[CALayer alloc] init];
    finishStationIndicator.delegate = self;
    finishStationIndicator.needsDisplayOnBoundsChange = YES;
    finishStationIndicator.zPosition = 100;
    [finishStationIndicator setAnchorPoint:CGPointMake(0.5, 0.5)];
    [finishStationIndicator setBounds:CGRectMake(0, 0, 126, 126)];
    finishStationIndicator.position = CGPointMake(-1000, -1000);
    [routeLayer addSublayer:finishStationIndicator];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [self.metroMapScrollView addGestureRecognizer:singleTap];

    // Подписываемся на события
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    // обновления схемы метро
    [notificationCenter addObserver:self selector:@selector(metroMapDownloaded:) name:@"metroMapDownloaded" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeStartStation) name:@"changeStartStation" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeFinishStation) name:@"changeFinishStation" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeMetroMap) name:@"changeMetroMap" object:nil];
    [notificationCenter addObserver:self selector:@selector(setText) name:@"changeLanguage" object:nil];
}

- (void)changeMetroMap
{
    oldGeoFoundStation = nil;
    oldOffset = CGPointZero;
    oldZoom = 0;
    [self loadMetroMap];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if ((connectingAlert || !self.view.window) && [MWSettings currentMetroMapIdentifier].length > 0) return;
 
    CLLocation *location = [locations lastObject];

#ifndef DEBUG
    [Flurry setLatitude:location.coordinate.latitude longitude:location.coordinate.longitude horizontalAccuracy:location.horizontalAccuracy verticalAccuracy:location.verticalAccuracy];
#endif
    
    static CLLocation *oldLocation;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWLine *line;
    
    NSTimeInterval age = [[location timestamp] timeIntervalSinceNow];
    
    BOOL newCoordinate = (location.coordinate.latitude != oldLocation.coordinate.latitude) || (location.coordinate.longitude != oldLocation.coordinate.longitude);

    if ((ABS(age) < 5.0) && (newCoordinate)) {
        currentGeoFoundStation = [MWLocation searchNearestStation:metroMap coordinate:location.coordinate accuracyInMeters:1000];

        MWList *list = [MWStorage metroMapList];
        list.currentCoordinate = location.coordinate;
        if (currentGeoFoundStation) {
            line = [MWRouter lineByStation:currentGeoFoundStation];
            if (![nearestStationindicatorColor isEqual:line.color]) {
                nearestStationindicatorColor = line.color;
                [nearestStationIndicator setNeedsDisplay];
            }
        } else {
            // Данные старые
        }
        if (!oldGeoFoundStation) {
            firstZoom = true;
        }
        if ((!oldGeoFoundStation && currentGeoFoundStation) || (currentGeoFoundStation && nearestStationIndicator.opacity == 0)) {
            [self showIndicatorAnimation:currentGeoFoundStation];
            // Делаем найденную станцию начальной станцией маршрута
            if (!metroMap.startStation && !metroMap.finishStation) {
                metroMap.startStation = currentGeoFoundStation;
                [self setSearchPanel:YES];
                //[startStationIndicator setNeedsDisplay];
            }
        } else if (oldGeoFoundStation && !currentGeoFoundStation) {
            [self hideNearestStationIndicator:YES];
        } else if (oldGeoFoundStation && currentGeoFoundStation && ![oldGeoFoundStation isEqual:currentGeoFoundStation]) {
            [self moveIndicatorAnimation:oldGeoFoundStation.mapLocation to:currentGeoFoundStation.mapLocation];
        }
        oldGeoFoundStation = currentGeoFoundStation;
    }
}

- (void)saveScreenshots
{
    [MWDraw createBlurBackgrounds];

    NSString *cachesDirectory = [MWStorage cachesDirectory];
    NSString *fileName = @"bg.png";
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        self.backgroundImageView.image = image;
        image = nil;
    }

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error domain] == kCLErrorDomain) {
        // CoreLocation related errors
        switch ([error code]) {
            case kCLErrorLocationUnknown:
                // This error code is usually returned whenever the device has no data or WiFi connectivity,
                // or when the location cannot be determined for some other reason.
                // CoreLocation will keep trying, so you can keep waiting, or prompt the user.
                [self hideNearestStationIndicator:YES];
                break;
        }
    } else {
        // Non-CoreLocation errors
    }
}

- (void)showIndicatorAnimation:(MWStation *)station
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (firstZoom && !isRouteShow && metroMap.initialZoomScale == self.metroMapScrollView.zoomScale) [self showStation:station];

    nearestStationIndicator.opacity = 1;
    nearestStationIndicator.position = CGPointMake(station.mapLocation.x, station.mapLocation.y);
    nearestStationIndicator.zPosition = 20;
    
    CABasicAnimation *theAnimation;
    
    theAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration = 2.25;
    theAnimation.repeatCount = 1;
    theAnimation.autoreverses = NO;
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    theAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    theAnimation.toValue = [NSNumber numberWithFloat:1.0];
    [nearestStationIndicator addAnimation:theAnimation forKey:@"animateOpacity"];
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(4.0, 4.0, 1);
    CATransform3D scale2 = CATransform3DMakeScale(0.7, 0.7, 1);
    CATransform3D scale3 = CATransform3DMakeScale(1.2, 1.2, 1);
    [bounce setValues:[NSArray arrayWithObjects:
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:scale1],
                       [NSValue valueWithCATransform3D:scale2],
                       [NSValue valueWithCATransform3D:scale3],
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       nil]];
    [bounce setDuration:2.25];
    [bounce setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [nearestStationIndicator addAnimation:bounce forKey:@"bounceAnimation"];
}

- (void)hideNearestStationIndicator:(BOOL)animation
{
    oldGeoFoundStation = nil;
    currentGeoFoundStation = nil;
    nearestStationIndicator.opacity = 0;
    nearestStationIndicator.zPosition = -20;
    
    if (animation) {
        CABasicAnimation *theAnimation;
        theAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        theAnimation.duration = 2.25;
        theAnimation.repeatCount = 1;
        theAnimation.autoreverses = NO;
        theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        theAnimation.fromValue = [NSNumber numberWithFloat:1.0];
        theAnimation.toValue = [NSNumber numberWithFloat:0.0];
        [nearestStationIndicator addAnimation:theAnimation forKey:@"animateOpacity"];
        
        CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        CATransform3D scale1 = CATransform3DMakeScale(1.5, 1.5, 1);
        //CATransform3D scale2 = CATransform3DMakeScale(0.1, 0.1, 1);
        [bounce setValues:[NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DIdentity],
                           [NSValue valueWithCATransform3D:scale1],
                           //[NSValue valueWithCATransform3D:scale2],
                           [NSValue valueWithCATransform3D:CATransform3DIdentity],
                           nil]];
        [bounce setDuration:2.25];
        [bounce setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [nearestStationIndicator addAnimation:bounce forKey:@"bounceAnimation"];
    }
}

- (void)moveIndicatorAnimation:(CGPoint)position1 to:(CGPoint)position2
{
    nearestStationIndicator.opacity = 1;
    nearestStationIndicator.position = CGPointMake(position2.x, position2.y);
    
    CABasicAnimation *theAnimation;
    
    theAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    theAnimation.duration = 2.25;
    theAnimation.repeatCount = 1;
    theAnimation.autoreverses = NO;
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    theAnimation.fromValue = [NSValue valueWithCGPoint:position1];
    theAnimation.toValue = [NSValue valueWithCGPoint:position2];
    [nearestStationIndicator addAnimation:theAnimation forKey:@"animatePosition"];
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.metroMapImageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context
{
    if (layer == routeLayer) {
        float alpha = isRouteShow ? 0.75 : 0.0;
        CGColorRef whiteColor = [[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:alpha] CGColor];
        CGContextSetFillColorWithColor(context, whiteColor);
        CGContextFillRect(context, CGRectMake(0, 0, layer.bounds.size.width, layer.bounds.size.height));
        
        if (isRouteShow) {
            MWRouter *router = [MWRouter router];
            if (selectedRouteIndex >= router.routes.count) return;
            NSMutableArray *route = router.routes[selectedRouteIndex];

            // Инициализируем маршрут и переходы (прописываем маршруты в вершинах)
            [[MWRouter router] routeTransfers:route];

            // Получаем область, где располагается маршрут
            CGRect routeFrame = [MWDraw drawRoute:route layer:layer inContext:context];

            // Увеличиваем область на индикаторы начальной и конечных станций на 21 пиксель
            
            MWMetroMap *metroMap = [MWStorage currentMetroMap];
            MWStation *startStation = metroMap.startStation;
            MWStation *finishStation = metroMap.finishStation;
            
            float x1, x2, y1, y2;
            
            float delta = 63;
            
            if (startStation.mapLocation.x - delta < routeFrame.origin.x) {
                x1 = startStation.mapLocation.x - delta;
            } else {
                x1 = routeFrame.origin.x;
            }
            
            if (startStation.mapLocation.x + delta > routeFrame.origin.x + routeFrame.size.width) {
                x2 = startStation.mapLocation.x + delta;
            } else {
                x2 = routeFrame.origin.x + routeFrame.size.width;
            }
            
            if (startStation.mapLocation.y - delta < routeFrame.origin.y) {
                y1 = startStation.mapLocation.y - delta;
            } else {
                y1 = routeFrame.origin.y;
            }
            
            if (startStation.mapLocation.y + delta > routeFrame.origin.y + routeFrame.size.height) {
                y2 = startStation.mapLocation.y + delta;
            } else {
                y2 = routeFrame.origin.y + routeFrame.size.height;
            }
            
            if (finishStation.mapLocation.x - delta < routeFrame.origin.x) {
                x1 = finishStation.mapLocation.x - delta;
            }
            
            if (finishStation.mapLocation.x + delta > routeFrame.origin.x + routeFrame.size.width) {
                x2 = finishStation.mapLocation.x + delta;
            }
            
            if (finishStation.mapLocation.y - delta < routeFrame.origin.y) {
                y1 = finishStation.mapLocation.y - delta;
            }
            
            if (finishStation.mapLocation.y + delta > routeFrame.origin.y + routeFrame.size.height) {
                y2 = finishStation.mapLocation.y + delta;
            }
            
            routeFrame = CGRectMake(x1, y1, x2 - x1, y2 - y1);
            
            
            // Увеличиваем область на 30 пикселей по краям
            delta = 30;
            
            x1 = routeFrame.origin.x - delta;
            if (x1 < 0) {
                x1 = 0;
            }
            
            x2 = routeFrame.origin.x + routeFrame.size.width + delta;
            if (x2 > layer.bounds.size.width) {
                x2 = layer.bounds.size.width;
            }
            
            y1 = routeFrame.origin.y - delta;
            if (y1 < 0) {
                y1 = 0;
            }
            
            y2 = routeFrame.origin.y + routeFrame.size.height + delta;
            if (y2 > layer.bounds.size.height) {
                y2 = layer.bounds.size.height;
            }
            
            routeFrame = CGRectMake(x1, y1, x2 - x1, y2 - y1);
            
            // Находим область, в которую нам надо вписаться
            CGRect targetFrame = CGRectMake(0, self.metroMapScrollView.bounds.origin.y, self.metroMapScrollView.bounds.size.width, self.view.bounds.size.height - 86.5 - routeButton1.bounds.size.height);
            
            // Ищем коэффициент масштабирования
            float zoom = MIN(targetFrame.size.width / routeFrame.size.width, targetFrame.size.height / routeFrame.size.height);
            
            // Устанавливаем коэффициент масштабирования
            [self.metroMapScrollView setZoomScale:zoom animated:YES];
     
            float delta_x = 0;
            float delta_y = 0;
            
            if (targetFrame.size.width > routeFrame.size.width * self.metroMapScrollView.zoomScale) {
                delta_x = (targetFrame.size.width - routeFrame.size.width * self.metroMapScrollView.zoomScale) / 2;
            }

            if (targetFrame.size.height> routeFrame.size.height * self.metroMapScrollView.zoomScale) {
                delta_y = (targetFrame.size.height - routeFrame.size.height * self.metroMapScrollView.zoomScale) / 2;
            }

            // Позиционируем маршрут в видимую область
            [self.metroMapScrollView setContentOffset:CGPointMake(routeFrame.origin.x * self.metroMapScrollView.zoomScale - delta_x, routeFrame.origin.y * self.metroMapScrollView.zoomScale - delta_y) animated:YES];
        }
    } else if (layer == nearestStationIndicator) {
        // Рисуем залитый круг с прозрачностью 10%

        if (!currentGeoFoundStation)
            return;
        
        MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];
        fillCircle.center = CGPointMake(100, 100);
        fillCircle.radius = 75;
        fillCircle.fillColor = [MWDraw colorByChangingAlphaTo:0.1 forColor:nearestStationindicatorColor];
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
        MWDrawArc *drawArc1 = [[MWDrawArc alloc] init];
        drawArc1.startRadians = 0;
        drawArc1.endRadians = 2 * M_PI;
        drawArc1.radius = 73;
        drawArc1.width = 2;
        drawArc1.center = CGPointMake(100, 100);
        drawArc1.color = nearestStationindicatorColor;
        [MWDraw drawArc:drawArc1 inContext:context];

        MWDrawArc *drawArc2 = [[MWDrawArc alloc] init];
        drawArc2.center = CGPointMake(100, 100);
        drawArc2.startRadians = 0;
        drawArc2.endRadians = 2 * M_PI;
        drawArc2.radius = 2;
        drawArc2.width = 4;
        drawArc2.color = [UIColor whiteColor];
        [MWDraw drawArc:drawArc2 inContext:context];
    } else if (layer == startStationIndicator || layer == finishStationIndicator) {
        MWDrawFillCircle *fillCircle1 = [[MWDrawFillCircle alloc] init];
        fillCircle1.center = CGPointMake(63, 63);
        fillCircle1.radius = 60;
        fillCircle1.fillColor = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:0.3];
        [MWDraw drawFillCircle:fillCircle1 inContext:context];
        
        MWDrawArc *drawArc1 = [[MWDrawArc alloc] init];
        drawArc1.startRadians = 0;
        drawArc1.endRadians = 2 * M_PI;
        drawArc1.radius = 61;
        drawArc1.width = 3;
        drawArc1.center = CGPointMake(63, 63);
        drawArc1.color = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:1];
        [MWDraw drawArc:drawArc1 inContext:context];

        MWDrawFillCircle *fillCircle2 = [[MWDrawFillCircle alloc] init];
        fillCircle2.center = CGPointMake(63, 63);
        fillCircle2.radius = 21;
        fillCircle2.fillColor = [UIColor whiteColor];
        [MWDraw drawFillCircle:fillCircle2 inContext:context];

        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        MWStation *station = layer == startStationIndicator ? metroMap.startStation : metroMap.finishStation;
        
        MWLine *line = [MWRouter lineByStation:station];
        
        MWDrawFillCircle *fillCircle3 = [[MWDrawFillCircle alloc] init];
        fillCircle3.center = CGPointMake(63, 63);
        fillCircle3.radius = 13;
        fillCircle3.fillColor = line.color;
        [MWDraw drawFillCircle:fillCircle3 inContext:context];
    } else if (layer == routeListLayer) {
        [MWDraw drawRouteList:compactRoute layer:layer inContext:context];
    }
}

// Получение текущего (выбранного) маршрута
- (NSArray *)selectedRoute
{
    NSArray *result;
    MWRouter *router = [MWRouter router];
    
    if (selectedRouteIndex >= router.routes.count) return result;
    return router.routes[selectedRouteIndex];
}

// Если зуммированное изображение маленькое, масштабируем его по центру
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    UIView *subView = [scrollView.subviews objectAtIndex:0];
    
    CGFloat offsetX = MAX((scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5, 0.0);
    CGFloat offsetY = MAX((scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5, 0.0);
    
    subView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                 scrollView.contentSize.height * 0.5 + offsetY);
}
	
// Переходим на экран главного меню
- (IBAction)menuButton:(id)sender
{
    MWMenuViewController *menuViewController = [[MWMenuViewController alloc] init];
//    menuViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:menuViewController animated:YES completion:nil];
}

- (void)showRoutes
{
    MWRouter *router = [MWRouter router];
    
    if (!isRouteShow) {
        [router searchRoutes];
        int correctStatus = [router postCorrectStations];

        MWMetroMap *metroMap = [MWStorage currentMetroMap];

        if (correctStatus == 1) {
            [UIView animateWithDuration:0.5 animations:^(void){
                startStationIndicator.position = metroMap.startStation.mapLocation;
            }];
            [self setSearchPanel:YES];
        } else if (correctStatus == 2) {
            [UIView animateWithDuration:0.5 animations:^(void){
                finishStationIndicator.position = metroMap.finishStation.mapLocation;
            }];
            [self setSearchPanel:NO];
        } else if (correctStatus == 3) {
            [UIView animateWithDuration:0.5 animations:^(void){
                startStationIndicator.position = metroMap.startStation.mapLocation;
                finishStationIndicator.position = metroMap.finishStation.mapLocation;
            }];
            [self setSearchPanel:YES];
            [self setSearchPanel:NO];
        }
        selectedRouteIndex = 0;
        [[MWStorage routeStorage] addLastRoute:metroMap.startStation.identifier station2:metroMap.finishStation.identifier];
        [self drawRoute];
    }
    
    int routes = (int)router.routes.count;
    
    // Проверяем, отображаются ли кнопки навигации
    if (routeButton1.frame.origin.y < self.view.bounds.size.height) { // Если кнопка выше уровня экрана
        // Кнопки отображаются. Поэтому их сначала надо спрятать, затем инициализировать и снова показать
        // Анимация с утопанием кнопок
        [UIView animateWithDuration:0.5 animations:^{
            routeButton1.frame = CGRectMake(routeButton1.frame.origin.x, self.view.bounds.size.height, routeButton1.frame.size.width, routeButton1.frame.size.height);
            routeButton2.frame = CGRectMake(routeButton2.frame.origin.x, self.view.bounds.size.height, routeButton2.frame.size.width, routeButton2.frame.size.height);
            routeButton3.frame = CGRectMake(routeButton3.frame.origin.x, self.view.bounds.size.height, routeButton3.frame.size.width, routeButton3.frame.size.height);
            routeButton4.frame = CGRectMake(routeButton4.frame.origin.x, self.view.bounds.size.height, routeButton4.frame.size.width, routeButton4.frame.size.height);
        }
                         completion:^(BOOL finished) {
                             routeButton1.state = UIControlStateSelected;
                             routeButton2.state = UIControlStateNormal;
                             routeButton3.state = UIControlStateNormal;
                             selectedRouteIndex = 0;
                             [self showRoutes];
                         }
         ];
    } else {
        // Инициализация кнопок
        switch (routes) {
            case 1:
                routeButton1.position = CGPointMake(116, self.view.bounds.size.height);
                routeButton1.tripTime = [router routeTripTime:router.routes[0]];
                routeButton1.transfers = [router routeTransfers:router.routes[0]];
                routeButton1.hidden = NO;
                routeButton2.hidden = YES;
                routeButton3.hidden = YES;
                routeButton4.hidden = NO;
                routeButton4.frame = CGRectMake(239, self.view.bounds.size.height, 75, 75);
                break;
            case 2:
                routeButton1.position = CGPointMake(28, self.view.bounds.size.height);
                routeButton1.tripTime = [router routeTripTime:router.routes[0]];
                routeButton1.transfers = [router routeTransfers:router.routes[0]];
                routeButton2.position = CGPointMake(137.5, self.view.bounds.size.height);
                routeButton2.tripTime = [router routeTripTime:router.routes[1]];
                routeButton2.transfers = [router routeTransfers:router.routes[1]];
                routeButton1.hidden = NO;
                routeButton2.hidden = NO;
                routeButton3.hidden = YES;
                routeButton4.hidden = NO;
                routeButton4.frame = CGRectMake(224, self.view.bounds.size.height, 75, 75);
                break;
            case 3:
                routeButton1.position = CGPointMake(6.5, self.view.bounds.size.height);
                routeButton1.tripTime = [router routeTripTime:router.routes[0]];
                routeButton1.transfers = [router routeTransfers:router.routes[0]];
                routeButton2.position = CGPointMake(84, self.view.bounds.size.height);
                routeButton2.tripTime = [router routeTripTime:router.routes[1]];
                routeButton2.transfers = [router routeTransfers:router.routes[1]];
                routeButton3.position = CGPointMake(161.5, self.view.bounds.size.height);
                routeButton3.tripTime = [router routeTripTime:router.routes[2]];
                routeButton3.transfers = [router routeTransfers:router.routes[2]];
                routeButton1.hidden = NO;
                routeButton2.hidden = NO;
                routeButton3.hidden = NO;
                routeButton4.hidden = NO;
                routeButton4.frame = CGRectMake(239, self.view.bounds.size.height, 75, 75);
                break;
            default:
                break;
        }
        // Анимация со всплытием кнопок
        [UIView animateWithDuration:0.5 animations:^{
            routeButton1.frame = CGRectMake(routeButton1.frame.origin.x, self.view.bounds.size.height - 86.5, routeButton1.frame.size.width, routeButton1.frame.size.height);
            routeButton2.frame = CGRectMake(routeButton2.frame.origin.x, self.view.bounds.size.height - 86.5, routeButton2.frame.size.width, routeButton2.frame.size.height);
            routeButton3.frame = CGRectMake(routeButton3.frame.origin.x, self.view.bounds.size.height - 86.5, routeButton3.frame.size.width, routeButton3.frame.size.height);
            routeButton4.frame = CGRectMake(routeButton4.frame.origin.x, self.view.bounds.size.height - 86.5, 75, 75);
        }];
    }
}

- (void)hideRoutes
{
    if (self.metroMapScrollView.alpha < 1) {
        [self clickOnRouteButton4];
    }

    // Проверяем, отображаются ли кнопки навигации
    if (routeButton1.frame.origin.y < self.view.bounds.size.height) { // Если кнопка выше уровня экрана
        // Анимация с утопанием кнопок
        [UIView animateWithDuration:0.5 animations:^{
            routeButton1.frame = CGRectMake(routeButton1.frame.origin.x, self.view.bounds.size.height, routeButton1.frame.size.width, routeButton1.frame.size.height);
            routeButton2.frame = CGRectMake(routeButton2.frame.origin.x, self.view.bounds.size.height, routeButton2.frame.size.width, routeButton2.frame.size.height);
            routeButton3.frame = CGRectMake(routeButton3.frame.origin.x, self.view.bounds.size.height, routeButton3.frame.size.width, routeButton3.frame.size.height);
            routeButton4.frame = CGRectMake(routeButton4.frame.origin.x, self.view.bounds.size.height, routeButton4.frame.size.width, routeButton4.frame.size.height);
        } completion:^(BOOL finished){
            routeButton1.hidden = YES;
            routeButton2.hidden = YES;
            routeButton3.hidden = YES;
            routeButton4.hidden = YES;
        }];
    }
    [self clearRoute];
    routeButton1.state = UIControlStateSelected;
    routeButton2.state = UIControlStateNormal;
    routeButton3.state = UIControlStateNormal;
}

- (void)alertShow
{
    [connectingAlert show];
}

//show loading activity.
- (void)startSpinner:(NSString *)message {
    //  Purchasing Spinner.
    if (!connectingAlert) {
        connectingAlert = [[UIAlertView alloc] initWithTitle:message
                                                     message:nil
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:nil];
        [self performSelectorOnMainThread:@selector(alertShow) withObject:nil waitUntilDone:YES];
    }
}

//hide loading activity.
- (void)stopSpinner {
    if (connectingAlert) {
        [connectingAlert dismissWithClickedButtonIndex:0 animated:YES];
        connectingAlert = nil;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
        if (buttonIndex == 1) {
            // Обновляем экран для показа новой версии карты
            [self loadMetroMap];
        }
    }
}

- (void)preCorrectStations
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    if (!metroMap.startStation || !metroMap.finishStation) return;
    
    MWStation *startStation = metroMap.startStation;
    MWStation *finishStation = metroMap.finishStation;
    
    [[MWRouter router] preCorrectStations];
    
    if (metroMap.startStation != startStation) {
        [self setSearchPanel:YES];
        [startStationIndicator setNeedsDisplay];
        [UIView animateWithDuration:0.5 animations:^(void){
            startStationIndicator.position = metroMap.startStation.mapLocation;
        }];
    }
    
    if (metroMap.finishStation != finishStation) {
        [self setSearchPanel:NO];
        [finishStationIndicator setNeedsDisplay];
        [UIView animateWithDuration:0.5 animations:^(void){
            finishStationIndicator.position = metroMap.finishStation.mapLocation;
        }];
    }
}

///////// Реализация pop-up menu ///////////////

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    CGPoint touchPoint = [gesture locationInView:self.metroMapImageView];
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    tapStation = [metroMap selectedStation:touchPoint];

    if (tapStation) {
        if (!metroMap.startStation) {
            if ([metroMap.finishStation isEqual:tapStation]) {
                metroMap.startStation = tapStation;
                metroMap.finishStation = nil;
                [self setSearchPanel:YES];
                [self setSearchPanel:NO];
                [self hideRoutes];
            } else {
                metroMap.startStation = tapStation;
                [self preCorrectStations];
                [self setSearchPanel:YES];
                if (metroMap.startStation && metroMap.finishStation) {
                    isRouteShow = NO;
                    [self performSelectorOnMainThread:@selector(showRoutes) withObject:nil waitUntilDone:NO];
                }
            }
        } else if (metroMap.startStation && !metroMap.finishStation) {
            if ([metroMap.startStation isEqual:tapStation]) {
                metroMap.startStation = nil;
                metroMap.finishStation = tapStation;
                [self setSearchPanel:YES];
                [self setSearchPanel:NO];
                [self hideRoutes];
            } else {
                metroMap.finishStation = tapStation;
                [self preCorrectStations];
                [self setSearchPanel:NO];
                isRouteShow = NO;
                [self performSelectorOnMainThread:@selector(showRoutes) withObject:nil waitUntilDone:NO];
            }
        } else { // Временно показываем системное меню
            [self becomeFirstResponder];
            UIMenuController *menuController = [UIMenuController sharedMenuController];
            UIMenuItem *from = [[UIMenuItem alloc] initWithTitle:[MWLanguage localizedStringForKey:@"MetroMap_FromMenuTitle"] action:@selector(fromMenuItemTap:)];
            UIMenuItem *to   = [[UIMenuItem alloc] initWithTitle:[MWLanguage localizedStringForKey:@"MetroMap_ToMenuTitle"] action:@selector(toMenuItemTap:)];
            [menuController setMenuItems:[NSArray arrayWithObjects:from, to, nil]];
            [menuController setTargetRect:CGRectMake(tapStation.mapLocation.x, tapStation.mapLocation.y, 0, 0) inView:self.metroMapImageView];
            [menuController setMenuVisible:YES animated:YES];
        }
    }
}

///////// Реализация pop-up menu ///////////////
- (void)fromMenuItemTap:(id)sender
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if ([metroMap.finishStation isEqual:tapStation]) {
        metroMap.finishStation = nil;
        [self setSearchPanel:NO];
        [self hideRoutes];
    }
    metroMap.startStation = tapStation;
    [self preCorrectStations];
    [self setSearchPanel:YES];
    if (metroMap.startStation && metroMap.finishStation) {
        isRouteShow = NO;
        [self showRoutes];
    }
}

- (void)toMenuItemTap:(id)sender
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if ([metroMap.startStation isEqual:tapStation]) {
        metroMap.startStation = nil;
        [self setSearchPanel:YES];
        [self hideRoutes];
    }
    metroMap.finishStation = tapStation;
    [self preCorrectStations];
    [self setSearchPanel:NO];
    if (metroMap.startStation && metroMap.finishStation) {
        isRouteShow = NO;
        [self showRoutes];
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(fromMenuItemTap:) || action == @selector(toMenuItemTap:)) {
        return YES;
    }
    return NO;
}

- (void)searchStartStationClose:(id)sender {
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    metroMap.startStation = nil;
    [self setSearchPanel:YES];
    [self hideRoutes];
}

- (void)searchFinishStationClose:(id)sender {
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    metroMap.finishStation = nil;
    [self setSearchPanel:NO];
    [self hideRoutes];
}

- (void)showSearchView:(BOOL)for_From
{
    MWSearchStationViewController *searchStationViewController = [[MWSearchStationViewController alloc] init];
    searchStationViewController.is_From = for_From;
    searchStationViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:searchStationViewController animated:YES completion:nil];
}

- (IBAction)searchStartStation:(id)sender {
    [self showSearchView:YES];
}

- (IBAction)searchFinishStation:(id)sender {
    [self showSearchView:NO];
}

- (void)drawRoute
{
    isRouteShow = true;
    
    // Инициализируем маршрут и переходы (прописываем маршруты в вершинах)
    [[MWRouter router] routeTransfers:[self selectedRoute]];
    
    // Устанавливаем размеры для изображения маршрута списком
    compactRoute = [MWRouter compactRoute:[self selectedRoute]];

    float heightRouteList = [MWDraw routeListLength:compactRoute];
    if (heightRouteList < self.metroMapScrollView.bounds.size.height) {
        heightRouteList = self.metroMapScrollView.bounds.size.height;
    }
    
    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, heightRouteList);
    
    // Устанавливаем размеры слоя
    self.routeListView.frame = frame;
    routeListLayer.frame = frame;
    self.routeListScrollView.contentSize = frame.size;
    self.routeListScrollView.contentOffset = CGPointZero;
    routeListLayer.contentsScale = [[UIScreen mainScreen] scale];
    
    [routeLayer setNeedsDisplay];
    [routeListLayer setNeedsDisplay];
}

- (void)clearRoute
{
    isRouteShow = false;
    [[MWRouter router] clearRoutes];
    [routeLayer setNeedsDisplay];
}

- (void)clickOnRouteButton:(MWRouteButton *)button;
{
    if (button.state == UIControlStateSelected && self.routeListScrollView.alpha > 0) {
        [UIView animateWithDuration: 0.5 animations:^{
            self.routeListScrollView.contentOffset = CGPointZero;
        }
                         completion:^(BOOL finished) {
                         }
         ];
        return;
    } else {
        routeButton1.state = [button isEqual:routeButton1] ? UIControlStateSelected : UIControlStateNormal;
        routeButton2.state = [button isEqual:routeButton2] ? UIControlStateSelected : UIControlStateNormal;
        routeButton3.state = [button isEqual:routeButton3] ? UIControlStateSelected : UIControlStateNormal;
        [self drawRoute];
    }
}

- (void)clickOnRouteButton1
{
    selectedRouteIndex = 0;
    [self clickOnRouteButton:routeButton1];
}

- (void)clickOnRouteButton2
{
    selectedRouteIndex = 1;
    [self clickOnRouteButton:routeButton2];
}

- (void)clickOnRouteButton3
{
    selectedRouteIndex = 2;
    [self clickOnRouteButton:routeButton3];
}

- (void)clickOnRouteButton4
{
    // Меняем иконку кнопки
    NSString *iconName = self.metroMapScrollView.alpha == 1 ? @"List2.png" : @"List1.png";
    [routeButton4 setBackgroundImage: [UIImage imageNamed:iconName] forState:UIControlStateNormal];
//    routeButton4.tintColor = [UIColor whiteColor];
    
    [UIView animateWithDuration: 0.5 animations:^{
        self.metroMapScrollView.alpha = self.metroMapScrollView.alpha ? 0 : 1;
        self.routeListScrollView.alpha = self.routeListScrollView.alpha ? 0 : 1;
    }
                     completion:^(BOOL finished) {
                     }
    ];
}

- (void)setText // Вызывается, если изменяется язык интерфейса
{
    // Перерисовываем текст на кнопках
    [self setSearchPanel:YES];
    [self setSearchPanel:NO];
    if (isRouteShow) {
        [self showRoutes];
    }
}

// Позиционируем карту для показа выбранной станции
- (void)showStation:(MWStation *)station
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    float scale = nearestStationIndicator.frame.size.width * 8 / metroMap.image.size.width;
    [self.metroMapScrollView setZoomScale:scale animated:NO];
    
    float posx = station.mapLocation.x * scale - self.metroMapScrollView.bounds.size.width / 2;
    float posy = station.mapLocation.y * scale - self.metroMapScrollView.bounds.size.height / 2;
    
    CGPoint offset = CGPointMake(posx, posy);
    [self.metroMapScrollView setContentOffset:offset animated:YES];
}

// Вызывается при получении извещения о наступлении события - изменение начальной станции маршрута
- (void)changeStartStation
{
    [self preCorrectStations];
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    // Перерисовываем текст на кнопках
    [self setSearchPanel:YES];
    
    if (metroMap.startStation && metroMap.finishStation) {
        isRouteShow = NO;
        [self showRoutes];
    } else {
        if (!metroMap.finishStation) {
            [self showStation:metroMap.startStation];
        }
        [self hideRoutes];
    }
}

// Вызывается при получении извещения о наступлении события - изменение конечной станции маршрута
- (void)changeFinishStation
{
    [self preCorrectStations];
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    // Перерисовываем текст на кнопках
    [self setSearchPanel:NO];
    
    if (metroMap.startStation && metroMap.finishStation) {
        isRouteShow = NO;
        [self showRoutes];
    } else {
        if (!metroMap.startStation) {
            [self showStation:metroMap.finishStation];
        }
        [self hideRoutes];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end

