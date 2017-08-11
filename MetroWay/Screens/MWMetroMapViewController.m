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
#import "MWInApp.h"
#import "MWRoute.h"

@interface MWMetroMapViewController () 

@end

@implementation MWMetroMapViewController

@synthesize tapStation;

CALayer *routeLayer;
CALayer *routeListLayer;
CALayer *nearestStationIndicator;
UIColor *nearestStationIndicatorColor = nil;
CALayer *nearestStationListIndicator;
CALayer *startStationIndicator;
CALayer *finishStationIndicator;
static MWStation *currentGeoFoundStation = nil;
static MWStation *oldGeoFoundStation = nil;
float buttonHeight = 75;
static bool firstZoom = TRUE;
UIAlertView *alertView;
MWRouteButton *routeButton1, *routeButton2, *routeButton3;
UIButton *routeButton4;
UITapGestureRecognizer *singleTap;
BOOL isRouteShow = false; // Показывается ли в данный момент маршрут
MWRoute *compactRoute;
int selectedRouteIndex = 0;
bool isFavoriteRouteShow = false;
MWSortingType oldSortingType = MWSortingTypeByTripTime;
bool changeSortingType = false;
bool locationManagerEnabled = false;
bool isSelectedStationExplorerShowed = true;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Делаем заголовок темным
    [self setNeedsStatusBarAppearanceUpdate];

    [self initControls];
    [self startGeoLocation];

    _fade = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _fade.alpha = 0;
    _fade.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:0.6];
    _fade.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_fade];
    [self.view bringSubviewToFront:_fade];
    _HUD = [[MWHUD alloc] initWithViewController:self];

    if ([MWSettings settings].currentMetroMapIdentifier.length == 0) {
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
    
    if (![MWSettings settings].areAdsRemoved) {
        [self initAds];
    }
}

- (GADInterstitial *)createAndLoadInterstitial {
    GADInterstitial *interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-1260741043780513/5688055982"];
    interstitial.delegate = self;
    GADRequest *request = [GADRequest request];
    request.testDevices = @[@"f3a49736ea3e45b30526ceea64f83cb3", @"fe81554d053eb0b5be7d5620dc02e2e1", @"4c889edd2688e377ef57271cb2a7edb1", kGADSimulatorID];
    CLLocation *currentLocation = locationManager.location;
    if (currentLocation) {
        [request setLocationWithLatitude:currentLocation.coordinate.latitude
                               longitude:currentLocation.coordinate.longitude
                                accuracy:currentLocation.horizontalAccuracy];
    }
    [interstitial loadRequest:request];
    return interstitial;
}

- (void)initAds
{
    // Выводим банер вверху экрана
    self.bannerView.adUnitID = @"ca-app-pub-1260741043780513/5688055982";
    self.bannerView.rootViewController = self;
    //    self.bannerView.adSize = kGADAdSizeSmartBannerPortrait;
    [self.view bringSubviewToFront:_bannerView];
    
    //    NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[@"f3a49736ea3e45b30526ceea64f83cb3", @"fe81554d053eb0b5be7d5620dc02e2e1", @"4c889edd2688e377ef57271cb2a7edb1", kGADSimulatorID];
    CLLocation *currentLocation = locationManager.location;
    if (currentLocation) {
        [request setLocationWithLatitude:currentLocation.coordinate.latitude
                               longitude:currentLocation.coordinate.longitude
                                accuracy:currentLocation.horizontalAccuracy];
    }
//    [self.bannerView loadRequest:request];
    
    // Подготавливаем полноэкранный банер
    self.interstitial = [self createAndLoadInterstitial];
}

- (void)removeAds
{
    dispatch_async(dispatch_get_main_queue(), ^{
        _bannerView.hidden = true;
        _bannerView.alpha = 0.0;
        
        // Дезактивируем таймер
        [_interstitialBannerTimer invalidate];
        _interstitialBannerTimer = nil;
        
        [self hideHUD];
    });
}

bool bannerShowed = false;
bool removeAdsAlertShowed = false;

- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
    bannerShowed = true;
    self.interstitial = [self createAndLoadInterstitial];

    // Дезактивируем предыдущий таймер
    [_interstitialBannerTimer invalidate];
    _interstitialBannerTimer = nil;

    // Один раз из десяти показываем окошко с предложением удаления рекламы. Оно выводится единожды
    int randomRemoveAdsAlert = [self randomInRangeLo:0 toHi:9];
    
    if (randomRemoveAdsAlert == 0 && !removeAdsAlertShowed) {
        removeAdsAlertShowed = true;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"MetroMap_RemoveAdsAlertTitle"]
                                               message:[MWLanguage localizedStringForKey:@"MetroMap_RemoveAdsAlertMessage"]
                                              delegate:self
                                     cancelButtonTitle:[MWLanguage localizedStringForKey:@"MetroMap_RemoveAdsAlertCancel"]
                                     otherButtonTitles:[MWLanguage localizedStringForKey:@"MetroMap_RemoveAdsAlertBuy"], nil];
        alertView.tag = 2;
        [alertView show];
    } else {
        int randomTimeInterval = [self randomInRangeLo:10 toHi:60];
        _interstitialBannerTimer = [NSTimer scheduledTimerWithTimeInterval:randomTimeInterval target:self selector:@selector(showInterstitialBanner) userInfo:nil repeats:NO];
    }
}

// Получаем случайное число в заданном диапазоне
- (u_int32_t)randomInRangeLo:(u_int32_t)loBound toHi:(u_int32_t)hiBound
{
    int32_t range = hiBound - loBound + 1;
    return loBound + arc4random_uniform(range);
}

- (void)showInterstitialBanner
{
    if ([self.interstitial isReady] && self.isViewLoaded && self.view.window) {
        [self.interstitial presentFromRootViewController:self];
    } else {
        // Дезактивируем предыдущий таймер
        [_interstitialBannerTimer invalidate];
        _interstitialBannerTimer = nil;

        // Запускаем таймер для показа полноэкранного банера
        // Выбираем время запуска от 10 до 60 секунд случайным образом
        int randomTimeInterval = [self randomInRangeLo:10 toHi:60];
        _interstitialBannerTimer = [NSTimer scheduledTimerWithTimeInterval:randomTimeInterval target:self selector:@selector(showInterstitialBanner) userInfo:nil repeats:NO];
    }
}

// Есть новое обновление для карты. Спрашиваем, нужно ли обновить карту
- (void)metroMapDownloaded:(NSNotification *)notification
{
    if (!oldMetroMapIdentifier.length) return;
    if ([MWSettings settings].runCount < 2) return;
    
    NSString *identifier = [notification.userInfo objectForKey:@"identifier"];
    if (![identifier isEqualToString:[MWSettings settings].currentMetroMapIdentifier]) {
        return;
    }
    
    if ([[MWStorage storage].firstMetroMapIdentifier isEqualToString:identifier]) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self stopSpinner];
        alertView = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"SelectMap_UpdateMapAlertTitle"]
                                                 message:nil
                                                delegate:self
                                       cancelButtonTitle:[MWLanguage localizedStringForKey:@"SelectMap_UpdateMapAlertLaterButtonTitle"]
                                       otherButtonTitles:[MWLanguage localizedStringForKey:@"SelectMap_UpdateMapAlertUpdateButtonTitle"], nil];
        alertView.tag = 1;
        [alertView show];
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
        locationManager.distanceFilter = kCLDistanceFilterNone;
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) [locationManager requestWhenInUseAuthorization];
        [locationManager startUpdatingLocation];
        [locationManager startUpdatingHeading];
        
        // requestAlwaysAuthorization
        // requestWhenInUseAuthorization
        
    } else {
        // Геолокационные службы не активизированы
        if (locationManager) {
            [locationManager stopUpdatingLocation];
            [locationManager startUpdatingLocation];
        }
    }
}

- (void)initMetroMapControls:(BOOL)setZoomAndContentOffset showHUD:(BOOL)showHUD;
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (showHUD) {
            [self showHUD:false];
        }

        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        
        self.launchImageView.image = nil;
        self.launchImageView = nil;
        
        self.metroMapImageView.image = nil;
        self.metroMapImageView = nil;
        
        self.metroMapImageView = [[UIImageView alloc] initWithImage:metroMap.image];

        self.metroMapScrollView.contentSize = metroMap.image.size;
        self.metroMapScrollView.delegate = self;
        self.routeListScrollView.delegate = self;

        self.metroMapScrollView.maximumZoomScale = metroMap.maximumZoomScale;
        self.metroMapScrollView.minimumZoomScale = metroMap.minimumZoomScale;
        
        if (setZoomAndContentOffset && oldZoom) {
            firstZoom = false;
            [self.metroMapScrollView setZoomScale:oldZoom animated:NO];
            [self.metroMapScrollView setContentOffset:oldOffset animated:NO];
            if (oldGeoFoundStation && currentGeoFoundStation) {
                nearestStationIndicator.opacity = 1;
                nearestStationIndicator.position = currentGeoFoundStation.mapLocation;
                nearestStationIndicator.zPosition = 20;
                
                nearestStationListIndicator.opacity = 1;
                nearestStationListIndicator.position = currentGeoFoundStation.listLocation;
                nearestStationListIndicator.zPosition = 20;
            }
        } else {
            [self.metroMapScrollView setZoomScale:metroMap.initialZoomScale animated:NO];
            [self.metroMapScrollView setContentOffset:metroMap.contentOffset animated:NO];
            [self hideNearestStationIndicator:false];
            [self hideNearestStationListIndicator:false];
        }
        
        [self.metroMapScrollView addSubview:self.metroMapImageView];
        CGRect frame = _metroMapImageView.frame;
        
        if (_metroMapImageView.frame.size.width < _metroMapScrollView.frame.size.width) {
            frame.origin.x = (_metroMapScrollView.frame.size.width - _metroMapImageView.frame.size.width) / 2;
            CGPoint offset = metroMap.contentOffset;
            offset.x = 0;
            _metroMapScrollView.contentOffset = offset;
        }
        
        if (_metroMapImageView.frame.size.height < _metroMapScrollView.frame.size.height) {
            frame.origin.y = (_metroMapScrollView.frame.size.height - _metroMapImageView.frame.size.height) / 2;
            CGPoint offset = metroMap.contentOffset;
            offset.y = 0;
            _metroMapScrollView.contentOffset = offset;
        }
        
        _metroMapImageView.frame = frame;
        
        [self setSearchButtons];
        
        [routeLayer removeFromSuperlayer];
        [self.metroMapImageView.layer addSublayer:routeLayer];
        [routeLayer setBounds:CGRectMake(0.0, 0.0, self.metroMapImageView.image.size.width, self.metroMapImageView.image.size.height)];
        [NSThread detachNewThreadSelector:@selector(saveScreenshots) toTarget:self withObject:nil];
        
        [self hideHUD];
        
        UIColor *backgroundColor1 = [MWDraw colorAtPosition:metroMap.image atPosition:CGPointMake(metroMap.image.size.width - 1, metroMap.image.size.height - 1)];

        _metroMapScrollView.backgroundColor = backgroundColor1;
    });
}

static NSString *oldMetroMapIdentifier = nil;
static float oldZoom = 0;
static CGPoint oldOffset;
BOOL needToReloadMap = NO;

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self dismissOwnScreens];
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    oldMetroMapIdentifier = metroMap.identifier;
    oldZoom = self.metroMapScrollView.zoomScale;
    oldOffset = self.metroMapScrollView.contentOffset;
}

bool changingEnglishTitle = false;

- (void)loadMetroMap
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        
        if (metroMap.englishTextExists && [MWStorage needChangeEnglishSet:metroMap]) {
            [self startSpinner:[MWLanguage localizedStringForKey:metroMap.englishTextDrawn ? @"MetroMap_SpinnerDeletingEnglishTextTitle" : @"MetroMap_SpinnerAddingEnglishTextTitle"]];
            
            if ([oldMetroMapIdentifier isEqualToString:metroMap.identifier]) {
                oldZoom = self.metroMapScrollView.zoomScale;
                oldOffset = self.metroMapScrollView.contentOffset;
            } else {
                [self initMetroMapControls:NO showHUD:false];
            }
            needToReloadMap = YES;
            
            changingEnglishTitle = true;
            
            [NSThread detachNewThreadSelector:@selector(setEnglishTitles) toTarget:self withObject:nil];
        } else {
            // Если iOS <= 8, показываем alertView
            NSOperatingSystemVersion version;
            version.majorVersion = 8;
            version.minorVersion = 0;
            version.patchVersion = 0;
            if (![[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:version]) {
                [self startSpinner:[MWLanguage localizedStringForKey:@"MetroMap_SpinnerLoadingMapTitle"]];
            }
            
            if ([metroMap.identifier isEqualToString:oldMetroMapIdentifier]) {
                //[self startGeoLocation];
            }
            
            // Если схема поменялась, прячем маршруты от старой схемы
            if (![metroMap.identifier isEqualToString:oldMetroMapIdentifier]) {
                [[MWRouter router] clearRoutes];
                [self hideRoutes];
                oldMetroMapIdentifier = metroMap.identifier;
                needToReloadMap = YES;
            }
            
            if (needToReloadMap) {
                [self initMetroMapControls:[[MWSettings settings].currentMetroMapIdentifier isEqualToString:metroMap.identifier] showHUD:!changingEnglishTitle];
                needToReloadMap = NO;
            }
            
            changingEnglishTitle = false;
            [self stopSpinner];
        }
    });
}

// Установка верхних панелей для выбора станций
- (void)setSearchPanel:(BOOL)isStartStation
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self updateDirectionToSelectedStation];
        [self updateDistanceToSelectedStation];
        
        float animateDuration = 0.5;
        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        MWStation *station = isStartStation ? metroMap.startStation : metroMap.finishStation;
        UIButton *background = isStartStation ? self.searchStartStationBackgroung : self.searchFinishStationBackground;
        UIButton *icon = isStartStation ? self.searchStartStationButton : self.searchFinishStationButton;
        UILabel *label = isStartStation ? self.searchStartStationLabel : self.searchFinishStationLabel;

        if (metroMap.startStation) {
            [self showSelectedStationExplorer];
        } else {
            [self hideSelectedStationExplorer];
        }
        
        CGRect frame;
        frame.origin.y = 29;
        frame.size.width = ([UIScreen mainScreen].bounds.size.width - 86) / 2;
        frame.origin.x = 61;
        frame.size.height = 35;
        
        MWLine *line;
        
        float explorerWidth = ([UIScreen mainScreen].bounds.size.width - 86) / 2 - 7;
        
        CGRect explorerFrame = _directionImageView.frame;
        
        explorerFrame.origin.x = 72;
        explorerFrame.origin.y = 62;
        explorerFrame.size.width = explorerWidth / 4 - 4;
        explorerFrame.size.height = explorerFrame.size.width * 1.2;
        
        _directionImageView.frame = explorerFrame;
        
        UIImage *directionImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:@"direction.png"] scaledToMaxWidth:explorerFrame.size.width height:explorerFrame.size.height];
        _directionImageView.image = directionImage;
        
        explorerFrame.origin.x = explorerFrame.origin.x + explorerFrame.size.width + 10;
        explorerFrame.size.width = explorerWidth * 3 / 4 - 14;
        _distanceLabel.frame = explorerFrame;

        if (station) line = [MWRouter lineByStation:station];
        
        if (isStartStation) {
            frame.size.height = 42 + explorerFrame.size.height;
            if (line) _distanceLabel.textColor = [MWDraw readableForegroundColorForBackgroundColor:line.color];
        } else {
            frame.origin.x += frame.size.width + 15;
            _searchFinishStationBackground.frame = frame;
        }

        background.layer.cornerRadius = 6;
        
        if (station) {
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
                
                float left = isStartStation ? 69 : background.frame.origin.x + 8;
                label.frame = CGRectMake(left, 31, background.frame.size.width - 36, 30);
                label.textColor = [MWDraw readableForegroundColorForBackgroundColor:line.color];
                label.text = station.nameOriginal;
                
                UIImage *magnifierImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:[label.textColor isEqual:[UIColor whiteColor]] ? @"CloseWhite.png" : @"CloseBlack.png"] scaledToMaxWidth:19 height:19];
                [icon setImage:magnifierImage forState:UIControlStateNormal];
                
                left = isStartStation ? _searchStartStationBackgroung.frame.origin.x + _searchStartStationBackgroung.frame.size.width - 36 : _searchFinishStationBackground.frame.origin.x + _searchFinishStationBackground.frame.size.width - 36;
                icon.frame = CGRectMake(left, 19, 46, 55);
                icon.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
                
                if (isStartStation) {
                    if (startStationIndicator.position.x == -100) {
                        [self setStationIndication:true];
                    } else {
                        [self setStationIndication:true];
                    }
                } else {
                    if (finishStationIndicator.position.x == -100) {
                        [self setStationIndication:false];
                    } else {
                        [self setStationIndication:false];
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
                
                icon.imageEdgeInsets = UIEdgeInsetsZero;
                UIImage *magnifierImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:@"Magnifier.png"] scaledToMaxWidth:16 height:16];
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
    });
}

- (void)setSearchButtons
{
    [self setSearchPanel:YES];
    [self setSearchPanel:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSString *metroMapIdentifier = [MWSettings settings].currentMetroMapIdentifier;
    
    BOOL metroMapCorrect = metroMapIdentifier.length > 0 && [MWStorage metroMapExists:metroMapIdentifier] && [MWStorage metroMapSize:metroMapIdentifier] > 100;
    
    if (!metroMapCorrect) {
        MWMetroMapsViewController *metroMapsViewController = [[MWMetroMapsViewController alloc] init];
        [self presentViewController:metroMapsViewController animated:NO completion:nil];
    } else {
        [self loadMetroMap];
    }
    
    [self startGeoLocation];

    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(startGeoLocation) userInfo:nil repeats:YES];

    if (![MWSettings settings].areAdsRemoved) {
        // Дезактивируем предыдущий таймер
        [_interstitialBannerTimer invalidate];
        _interstitialBannerTimer = nil;
        
        int randomTimeInterval = [self randomInRangeLo:10 toHi:60];
        _interstitialBannerTimer = [NSTimer scheduledTimerWithTimeInterval:randomTimeInterval target:self selector:@selector(showInterstitialBanner) userInfo:nil repeats:NO];
    }
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
    [self performSelectorOnMainThread:@selector(loadMetroMap) withObject:nil waitUntilDone:NO];
    if (isRouteShow) {
        [routeLayer setNeedsDisplay];
        [routeListLayer setNeedsDisplay];
    }
    block = false;
}

// Инициализация элементов управления
- (void)initControls
{
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

    nearestStationListIndicator = [[CALayer alloc] init];
    nearestStationListIndicator.delegate = self;
    nearestStationListIndicator.needsDisplayOnBoundsChange = YES;
    nearestStationListIndicator.zPosition = 100;
    [nearestStationListIndicator setAnchorPoint:CGPointMake(0.5, 0.5)];
    [nearestStationListIndicator setBounds:CGRectMake(0, 0, 200, 200)];
    [routeListLayer addSublayer:nearestStationListIndicator];

    // Настраиваем кнопки маршрутов
    routeButton1 = [[MWRouteButton alloc] initWithPosition:CGPointMake(13, self.view.bounds.size.height)];
    routeButton1.tag = 0;
    routeButton1.state = UIControlStateSelected;
    UITapGestureRecognizer *touchOnView1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnRouteButton1)];
    [routeButton1 addGestureRecognizer:touchOnView1];
    UILongPressGestureRecognizer *longPressGestureRecognizer1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressOnRouteButton:)];
    [routeButton1 addGestureRecognizer:longPressGestureRecognizer1];
    
    routeButton2 = [[MWRouteButton alloc] initWithPosition:CGPointMake(90.5, self.view.bounds.size.height)];
    routeButton2.tag = 1;
    UITapGestureRecognizer *touchOnView2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnRouteButton2)];
    [routeButton2 addGestureRecognizer:touchOnView2];
    UILongPressGestureRecognizer *longPressGestureRecognizer2 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressOnRouteButton:)];
    [routeButton2 addGestureRecognizer:longPressGestureRecognizer2];
    
    routeButton3 = [[MWRouteButton alloc] initWithPosition:CGPointMake(168, self.view.bounds.size.height)];
    routeButton3.tag = 2;
    UITapGestureRecognizer *touchOnView3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnRouteButton3)];
    [routeButton3 addGestureRecognizer:touchOnView3];
    UILongPressGestureRecognizer *longPressGestureRecognizer3 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressOnRouteButton:)];
    [routeButton3 addGestureRecognizer:longPressGestureRecognizer3];
    
    routeButton4 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *routeButton4Image = [MWDraw resizeImageWithAspect:[UIImage imageNamed:@"List1.png"] scaledToMaxWidth:75 height:75];
    [routeButton4 setBackgroundImage: routeButton4Image forState:UIControlStateNormal];
    routeButton4.frame = CGRectMake(224.5, self.view.bounds.size.height, 75, 75);
    routeButton4.contentMode = UIViewContentModeCenter;
    routeButton4.tintColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    routeButton4.layer.cornerRadius = 6;
    routeButton4.tag = 3;
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
    startStationIndicator.position = CGPointMake(-100, -100);
    [routeLayer addSublayer:startStationIndicator];
    
    finishStationIndicator = [[CALayer alloc] init];
    finishStationIndicator.delegate = self;
    finishStationIndicator.needsDisplayOnBoundsChange = YES;
    finishStationIndicator.zPosition = 100;
    [finishStationIndicator setAnchorPoint:CGPointMake(0.5, 0.5)];
    [finishStationIndicator setBounds:CGRectMake(0, 0, 126, 126)];
    finishStationIndicator.position = CGPointMake(-100, -100);
    [routeLayer addSublayer:finishStationIndicator];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [self.metroMapScrollView addGestureRecognizer:singleTap];

    [_menuButton setImage:[MWDraw resizeImageWithAspect:[UIImage imageNamed:@"Menu.png"] scaledToMaxWidth:32 height:20] forState:UIControlStateNormal];
    
    CGRect frame;
    frame.origin.y = 29;
    frame.size.width = ([UIScreen mainScreen].bounds.size.width - 86) / 2;
    frame.origin.x = 61;
    frame.size.height = 35;
    
    /////
    float explorerWidth = ([UIScreen mainScreen].bounds.size.width - 86) / 2 - 7;
    
    CGRect explorerFrame = _directionImageView.frame;
    
    explorerFrame.origin.x = 72;
    explorerFrame.origin.y = 62;
    explorerFrame.size.width = explorerWidth / 4 - 4;
    explorerFrame.size.height = explorerFrame.size.width * 1.2;
    
    _directionImageView.frame = explorerFrame;
    
    UIImage *directionImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:@"direction.png"] scaledToMaxWidth:explorerFrame.size.width height:explorerFrame.size.height];
    _directionImageView.image = directionImage;
    
    explorerFrame.origin.x = explorerFrame.origin.x + explorerFrame.size.width + 10;
    explorerFrame.size.width = explorerWidth * 3 / 4 - 14;
    _distanceLabel.frame = explorerFrame;
    
    frame.size.height = 42 + explorerFrame.size.height;
    _searchStartStationBackgroung.frame = frame;
    
    [self hideSelectedStationExplorer];
    /////
    
    // Подписываемся на события
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(dismissOwnScreens)];
    [self.view addGestureRecognizer:tapRecognizer];
    
    // обновления схемы метро
    [notificationCenter addObserver:self selector:@selector(metroMapDownloaded:) name:@"metroMapDownloaded" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeStartStation) name:@"changeStartStation" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeFinishStation) name:@"changeFinishStation" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeRoute) name:@"changeRoute" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeMetroMap) name:@"changeMetroMap" object:nil];
    [notificationCenter addObserver:self selector:@selector(setText) name:@"changeLanguage" object:nil];
    
    [notificationCenter addObserver:self selector:@selector(removeAds) name:@"removeAds" object:nil];
    [notificationCenter addObserver:self selector:@selector(hideHUD) name:@"hideInAppHUD" object:nil];
    [notificationCenter addObserver:self selector:@selector(inAppRestored) name:@"inAppRestored" object:nil];
    [notificationCenter addObserver:self selector:@selector(inAppCancelled) name:@"inAppCancelled" object:nil];
    [notificationCenter addObserver:self selector:@selector(needToShowFavoriteRoute:) name:@"needToShowFavoriteRoute" object:nil];
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
    if ((alertView || !self.view.window) && [MWSettings settings].currentMetroMapIdentifier.length > 0) return;
 
    locationManagerEnabled = true;

    [self showSelectedStationExplorer];
    
    CLLocation *location = [locations lastObject];

    static CLLocation *oldLocation;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWLine *line;
    MWStation *oldStation = currentGeoFoundStation;
    
    NSTimeInterval age = [[location timestamp] timeIntervalSinceNow];
    
    BOOL newCoordinate = (location.coordinate.latitude != oldLocation.coordinate.latitude) || (location.coordinate.longitude != oldLocation.coordinate.longitude);

    if ((ABS(age) < 5.0) && (newCoordinate)) {
        currentGeoFoundStation = [MWLocation searchNearestStation:metroMap coordinate:location.coordinate accuracyInMeters:1000];
        if (oldStation != currentGeoFoundStation) [self setSearchPanel:YES];

        [self updateDistanceToSelectedStation];

        if ([currentGeoFoundStation isClosed]) currentGeoFoundStation = nil;
        
        MWList *list = [MWStorage metroMapList];
        list.currentCoordinate = location.coordinate;
        if (currentGeoFoundStation) {
            line = [MWRouter lineByStation:currentGeoFoundStation];
            if (![nearestStationIndicatorColor isEqual:line.color]) {
                nearestStationIndicatorColor = line.color;
                [nearestStationIndicator setNeedsDisplay];
                [nearestStationListIndicator setNeedsDisplay];
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
            }
        } else if (oldGeoFoundStation && !currentGeoFoundStation) {
            [self hideNearestStationIndicator:YES];
            [self hideNearestStationListIndicator:YES];
        } else if (oldGeoFoundStation && currentGeoFoundStation && ![oldGeoFoundStation isEqual:currentGeoFoundStation]) {
            [self moveIndicatorAnimation:oldGeoFoundStation.mapLocation to:currentGeoFoundStation.mapLocation];
            [self moveIndicatorListAnimation:oldGeoFoundStation.listLocation to:currentGeoFoundStation.listLocation];
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
        
        locationManagerEnabled = false;
        [self hideNearestStationIndicator:YES];
        [self hideNearestStationListIndicator:YES];
        [self hideSelectedStationExplorer];

        
/*        switch ([error code]) {
            case kCLErrorLocationUnknown:
                // This error code is usually returned whenever the device has no data or WiFi connectivity,
                // or when the location cannot be determined for some other reason.
                // CoreLocation will keep trying, so you can keep waiting, or prompt the user.
                locationManagerEnabled = false;
                [self hideNearestStationIndicator:YES];
                [self hideNearestStationListIndicator:YES];
                [self hideSelectedStationExplorer];
                break;
        } */
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

- (void)showIndicatorListAnimation:(MWStation *)station
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (firstZoom && !isRouteShow && metroMap.initialZoomScale == self.metroMapScrollView.zoomScale) [self showStation:station];
    
    nearestStationListIndicator.opacity = 1;
    nearestStationListIndicator.position = CGPointMake(station.listLocation.x, station.listLocation.y);
    nearestStationListIndicator.zPosition = 20;
    
    if (self.routeListScrollView.alpha == 1) { // Показываем анимацию только в случае, если отображается маршрут списком
        CABasicAnimation *theAnimation;
    
        theAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        theAnimation.duration = 2.25;
        theAnimation.repeatCount = 1;
        theAnimation.autoreverses = NO;
        theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        theAnimation.fromValue = [NSNumber numberWithFloat:0.0];
        theAnimation.toValue = [NSNumber numberWithFloat:1.0];
        [nearestStationListIndicator addAnimation:theAnimation forKey:@"animateOpacity"];
    
        CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
        CATransform3D scale1 = CATransform3DMakeScale(1.2, 1.2, 1);
        [bounce setValues:[NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:CATransform3DIdentity],
                        [NSValue valueWithCATransform3D:scale1],
                        [NSValue valueWithCATransform3D:CATransform3DIdentity],
                        nil]];
        [bounce setDuration:2.25];
        [bounce setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [nearestStationListIndicator addAnimation:bounce forKey:@"bounceAnimation"];
    }
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
        [bounce setValues:[NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DIdentity],
                           [NSValue valueWithCATransform3D:scale1],
                           [NSValue valueWithCATransform3D:CATransform3DIdentity],
                           nil]];
        [bounce setDuration:2.25];
        [bounce setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [nearestStationIndicator addAnimation:bounce forKey:@"bounceAnimation"];
    }
}

- (void)hideNearestStationListIndicator:(BOOL)animation
{
    nearestStationListIndicator.opacity = 0;
    nearestStationListIndicator.zPosition = -20;
    
    if (animation) {
        CABasicAnimation *theAnimation;
        theAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        theAnimation.duration = 2.25;
        theAnimation.repeatCount = 1;
        theAnimation.autoreverses = NO;
        theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        theAnimation.fromValue = [NSNumber numberWithFloat:1.0];
        theAnimation.toValue = [NSNumber numberWithFloat:0.0];
        [nearestStationListIndicator addAnimation:theAnimation forKey:@"animateOpacity"];
        
        CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        CATransform3D scale1 = CATransform3DMakeScale(1.5, 1.5, 1);
        [bounce setValues:[NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DIdentity],
                           [NSValue valueWithCATransform3D:scale1],
                           [NSValue valueWithCATransform3D:CATransform3DIdentity],
                           nil]];
        [bounce setDuration:2.25];
        [bounce setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [nearestStationListIndicator addAnimation:bounce forKey:@"bounceAnimation"];
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

- (void)moveIndicatorListAnimation:(CGPoint)position1 to:(CGPoint)position2
{
    nearestStationListIndicator.opacity = 1;
    nearestStationListIndicator.position = CGPointMake(position2.x, position2.y);
    
    CABasicAnimation *theAnimation;
    
    theAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    theAnimation.duration = 2.25;
    theAnimation.repeatCount = 1;
    theAnimation.autoreverses = NO;
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    theAnimation.fromValue = [NSValue valueWithCGPoint:position1];
    theAnimation.toValue = [NSValue valueWithCGPoint:position2];
    [nearestStationListIndicator addAnimation:theAnimation forKey:@"animatePosition"];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.metroMapImageView;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context
{
    if (layer == routeLayer) {
        float alpha = isRouteShow ? 0.75 : 0.0;
        CGColorRef whiteColor = [[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:alpha] CGColor];
        CGContextSetFillColorWithColor(context, whiteColor);
        CGContextFillRect(context, CGRectMake(0, 0, layer.bounds.size.width, layer.bounds.size.height));
        
        if (isRouteShow) {
            MWMetroMap *metroMap = [MWStorage currentMetroMap];
            
            if (!metroMap.startStation || !metroMap.finishStation) {
                [[MWRouter router] clearRoutes];
                [self hideRoutes];
                return;
            }
            
            MWRouter *router = [MWRouter router];
            if (selectedRouteIndex >= router.routes.count) return;
            NSMutableArray *route = router.routes[selectedRouteIndex];

            // Инициализируем маршрут и переходы (прописываем маршруты в вершинах)
//            [[MWRouter router] routeTransfers:route];

            // Получаем область, где располагается маршрут
            CGRect routeFrame = [MWDraw drawRoute:route layer:layer inContext:context];

            // Увеличиваем область на размер индикаторов начальной и конечных станций
            
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

            [UIView animateWithDuration:0.2 animations:^{
                _metroMapImageView.frame = CGRectMake(0, 0, _metroMapScrollView.contentSize.width, _metroMapScrollView.contentSize.height);
            }];
            
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
        fillCircle.fillColor = [MWDraw colorByChangingAlphaTo:0.1 forColor:nearestStationIndicatorColor];
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
        MWDrawArc *drawArc1 = [[MWDrawArc alloc] init];
        drawArc1.startRadians = 0;
        drawArc1.endRadians = 2 * M_PI;
        drawArc1.radius = 73;
        drawArc1.width = 2;
        drawArc1.center = CGPointMake(100, 100);
        drawArc1.color = nearestStationIndicatorColor;
        [MWDraw drawArc:drawArc1 inContext:context];

        MWDrawArc *drawArc2 = [[MWDrawArc alloc] init];
        drawArc2.center = CGPointMake(100, 100);
        drawArc2.startRadians = 0;
        drawArc2.endRadians = 2 * M_PI;
        drawArc2.radius = 2;
        drawArc2.width = 4;
        drawArc2.color = [UIColor whiteColor];
        [MWDraw drawArc:drawArc2 inContext:context];
    } else if (layer == nearestStationListIndicator) {
        // Рисуем залитый круг с прозрачностью 10%
        
        if (!currentGeoFoundStation)
            return;
        
        MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];
        fillCircle.center = CGPointMake(100, 100);
        fillCircle.radius = 42;
        fillCircle.fillColor = [MWDraw colorByChangingAlphaTo:0.1 forColor:nearestStationIndicatorColor];
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
        MWDrawArc *drawArc1 = [[MWDrawArc alloc] init];
        drawArc1.startRadians = 0;
        drawArc1.endRadians = 2 * M_PI;
        drawArc1.radius = 40;
        drawArc1.width = 2;
        drawArc1.center = CGPointMake(100, 100);
        drawArc1.color = [MWDraw colorByChangingAlphaTo:0.5 forColor:nearestStationIndicatorColor];
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
        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        if (!metroMap) return;
        
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

        MWStation *station = layer == startStationIndicator ? metroMap.startStation : metroMap.finishStation;
        
        MWLine *line = [MWRouter lineByStation:station];
        if (!line) return;
        
        MWDrawFillCircle *fillCircle3 = [[MWDrawFillCircle alloc] init];
        fillCircle3.center = CGPointMake(63, 63);
        fillCircle3.radius = 13;
        fillCircle3.fillColor = line.color;
        [MWDraw drawFillCircle:fillCircle3 inContext:context];
    } else if (layer == routeListLayer) {
        float routeListHeight = [MWDraw drawRouteList:compactRoute layer:layer inContext:context] + 140;
        
        if (routeListHeight < self.metroMapScrollView.bounds.size.height) {
            routeListHeight = self.metroMapScrollView.bounds.size.height;
        }
        
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, routeListHeight);

        // Устанавливаем размеры слоя
        self.routeListScrollView.contentSize = frame.size;
        self.routeListScrollView.contentOffset = CGPointZero;
        routeListLayer.contentsScale = [[UIScreen mainScreen] scale];

        if (currentGeoFoundStation != nil) {
            [self showIndicatorListAnimation:currentGeoFoundStation];
        }
    }
}

// Получение текущего (выбранного) маршрута
- (MWRoute *)selectedRoute
{
    MWRoute *result;
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
    MWMenuViewController *menuviewController = [[MWMenuViewController alloc] init];
//    menuviewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:menuviewController animated:YES completion:nil];
}

- (void)showRoutes
{
    if (!isRouteShow) {
        [NSThread detachNewThreadSelector:@selector(searchRoutesInThread) toTarget:self withObject:nil];
    }
//    [self switchRouteButtons];
    [self hideRouteButtons];
}

- (void)searchRoutesInThread
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWRouter *router = [MWRouter router];

    [router searchRoutes];
    [[MWStorage routeStorage] addLastRoute:metroMap.startStation.identifier station2:metroMap.finishStation.identifier];

    int correctStatus = [router postCorrectStations];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (correctStatus == 1) {
            [self setStationIndication:true];
            [self setSearchPanel:YES];
        } else if (correctStatus == 2) {
            [self setStationIndication:false];
            [self setSearchPanel:NO];
        } else if (correctStatus == 3) {
            [self setStationIndication:true];
            [self setStationIndication:false];
            [self setSearchPanel:YES];
            [self setSearchPanel:NO];
        }
        if (!isFavoriteRouteShow) {
            selectedRouteIndex = 0;
        }
        [self showRouteButtons];
        [self drawRoute];
        isFavoriteRouteShow = false;
        
        if (changeSortingType) {
            [MWSettings settings].sortingType = oldSortingType;
            changeSortingType = false;
        }
        
        if (!bannerShowed) {
            // Дезактивируем предыдущий таймер
            [_interstitialBannerTimer invalidate];
            _interstitialBannerTimer = nil;
            
            int randomTimeInterval = [self randomInRangeLo:3 toHi:10];
            _interstitialBannerTimer = [NSTimer scheduledTimerWithTimeInterval:randomTimeInterval target:self selector:@selector(showInterstitialBanner) userInfo:nil repeats:NO];
        }
    });
}

- (void)switchRouteButtons
{
    // Проверяем, отображаются ли кнопки навигации
    if (routeButton1.frame.origin.y == self.view.bounds.size.height - 86.5) {
        [self hideRouteButtons];
    } else {
        [self showRouteButtons];
    }
}

bool needToShowRouteButtons = false;
bool routeButtonsInAnimation = false;

- (void)hideRouteButtons
{
    routeButtonsInAnimation = true;
    // Кнопки отображаются. Поэтому их сначала надо спрятать, затем инициализировать и снова показать
    // Анимация с утопанием кнопок
    [UIView animateWithDuration:0.5 animations:^{
        routeButton1.frame = CGRectMake(routeButton1.frame.origin.x, self.view.bounds.size.height, routeButton1.frame.size.width, routeButton1.frame.size.height);
        routeButton2.frame = CGRectMake(routeButton2.frame.origin.x, self.view.bounds.size.height, routeButton2.frame.size.width, routeButton2.frame.size.height);
        routeButton3.frame = CGRectMake(routeButton3.frame.origin.x, self.view.bounds.size.height, routeButton3.frame.size.width, routeButton3.frame.size.height);
        routeButton4.frame = CGRectMake(routeButton4.frame.origin.x, self.view.bounds.size.height, routeButton4.frame.size.width, routeButton4.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         if (!isFavoriteRouteShow) {
                             selectedRouteIndex = 0;
                         }
                         
                         routeButton1.state = selectedRouteIndex == 0 ? UIControlStateSelected : UIControlStateNormal;
                         routeButton2.state = selectedRouteIndex == 1 ? UIControlStateSelected : UIControlStateNormal;
                         routeButton3.state = selectedRouteIndex == 2 ? UIControlStateSelected : UIControlStateNormal;

                         routeButtonsInAnimation = false;
                         if (needToShowRouteButtons) {
                             needToShowRouteButtons = false;
                             [self showRouteButtons];
                         }
                     }
     ];
}

- (void)showRouteButtons
{
    if (routeButtonsInAnimation) {
        needToShowRouteButtons = true;
        return;
    }
    
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float buttonWidth = 75;
    float buttonSpace = screenWidth - buttonWidth;
    float buttonOffset;
    float buttonCenter = buttonSpace / 2;
    
    MWRouter *router = [MWRouter router];
    if (!(router.routes.count > 0)) return;
    
    int routes = (int)router.routes.count;
    MWRoute *route2, *route3;

    MWRoute *route1 = (MWRoute *)[router.routes objectAtIndex:0];
    
    if (router.routes.count > 1) {
        route2 = (MWRoute *)[router.routes objectAtIndex:1];
    }

    if (router.routes.count > 2) {
        route3 = (MWRoute *)[router.routes objectAtIndex:2];
    }

    // Инициализация кнопок
    switch (routes) {
        case 1:
            routeButton1.position = CGPointMake((screenWidth - buttonWidth) / 2, self.view.bounds.size.height);
            routeButton1.transfers = route1.transfers;
            routeButton1.tripTime = route1.tripTime;
            routeButton1.hidden = NO;
            routeButton2.hidden = YES;
            routeButton3.hidden = YES;
            routeButton4.hidden = NO;
            routeButton4.frame = CGRectMake(screenWidth - buttonWidth, self.view.bounds.size.height, 75, 75);
            break;
        case 2:
            buttonOffset = 20;
            routeButton1.position = CGPointMake(buttonCenter - buttonOffset / 2 - buttonWidth, self.view.bounds.size.height);
            routeButton1.transfers = route1.transfers;
            routeButton1.tripTime = route1.tripTime;
            routeButton2.position = CGPointMake(buttonCenter + buttonOffset / 2, self.view.bounds.size.height);
            
            routeButton2.tripTime = route2.tripTime;
            routeButton2.transfers = route2.transfers;
            
            routeButton1.hidden = NO;
            routeButton2.hidden = NO;
            routeButton3.hidden = YES;
            routeButton4.hidden = NO;
            routeButton4.frame = CGRectMake(screenWidth - buttonWidth, self.view.bounds.size.height, 75, 75);
            break;
        case 3:
            buttonOffset = 5;
            routeButton1.position = CGPointMake(buttonCenter - buttonWidth * 1.5 - buttonOffset, self.view.bounds.size.height);
            
            routeButton1.transfers = route1.transfers;
            routeButton1.tripTime = route1.tripTime;
            routeButton2.position = CGPointMake(buttonCenter - buttonWidth / 2, self.view.bounds.size.height);

            if (route2) {
                routeButton2.tripTime = route2.tripTime;
                routeButton2.transfers = route2.transfers;
            }
            
            routeButton3.position = CGPointMake(buttonCenter + buttonWidth / 2 + buttonOffset, self.view.bounds.size.height);

            if (route3) {
                routeButton3.tripTime = route3.tripTime;
                routeButton3.transfers = route3.transfers;
            }

            routeButton1.hidden = NO;
            routeButton2.hidden = NO;
            routeButton3.hidden = NO;
            routeButton4.hidden = NO;
            routeButton4.frame = CGRectMake(screenWidth - buttonWidth, self.view.bounds.size.height, 75, 75);
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

- (void)hideRoutes
{
    [self dismissOwnScreens];
    
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
    routeButton1.state = selectedRouteIndex == 0 ? UIControlStateSelected : UIControlStateNormal;
    routeButton2.state = selectedRouteIndex == 1 ? UIControlStateSelected : UIControlStateNormal;
    routeButton3.state = selectedRouteIndex == 2 ? UIControlStateSelected : UIControlStateNormal;
}

- (void)alertShow
{
    [alertView show];
}

//show loading activity.
- (void)startSpinner:(NSString *)message {
    //  Purchasing Spinner.
    if (!alertView) {
        alertView = [[UIAlertView alloc] initWithTitle:message
                                                     message:nil
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:nil];
        [self performSelectorOnMainThread:@selector(alertShow) withObject:nil waitUntilDone:YES];
    }
}

//hide loading activity.
- (void)stopSpinner {
    if (alertView) {
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        alertView = nil;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
        if (buttonIndex == 1) {
            // Обновляем экран для показа новой версии карты
            [self loadMetroMap];
        }
    } else if (alertView.tag == 2) {
        if (buttonIndex == 0) { // Cancel
            [self interstitialDidDismissScreen:nil]; // Снова запускаем показ банеров
        } else if (buttonIndex == 1) { // Buy
            [self showHUD:true];
            [[MWInApp inAppManager] removeAds];
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
        [self setStationIndication:true];
    }
    
    if (metroMap.finishStation != finishStation) {
        [self setSearchPanel:NO];
        [finishStationIndicator setNeedsDisplay];
        [self setStationIndication:false];
    }
}

///////// Реализация pop-up menu ///////////////

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    [self dismissOwnScreens];
    CGPoint touchPoint = [gesture locationInView:self.metroMapImageView];
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    tapStation = [metroMap selectedStation:touchPoint];

    if ([tapStation isClosed]) {
        [self becomeFirstResponder];
        [self showCloseStationButton:tapStation];
        return;
    }
    
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
- (void)closedStationMenuItemTap:(id)sender
{
    
}

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

- (void)setStationIndication:(BOOL) startStation
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    CALayer *stationIndicator = startStation ? startStationIndicator : finishStationIndicator;
    MWStation *station = startStation ? metroMap.startStation : metroMap.finishStation;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [stationIndicator valueForKey:@"position"];
    animation.toValue = [NSValue valueWithCGPoint:station.mapLocation];
    animation.duration = 0.3;
    stationIndicator.position = station.mapLocation;
    dispatch_async(dispatch_get_main_queue(), ^{
        [stationIndicator addAnimation:animation forKey:@"position"];
    });
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
    [self showSearchStationViewController:self direction:for_From];
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

    // Устанавливаем размеры для изображения маршрута списком
    compactRoute = [MWRouter compactRoute:[self selectedRoute]];

    float heightRouteList = [MWDraw routeListLength:compactRoute];
      
    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, heightRouteList);
    // Устанавливаем размеры слоя
    self.routeListView.frame = frame;
    routeListLayer.frame = frame;
    self.routeListScrollView.contentSize = frame.size;
    self.routeListScrollView.contentOffset = CGPointZero;
    routeListLayer.contentsScale = [[UIScreen mainScreen] scale];
 
    [routeListLayer setNeedsDisplay];
    [routeLayer setNeedsDisplay];
}

- (void)clearRoute
{
    isRouteShow = false;
    [[MWRouter router] clearRoutes];
    [routeLayer setNeedsDisplay];
}

- (void)clickOnRouteButton:(MWRouteButton *)button;
{
    [self dismissOwnScreens];
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
    UIImage *routeButton4Image = [MWDraw resizeImageWithAspect:[UIImage imageNamed:iconName] scaledToMaxWidth:75 height:75];
    [routeButton4 setBackgroundImage: routeButton4Image forState:UIControlStateNormal];
    
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
    MWRouter *router = [MWRouter router];
    
    [router clearRoutes];
    
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

// Вызывается при получении извещения о наступлении события - выбор маршрута с новыми станциями
- (void)changeRoute
{
    [self preCorrectStations];
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    // Перерисовываем текст на кнопках
    [self setSearchPanel:true];
    [self setSearchPanel:false];
    
    if (metroMap.startStation && metroMap.finishStation) {
        isRouteShow = NO;
        [self showRoutes];
    }
}

// Вызывается при получении извещения о наступлении события - необходимости показа избранного маршрута
- (void)needToShowFavoriteRoute:(NSNotification *)notification
{
    [self preCorrectStations];
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    NSNumber *tempNumber;
    tempNumber = [notification.userInfo objectForKey:@"sortingType"];
    MWSortingType sortingType = (MWSortingType)[tempNumber intValue];

    tempNumber = [notification.userInfo objectForKey:@"routeNumber"];
    int routeNumber = [tempNumber intValue];
    
    selectedRouteIndex = routeNumber;
    
    // Перерисовываем текст на кнопках
    [self setSearchPanel:true];
    [self setSearchPanel:false];
    
    if (metroMap.startStation && metroMap.finishStation) {
        isRouteShow = NO;
        oldSortingType = [[MWSettings settings] sortingType];
        changeSortingType = true;
        [MWSettings settings].sortingType = sortingType;
        isFavoriteRouteShow = true;
        [self showRoutes];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)showSearchStationViewController:(UIViewController *)viewController direction:(BOOL)for_From
{
    MWSearchStationViewController *searchStationViewController = [[MWSearchStationViewController alloc] init];
    searchStationViewController.is_From = for_From;
    searchStationViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:searchStationViewController animated:YES completion:nil];
}

- (void)showStationListViewController:(UIViewController *)viewController direction:(BOOL)for_From
{
    MWStationListViewController *stationListViewController = [[MWStationListViewController alloc] init];
    stationListViewController.is_From = for_From;
    [self presentViewController:stationListViewController animated:YES completion:nil];
}

- (void)showHUD:(BOOL)fade
{
    _HUD.text = nil;
    [self.view bringSubviewToFront:_HUD.HUD];
    _HUD.spin.hidden = false;
    [_HUD show];
    if (fade) {
        [UIView animateWithDuration:0.5 animations:^{
            _fade.alpha = 1;
        }];
    }
}

- (void)hideHUD
{
    [UIView animateWithDuration:0.5 animations:^{
        _fade.alpha = 0;
    }];
    [_HUD hide];
}

- (void)inAppRestored
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"MainMenu_AdsRemovedTitle"] message:[MWLanguage localizedStringForKey:@"MainMenu_AdsRemovedMessage"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    });
}

- (void)inAppCancelled
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideHUD];
        [self interstitialDidDismissScreen:nil]; // Снова запускаем показ банеров
    });
}

- (void)longPressOnRouteButton:(id)sender
{
    UIGestureRecognizer *recognizer = (UIGestureRecognizer *)sender;
    
    if (recognizer.state == UIGestureRecognizerStateEnded ) {
        return;
    }

    [_routeContextMenu removeFromSuperview];
    _routeContextMenu = nil;
    
    [self showRouteContextMenu:(int)recognizer.view.tag];
}

- (void)showRouteContextMenu:(int)routeNumber
{
    float centerX;
    CGSize contextViewSize = CGSizeMake(101, 53);
    CGSize arrowDownSize = CGSizeMake(20.5, 6);
    
    switch (routeNumber) {
        case 0:
            centerX = routeButton1.center.x;
            break;
        case 1:
            centerX = routeButton2.center.x;
            break;
        case 2:
            centerX = routeButton3.center.x;
            break;
        default:
            break;
    }
    
    // Kill scroll
    [_metroMapScrollView setContentOffset:_metroMapScrollView.contentOffset animated:NO];
    [_routeListScrollView setContentOffset:_routeListScrollView.contentOffset animated:NO];

    _routeContextMenu = [[UIButton alloc] initWithFrame:CGRectMake(centerX - contextViewSize.width / 2, routeButton1.frame.origin.y - contextViewSize.height - arrowDownSize.height, contextViewSize.width, contextViewSize.height)];
    _routeContextMenu.backgroundColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    _routeContextMenu.layer.cornerRadius = 3.5;
    [_routeContextMenu addTarget:self action:@selector(dismissOwnScreens) forControlEvents:UIControlEventTouchUpOutside];
    
    UIImage *arrowDownImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:@"contextArrowDown.png"] scaledToMaxWidth:20.5 height:6];
    UIImageView *arrowDownImageView = [[UIImageView alloc] initWithImage:arrowDownImage];
    arrowDownImageView.frame = CGRectMake((_routeContextMenu.frame.size.width - 20.5) / 2, contextViewSize.height - 0.5, 20.5, 6);
    [_routeContextMenu addSubview:arrowDownImageView];
    
    BOOL isFavoriteRoute = [[MWStorage routeStorage] isFavoriteRoute:routeNumber];
  
    UIButton *starButton = [[UIButton alloc] initWithFrame:CGRectMake(6, 5.5, _routeContextMenu.frame.size.width - 12, _routeContextMenu.frame.size.height - 11)];
    UIImage *starImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:isFavoriteRoute ? @"whiteStarOn.png" : @"whiteStarOff.png"] scaledToMaxWidth:28.5 height:28.5];
    [starButton setImage:starImage forState:UIControlStateNormal];
    starButton.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
    starButton.tag = routeNumber;
    [starButton addTarget:self action:@selector(favoriteRouteTapped:) forControlEvents:UIControlEventTouchUpInside];
    starButton.layer.cornerRadius = 3.5;
    [_routeContextMenu addSubview:starButton];
    
    [self.view addSubview:_routeContextMenu];
}

- (void)showCloseStationButton:(MWStation *)closedStation
{
    float offset = 18 * _metroMapScrollView.zoomScale;
    
    CGPoint stationPoint = [self.view convertPoint:closedStation.mapLocation fromView:_metroMapImageView];
    
    NSString *closedText = [closedStation closedText];
    
    CGSize textSize = [closedText boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:18] } context:nil].size;
    
    CGSize contextViewSize = CGSizeMake(textSize.width + 36, textSize.height + 24);
    CGSize arrowDownSize = CGSizeMake(20.5, 6);

    // Определяем вышло ли окно за пределы левой части экрана
    BOOL leftFail = stationPoint.x - contextViewSize.width / 2 < 0;
    // Определяем вышло ли окно за пределы верхней части экрана
    BOOL topFail = stationPoint.y - contextViewSize.height - offset - 76 - arrowDownSize.height < 0;

    float x = 0;
    float y = 0;
    float arrowY = 0;
    float arrowX = 0;
    
    NSString *arrowName = @"contextArrowDown.png";
    
    if (leftFail) {
        x = stationPoint.x - 20;
        arrowX = 20 - arrowDownSize.width / 2;
    } else {
        x = stationPoint.x - contextViewSize.width / 2;
        arrowX = contextViewSize.width / 2 - arrowDownSize.width / 2;
    }
    
    if (topFail) {
        y = stationPoint.y + arrowDownSize.height + offset;
        arrowName = @"contextArrowUp.png";
        arrowY = -offset + arrowDownSize.height;
    } else {
        y = stationPoint.y - contextViewSize.height - arrowDownSize.height - offset;
        arrowY = contextViewSize.height - 1;
    }
    
    _closeStationButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, contextViewSize.width, contextViewSize.height)];
    _closeStationButton.backgroundColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    _closeStationButton.layer.cornerRadius = 3.5;
    [_closeStationButton addTarget:self action:@selector(dismissOwnScreens) forControlEvents:UIControlEventTouchUpOutside];
    [_closeStationButton addTarget:self action:@selector(dismissOwnScreens) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *messageButton = [[UIButton alloc] initWithFrame:CGRectMake(6, 5.5, _closeStationButton.frame.size.width - 12, _closeStationButton.frame.size.height - 11)];
    messageButton.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
    messageButton.titleLabel.font = [UIFont systemFontOfSize:18];
    messageButton.layer.cornerRadius = 3.5;
    [messageButton setTitle:closedText forState:UIControlStateNormal];
    [messageButton addTarget:self action:@selector(dismissOwnScreens) forControlEvents:UIControlEventTouchUpInside];
    [_closeStationButton addSubview:messageButton];

    UIImage *arrowDownImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:arrowName] scaledToMaxWidth:20.5 height:6];
    UIImageView *arrowDownImageView = [[UIImageView alloc] initWithImage:arrowDownImage];
    arrowDownImageView.frame = CGRectMake(arrowX, arrowY, 20.5, 6);
    [_closeStationButton addSubview:arrowDownImageView];

    [self.view addSubview:_closeStationButton];
}

- (void)favoriteRouteTapped:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    BOOL isFavoriteRoute = [[MWStorage routeStorage] isFavoriteRoute:(int)button.tag];
    
    MWRouter *router = [MWRouter router];
    
    MWRoute *route = [router.routes objectAtIndex:button.tag];
    
    int transfers = route.transfers;
    int tripTime = route.tripTime;
    
    NSString *details;
    
    if (transfers) {
        // "28 мин, пересадок - 1"
        details = [NSString stringWithFormat:@"%d %@, %@ - %d", tripTime, [MWLanguage localizedStringForKey:@"MetroMap_RouterMaps_min"], [MWLanguage localizedStringForKey:@"MetroMap_RouterMaps_transfers_full"], transfers];
    } else {
        // "28 мин"
        details = [NSString stringWithFormat:@"%d %@", tripTime, [MWLanguage localizedStringForKey:@"MetroMap_RouterMaps_min"]];
        
    }
    
    if (isFavoriteRoute) {
        [[MWStorage routeStorage] removeFavoriteRoute:metroMap.startStation.identifier station2:metroMap.finishStation.identifier routeNumber:(int)button.tag];
    } else {
        [[MWStorage routeStorage] addFavoriteRoute:(int)button.tag details:details];
    }

    isFavoriteRoute = !isFavoriteRoute;
    
    UIImage *starImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:isFavoriteRoute ? @"whiteStarOn.png" : @"whiteStarOff.png"] scaledToMaxWidth:28.5 height:28.5];
    [button setImage:starImage forState:UIControlStateNormal];

    [UIView animateWithDuration:1.0 animations:^{
        block = true;
        _routeContextMenu.alpha = 0;
    } completion:^(BOOL finished) {
        [_routeContextMenu removeFromSuperview];
        _routeContextMenu = nil;
        block = false;
    }];
}

BOOL block = false;

- (void)dismissOwnScreens
{
    [self dismissRouteContextMenu];
    [self dismissCloseStationButton];
}

- (void)dismissRouteContextMenu
{
    if (!_routeContextMenu || block) {
        return;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        block = true;
        _routeContextMenu.alpha = 0;
    } completion:^(BOOL finished) {
        [_routeContextMenu removeFromSuperview];
        _routeContextMenu = nil;
        block = false;
    }];
}

- (void)dismissCloseStationButton
{
    if (!_closeStationButton || block) {
        return;
    }
    
    [UIView animateWithDuration:0.0 animations:^{
        block = true;
        _closeStationButton.alpha = 0;
    } completion:^(BOOL finished) {
        [_closeStationButton removeFromSuperview];
        _closeStationButton = nil;
        block = false;
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   // [self dismissOwnScreens];
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    [self dismissOwnScreens];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self dismissOwnScreens];
}

- (void)showScreen:(MWScreenType)type animation:(MWScreenAnimationTransitionType)transition
{
    // Алгоритм
    // Запоминаем текущий screenViewController в переменной oldScreenViewController
    // Создаем требуемый screenViewController
    // Делаем эффект анимации - плавно показываем окно
    // По окончании анимации прибиваем старый oldScreenViewController
    
    __block UIViewController *oldScreenViewController = _screenViewController;
    
    switch (type) {
        case MWScreenTypeSearchStation:
            _screenViewController = [[MWSearchStationViewController alloc] init];
            break;
        case MWScreenTypeStationList:
            _screenViewController = [[MWStationListViewController alloc] init];
            break;
        case MWScreenTypeMenu:
            _screenViewController = [[MWMenuViewController alloc] init];
            break;
        case MWScreenTypeMetroMaps:
            _screenViewController = [[MWMetroMapsViewController alloc] init];
            break;
        case MWScreenTypeSelectLanguage:
            _screenViewController = [[MWSelectLanguageViewController alloc] init];
            break;
        case MWScreenTypeSelectSort:
            _screenViewController = [[MWSelectSortViewController alloc] init];
            break;
        default:
            break;
    }
    
    CGRect inFrame; // Область, откуда мы выводим окно
    inFrame.size.width = [UIScreen mainScreen].bounds.size.width;
    inFrame.size.height = [UIScreen mainScreen].bounds.size.height;
    
    switch (transition) {
        case MWScreenAnimationTransitionTypeFlipBottom: // Выезжает снизу
            inFrame.origin.x = 0;
            inFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
            break;
        case MWScreenAnimationTransitionTypeFlipLeft: // Выезжает слева
            inFrame.origin.x = -[UIScreen mainScreen].bounds.size.width;
            inFrame.origin.y = 0;
            break;
        case MWScreenAnimationTransitionTypeFlipRight: // Выезжает справа
            inFrame.origin.x = [UIScreen mainScreen].bounds.size.width;
            inFrame.origin.y = 0;
            break;
        case MWScreenAnimationTransitionTypeFlipTop: // Выезжает сверху
            inFrame.origin.x = 0;
            inFrame.origin.y = -[UIScreen mainScreen].bounds.size.height;
            break;
        default:
            inFrame.origin.x = 0;
            inFrame.origin.y = 0;
            break;
    }
   
    [self addChildViewController:_screenViewController];
    _screenViewController.view.frame = inFrame;
    [self.view addSubview:_screenViewController.view];

    if (transition == MWScreenAnimationTransitionTypeNone) {
        _screenViewController.view.frame = self.view.frame;
        
        [oldScreenViewController.view removeFromSuperview];
        [oldScreenViewController removeFromParentViewController];
        oldScreenViewController = nil;
    } else if (transition == MWScreenAnimationTransitionTypeFade) {
        _screenViewController.view.alpha = 0;
        
        [UIView animateWithDuration:0.3 delay:0 options:
         UIViewAnimationOptionCurveEaseInOut animations:^{
             _screenViewController.view.alpha = 1;
         } completion:^(BOOL finished) {
             [oldScreenViewController.view removeFromSuperview];
             [oldScreenViewController removeFromParentViewController];
             oldScreenViewController = nil;
         }];
    } else {
        [UIView animateWithDuration:0.3 delay:0 options:
         UIViewAnimationOptionCurveEaseInOut animations:^{
            _screenViewController.view.frame = self.view.frame;
        } completion:^(BOOL finished) {
            [oldScreenViewController.view removeFromSuperview];
            [oldScreenViewController removeFromParentViewController];
            oldScreenViewController = nil;
        }];
    }
}

- (void)showScreenWithNoAnimation:(MWScreenType)type
{
    [self showScreen:type animation:MWScreenAnimationTransitionTypeNone];
}

- (void)showScreenWithDefaultAnimation:(MWScreenType)type
{
    [self showScreen:type animation:MWScreenAnimationTransitionTypeFlipBottom];
}

- (void)dismissScreen:(MWScreenAnimationTransitionType)transition
{
    // Алгоритм
    // Если screenViewController == nil, выходим
    // Делаем эффект анимации - плавно убираем окно на экран
    // По окончании анимации прибиваем модальный контроллер
    
    if (!_screenViewController) return;
    
    CGRect outFrame; // Область, куда мы выводим окно
    outFrame.size.width = [UIScreen mainScreen].bounds.size.width;
    outFrame.size.height = [UIScreen mainScreen].bounds.size.height;
    
    switch (transition) {
        case MWScreenAnimationTransitionTypeFlipBottom: // Проваливается вниз
            outFrame.origin.x = 0;
            outFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
            break;
        case MWScreenAnimationTransitionTypeFlipLeft: // Уезжает влево
            outFrame.origin.x = -[UIScreen mainScreen].bounds.size.width;
            outFrame.origin.y = 0;
            break;
        case MWScreenAnimationTransitionTypeFlipRight: // Уезжает вправо
            outFrame.origin.x = [UIScreen mainScreen].bounds.size.width;
            outFrame.origin.y = 0;
            break;
        case MWScreenAnimationTransitionTypeFlipTop: // Уезжает вверх
            outFrame.origin.x = 0;
            outFrame.origin.y = -[UIScreen mainScreen].bounds.size.height;
            break;
        default:
            outFrame.origin.x = 0;
            outFrame.origin.y = 0;
            break;
    }
    
    if (transition == MWScreenAnimationTransitionTypeNone) {
        [_screenViewController.view removeFromSuperview];
        [_screenViewController removeFromParentViewController];
        _screenViewController = nil;
    } else if (transition == MWScreenAnimationTransitionTypeFade) {
        [UIView animateWithDuration:0.3 animations:^{
            _screenViewController.view.alpha = 0;
        } completion:^(BOOL finished) {
            [_screenViewController.view removeFromSuperview];
            [_screenViewController removeFromParentViewController];
            _screenViewController = nil;
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            _screenViewController.view.frame = outFrame;
        } completion:^(BOOL finished) {
            [_screenViewController.view removeFromSuperview];
            [_screenViewController removeFromParentViewController];
            _screenViewController = nil;
        }];
    }
}

- (void)dismissScreenWithNoAnimation
{
    [self dismissScreen:MWScreenAnimationTransitionTypeNone];
}

- (void)dismissScreenWithDefaultAnimation
{
    [self dismissScreen:MWScreenAnimationTransitionTypeFlipBottom];
}

- (void)dismissModalStackAnimated:(bool)animated completion:(void (^)(void))completion
{
    UIView *fullscreenSnapshot = [[UIApplication sharedApplication].delegate.window snapshotViewAfterScreenUpdates:false];
    [self.presentedViewController.view insertSubview:fullscreenSnapshot atIndex:NSIntegerMax];
    [self dismissViewControllerAnimated:animated completion:completion];
}

///////////////////////////////////
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    locationManagerEnabled = true;
    _heading = newHeading.trueHeading;
    if (currentGeoFoundStation) [self updateDirectionToSelectedStation];
}

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;}
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;}

-(float)calculatingBearing2
{
    float lat1 = DegreesToRadians(locationManager.location.coordinate.latitude);
    float lon1 = DegreesToRadians(locationManager.location.coordinate.longitude);
    
    float lat2 = DegreesToRadians(currentGeoFoundStation.geoLocation.x);
    float lon2 = DegreesToRadians(currentGeoFoundStation.geoLocation.y);
 
    float dLon = lon2 - lon1;
    
    float y = sin(dLon) * cos(lat2);
    float x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    float radiansBearing = atan2(y, x);
    if(radiansBearing < 0.0)
    {
        radiansBearing += 2*M_PI;
    }
    
//    NSLog(@"%f", radiansBearing);
    return radiansBearing;
}

- (void)updateDirectionToSelectedStation {
    if (!isSelectedStationExplorerShowed)
    {
        [UIView animateWithDuration:0.5 animations:^{
            _directionImageView.alpha = 0;
        }];
        return;
    }

    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (!metroMap.startStation || !locationManager.location.coordinate.latitude || !locationManager.location.coordinate.longitude)
    {
        [UIView animateWithDuration:0.5 animations:^{
            _directionImageView.alpha = 0.2;
        }];
        return;
    }
    
    if (_directionImageView.alpha == 0.2) {
        [UIView animateWithDuration:0.5 animations:^{
            _directionImageView.alpha = 1;
        }];
    }
    
    float lat1 = DegreesToRadians(locationManager.location.coordinate.latitude);
    float lng1 = DegreesToRadians(locationManager.location.coordinate.longitude);
    float lat2 = DegreesToRadians(metroMap.startStation.geoLocation.x);
    float lng2 = DegreesToRadians(metroMap.startStation.geoLocation.y);
    float deltalng = lng2 - lng1;
    double y = sin(deltalng) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltalng);
    double bearing = atan2(y, x) + 2 * M_PI;

    double rotationInDegree = RadiansToDegrees(bearing) - _heading;
    rotationInDegree = fmod((rotationInDegree + 360), 360);

    [UIView animateWithDuration:0.5 animations:^{
        _directionImageView.transform = CGAffineTransformMakeRotation(DegreesToRadians(rotationInDegree));
    }];

}

-(void)updateDistanceToSelectedStation
{
    [self updateDirectionToSelectedStation];
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (!metroMap.startStation) return;
    
    if (metroMap.startStation) {
        CLLocationDistance distance;
        CLLocationCoordinate2D stationCoordinate;
        
        stationCoordinate.latitude = metroMap.startStation.geoLocation.x;
        stationCoordinate.longitude = metroMap.startStation.geoLocation.y;
        distance = [MWLocation geodesicDistance:locationManager.location.coordinate toPoint:stationCoordinate];
        metroMap.startStation.distance = distance;
        
        _distanceLabel.text = [NSString stringWithFormat:@"%.1f %@", distance / 1000, [MWLanguage localizedStringForKey:@"SearchStation_NearestStationDistanceKilometersShort"]];
    }
}

- (BOOL)isSelectedStationExplorerAvailable
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    bool result = (metroMap.startStation && [MWSettings settings].showSelectedStationExplorer && metroMap.startStation.distance > 0 && metroMap.startStation.distance < 100000) && locationManagerEnabled;
    return result;
}

- (void)showSelectedStationExplorer
{
    if (isSelectedStationExplorerShowed || ![self isSelectedStationExplorerAvailable]) return;
 
    isSelectedStationExplorerShowed = true;

    CGRect frame = _searchStartStationBackgroung.frame;
    frame.size.height = 42 + _directionImageView.image.size.height;
    
    [UIView animateWithDuration:0.5 animations:^{
        _searchStartStationBackgroung.frame = frame;
        _directionImageView.alpha = 1;
        _distanceLabel.alpha = 1;
    }];
}

- (void)hideSelectedStationExplorer
{
    if (!isSelectedStationExplorerShowed) return;

    isSelectedStationExplorerShowed = false;

    CGRect frame = _searchStartStationBackgroung.frame;
    frame.size.height = 35;
    
    [UIView animateWithDuration:0.5 animations:^{
        _searchStartStationBackgroung.frame = frame;
        _directionImageView.alpha = 0;
        _distanceLabel.alpha = 0;
    }];
}

@end

