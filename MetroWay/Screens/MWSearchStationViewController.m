//
//  MMSearchStationViewController.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 19.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWSearchStationViewController.h"
#import "MWLanguage.h"
#import "MWMetroMapViewController.h"
#import "MWStorage.h"
#import "MWBaseTableViewCell.h"
#import "MWViewStationCircleR14.h"
#import "MWRouter.h"
#import "MWRouteItem.h"
#import "MWViewRouteR14.h"
#import "MWStationListViewController.h"

@interface MWSearchStationViewController ()

@end

@implementation MWSearchStationViewController

@synthesize is_From, nearestStations, filteredStations;

static NSArray *ns;
UILabel *noResultsLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.cancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.view.backgroundColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
        [self.cancelButton setTitle:[MWLanguage localizedStringForKey:@"SearchStation_CancelButtonTitle"] forState:UIControlStateNormal];

        self.listButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.listButton setTitle:[MWLanguage localizedStringForKey:@"SearchStation_ListButtonTitle"] forState:UIControlStateNormal];
        self.listButton.layer.cornerRadius = 6;
        self.listButton.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
        
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
        self.searchTextField.leftView = paddingView;
        self.searchTextField.leftViewMode = UITextFieldViewModeAlways;
        self.searchTextField.tintColor = [UIColor whiteColor];
        is_From = true;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    ns = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Делаем заголовок темным
    [self setNeedsStatusBarAppearanceUpdate];

    self.searchTextField.placeholder = is_From ? [MWLanguage localizedStringForKey:@"SearchStation_PlaceholderWhereFrom"] : [MWLanguage localizedStringForKey:@"SearchStation_PlaceholderWhereTo"];

    // Do any additional setup after loading the view from its nib.
    [self.searchTextField becomeFirstResponder];
    self.searchTextField.delegate = self;
    // Делаем tableView прозрачным
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    
    filteredStations = [[NSArray alloc] init];
    [self.searchTextField addTarget:self action:@selector(searchTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.searchTextField addTarget:self action:@selector(searchTextFieldDidChange:) forControlEvents:UIControlEventTouchCancel];
    
    noResultsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    noResultsLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    noResultsLabel.frame = CGRectMake(0, 30, self.tableView.bounds.size.width, 25);
    noResultsLabel.textAlignment = NSTextAlignmentCenter;
    noResultsLabel.textColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    noResultsLabel.text = [MWLanguage localizedStringForKey:@"SearchStation_SearchResultNoSearchResult"];
    noResultsLabel.hidden = true;    
    [self.tableView addSubview:noResultsLabel];
    
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    NSString *fileName = @"bg_menu.png";
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];

    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        self.backgroundImageView.image = image;
        image = nil;
    }
    
    _searchTextField.background = [MWDraw resizeImageWithAspect:[UIImage imageNamed:@"SearchBackground.png"] scaledToMaxWidth:307 height:69];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (NSArray *)nearestStations
{
    if (!ns) {
        MWList *list = [MWStorage metroMapList];
        ns = [MWLocation searchNearestStations:list.currentCoordinate accuracyInMeters:3499 limit:3];
    }
    return ns;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.searchTextField resignFirstResponder];
}

- (void)tableViewGesture
{
    [self.searchTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissMe];
}

- (IBAction)showStationList:(id)sender {
    [_searchTextField resignFirstResponder];
    MWStationListViewController *stationListViewController = [[MWStationListViewController alloc] init];
    stationListViewController.is_From = is_From;
    [self presentViewController:stationListViewController animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int result = 0;
    if (filteredStations.count > 0) {
        result = 1;
    } else if ([self.searchTextField.text isEqualToString:@""]) {
        result = 0;
    
        // Если есть элементы в избранных, добавляем для них секцию
        if ([MWStorage routeStorage].allFavorites.count > 0) {
            result++;
        }
    
        // Если есть предыдущие маршруты, добавляем для них секцию
        if ([MWStorage routeStorage].lastRoutes.count > 0) {
            result++;
        }
    
        // Если есть близлежащие станции, добавляем для них секцию
        if (self.nearestStations.count) {
            result++;
        }
    }
    return result;
}

- (void)setNoResultsLabel
{
    int result = 0;
    if (filteredStations.count > 0) {
        result = 1;
    } else if ([self.searchTextField.text isEqualToString:@""]) {
        result = 0;
        
        // Если есть элементы в избранных, добавляем для них секцию
        if ([MWStorage routeStorage].allFavorites.count > 0) {
            result++;
        }
        
        // Если есть предыдущие маршруты, добавляем для них секцию
        if ([MWStorage routeStorage].lastRoutes.count > 0) {
            result++;
        }
        
        // Если есть близлежащие станции, добавляем для них секцию
        if (self.nearestStations.count) {
            result++;
        }
    }
    noResultsLabel.hidden = result != 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (filteredStations.count > 0) {
        return filteredStations.count;
    } else if ([self.searchTextField.text isEqualToString:@""]) {
        NSInteger result = 0;
    
        // Если есть элементы в избранных
        BOOL favorites = [MWStorage routeStorage].allFavorites.count > 0;
    
        // Если есть предыдущие маршруты
        BOOL lastRoutes = [MWStorage routeStorage].lastRoutes.count > 0;
    
        if (section == 2) {
            result = self.nearestStations.count;
        } else if (section == 1) {
            if (favorites) {
                if (lastRoutes) {
                    result = [MWStorage routeStorage].lastRoutes.count;
                } else {
                    result = self.nearestStations.count;
                }
            } else {
                result = self.nearestStations.count;
            }
        } else if (section == 0) {
            if (favorites) {
                result = [MWStorage routeStorage].allFavorites.count;
            } else if (lastRoutes) {
                result = [MWStorage routeStorage].lastRoutes.count;
            } else {
                result = self.nearestStations.count;
            }
        }
        return result;
    }
    return 0;
}

- (UITableViewCell *)cellForNearestStation:(int)row
{
    MWStation *nearestStation = (MWStation *)[self.nearestStations objectAtIndex:row];
    
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    if (!nearestStation) return cell;
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    
    UILabel *stationLabelOriginal = [[UILabel alloc] initWithFrame:CGRectZero];
    stationLabelOriginal.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    stationLabelOriginal.frame = CGRectMake(30, 15.5, self.view.window.bounds.size.width - 47, 20);
    stationLabelOriginal.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
    
    if ([nearestStation isClosed]) {
        stationLabelOriginal.text = [NSString stringWithFormat:@"%@ (%@)", nearestStation.nameOriginal, [nearestStation closedText]];
    } else {
        stationLabelOriginal.text = nearestStation.nameOriginal;
    }

    UILabel *distanceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    distanceLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    distanceLabel.frame = CGRectMake(31, 38.5, self.view.window.bounds.size.width - 47, 12);
    distanceLabel.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    distanceLabel.text = [NSString stringWithFormat:@"%.1f %@", nearestStation.distance / 1000, [MWLanguage localizedStringForKey:@"SearchStation_NearestStationDistanceKilometersShort"]];

    MWViewStationCircleR14 *stationCircle = [[MWViewStationCircleR14 alloc] initWithFrame:CGRectMake(11, 19, 14, 14)];
    stationCircle.color = [MWRouter lineByStation:nearestStation].color;
    
    [cell addSubview:separator];
    [cell addSubview:stationCircle];
    [cell addSubview:stationLabelOriginal];
    [cell addSubview:distanceLabel];
    
    cell.station1 = nearestStation;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    if ([MWSettings settings].showEnglishTitles && [metroMap englishTextExists]) {
        UILabel *stationLabelEnglish = [[UILabel alloc] initWithFrame:CGRectZero];
        stationLabelEnglish.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        stationLabelEnglish.frame = CGRectMake(30, 24.5, self.view.window.bounds.size.width - 47, 20);
        stationLabelEnglish.textColor = [UIColor lightGrayColor];
        stationLabelEnglish.text = nearestStation.nameEnglish;
        [cell addSubview:stationLabelEnglish];
        
        stationLabelOriginal.frame = CGRectMake(30, 6.5, self.view.window.bounds.size.width - 47, 20);
        distanceLabel.frame = CGRectMake(31, 44.5, self.view.window.bounds.size.width - 47, 12);
        stationCircle.frame = CGRectMake(11, 10, 14, 14);
    }
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForLastRoutes:(int)row
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    
    MWRouteItem *routeItem = [[MWStorage routeStorage].lastRoutes objectAtIndex:row];
    if (!routeItem) return cell;
    MWStation *station1 = [[MWStorage currentMetroMap] stationByIdentifier:routeItem.stationIdentifier1];
    MWStation *station2 = [[MWStorage currentMetroMap] stationByIdentifier:routeItem.stationIdentifier2];

    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];

    UILabel *station1OriginalLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    station1OriginalLabel.text = station1.nameOriginal;
    station1OriginalLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    station1OriginalLabel.numberOfLines = 0;
    station1OriginalLabel.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
    station1OriginalLabel.frame = CGRectMake(30, 11, self.view.window.bounds.size.width - 47, 20);
    [station1OriginalLabel sizeToFit];

    UILabel *station2OriginalLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    station2OriginalLabel.text = station2.nameOriginal;
    station2OriginalLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    station2OriginalLabel.numberOfLines = 0;
    station2OriginalLabel.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
    [station2OriginalLabel sizeToFit];

    MWViewRouteR14 *routeR14 = [[MWViewRouteR14 alloc] initWithFrame:CGRectMake(11, 14.5, 14, 35.5)];
    routeR14.color1 = [MWRouter lineByStation:station1].color;
    routeR14.color2 = [MWRouter lineByStation:station2].color;
    
    [cell addSubview:separator];
    [cell addSubview:routeR14];
    [cell addSubview:station1OriginalLabel];
    [cell addSubview:station2OriginalLabel];
    
    cell.station1 = station1;
    cell.station2 = station2;
 
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    if ([MWSettings settings].showEnglishTitles && [metroMap englishTextExists]) {
        UILabel *station1EnglishLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        station1EnglishLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        station1EnglishLabel.frame = CGRectMake(30, 31, self.view.window.bounds.size.width - 47, 20);
        station1EnglishLabel.textColor = [UIColor lightGrayColor];
        station1EnglishLabel.text = station1.nameEnglish;
        [cell addSubview:station1EnglishLabel];
        
        UILabel *station2EnglishLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        station2EnglishLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        station2EnglishLabel.frame = CGRectMake(30, 72, self.view.window.bounds.size.width - 47, 20);
        station2EnglishLabel.textColor = [UIColor lightGrayColor];
        station2EnglishLabel.text = station2.nameEnglish;
        [cell addSubview:station2EnglishLabel];
        
        station2OriginalLabel.frame = CGRectMake(30, 54, self.view.window.bounds.size.width - 47, 20);
        
        routeR14.frame = CGRectMake(11, 33, 14, 35.5);
    } else {
        station2OriginalLabel.frame = CGRectMake(30, 34, self.view.window.bounds.size.width - 47, 20);
    }
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForFavorites:(int)row
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    
    MWRouteItem *routeItem = [[MWStorage routeStorage].allFavorites objectAtIndex:row];
    if (!routeItem) return cell;
    
    cell.routeItem = routeItem;
    
    MWStation *station1 = [[MWStorage currentMetroMap] stationByIdentifier:routeItem.stationIdentifier1];
    MWStation *station2 = [[MWStorage currentMetroMap] stationByIdentifier:routeItem.stationIdentifier2];

    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    
    [cell addSubview:separator];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closeButton.backgroundColor = [UIColor clearColor];
    
    UIImage *closeImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:@"CloseGray.png"] scaledToMaxWidth:19 height:19];
    [closeButton setImage:closeImage forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(deleteFavorite:) forControlEvents:UIControlEventTouchUpInside];
    closeButton.tag = row;
    
    if (routeItem.type == MWRouteItemTypeFavoriteRoute) {
        UILabel *stationLabel1 = [[UILabel alloc] initWithFrame:CGRectZero];
        stationLabel1.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        stationLabel1.frame = CGRectMake(30, 11, self.view.window.bounds.size.width - 100, 20);
        stationLabel1.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
        stationLabel1.text = station1.nameOriginal;
        
        UILabel *stationLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
        stationLabel2.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        stationLabel2.frame = CGRectMake(30, 34, self.view.window.bounds.size.width - 100, 20);
        stationLabel2.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
        stationLabel2.text = station2.nameOriginal;
        
        MWViewRouteR14 *routeR14 = [[MWViewRouteR14 alloc] initWithFrame:CGRectMake(11, 14.5, 14, 35.5)];
        routeR14.color1 = [MWRouter lineByStation:station1].color;
        routeR14.color2 = [MWRouter lineByStation:station2].color;

        closeButton.frame = CGRectMake(cell.bounds.size.width - 63.5, 10, 65, 65);
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        detailLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        detailLabel.textColor = [UIColor colorWithRed:(120/255.0) green:(120/255.0) blue:(120/255.0) alpha:1];
        detailLabel.text = routeItem.details;

        [cell addSubview:detailLabel];
        [cell addSubview:routeR14];
        [cell addSubview:stationLabel1];
        [cell addSubview:stationLabel2];
        
        if ([MWSettings settings].showEnglishTitles && [metroMap englishTextExists]) {
            UILabel *station1EnglishLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            station1EnglishLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
            station1EnglishLabel.frame = CGRectMake(30, 31, self.view.window.bounds.size.width - 100, 20);
            station1EnglishLabel.textColor = [UIColor lightGrayColor];
            station1EnglishLabel.text = station1.nameEnglish;
            [cell addSubview:station1EnglishLabel];
            
            UILabel *station2EnglishLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            station2EnglishLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
            station2EnglishLabel.frame = CGRectMake(30, 72, self.view.window.bounds.size.width - 100, 20);
            station2EnglishLabel.textColor = [UIColor lightGrayColor];
            station2EnglishLabel.text = station2.nameEnglish;
            [cell addSubview:station2EnglishLabel];
            
            stationLabel2.frame = CGRectMake(30, 54, self.view.window.bounds.size.width - 100, 20);
            
            routeR14.frame = CGRectMake(11, 33, 14, 35.5);
            
            closeButton.frame = CGRectMake(cell.bounds.size.width - 63.5, 28.5, 65, 65);
            
            detailLabel.frame = CGRectMake(30, 95, self.view.window.bounds.size.width - 100, 20);

        } else {
            stationLabel2.frame = CGRectMake(30, 34, self.view.window.bounds.size.width - 100, 20);
            detailLabel.frame = CGRectMake(30, 60, self.view.window.bounds.size.width - 100, 20);
        }
    } else {
        UILabel *stationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        stationLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        stationLabel.frame = CGRectMake(30, 15.5, self.view.window.bounds.size.width - 100, 20);
        stationLabel.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
        stationLabel.text = station1.nameOriginal;
        
        MWViewStationCircleR14 *stationCircle = [[MWViewStationCircleR14 alloc] initWithFrame:CGRectMake(11, 17.5, 14, 14)];
        stationCircle.color = [MWRouter lineByStation:station1].color;

        [closeButton setFrame:CGRectMake(cell.bounds.size.width - 63.5, 10, 65, 50)];

        [cell addSubview:stationCircle];
        [cell addSubview:stationLabel];
    }
    
    [cell addSubview:closeButton];
    
    cell.station1 = station1;
    cell.station2 = station2;
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForFilteredStations:(int)row
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    
    MWStation *station = (MWStation *)[filteredStations objectAtIndex:row];
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    
    UILabel *stationOriginalLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    stationOriginalLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    stationOriginalLabel.frame = CGRectMake(30, 14, self.view.window.bounds.size.width - 47, 20);
    stationOriginalLabel.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
    
    if ([station isClosed]) {
        stationOriginalLabel.text = [NSString stringWithFormat:@"%@ (%@)", station.nameOriginal, [station closedText].lowercaseString];
    } else {
        stationOriginalLabel.text = station.nameOriginal;
    }

    UILabel *stationEnglishLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    stationEnglishLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    stationEnglishLabel.frame = CGRectMake(30, 25, self.view.window.bounds.size.width - 47, 20);
    stationEnglishLabel.textColor = [UIColor lightGrayColor];
    stationEnglishLabel.text = station.nameEnglish;

    MWViewStationCircleR14 *stationCircle = [[MWViewStationCircleR14 alloc] initWithFrame:CGRectMake(11, 17.5, 14, 14)];
    stationCircle.color = [MWRouter lineByStation:station].color;
        
    [cell addSubview:separator];
    [cell addSubview:stationCircle];
    [cell addSubview:stationOriginalLabel];
    
    CGRect frame;
    
    if (station.nameEnglish && [MWSettings settings].showEnglishTitles) {
        [cell addSubview:stationEnglishLabel];

        frame = stationOriginalLabel.frame;
        frame.origin.y = 4;
        stationOriginalLabel.frame = frame;
        
        stationCircle.frame = CGRectMake(11, 8, 14, 14);
    }
    
    cell.station1 = station;
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        if (filteredStations.count > 0) {
            cell = [self cellForFilteredStations:(int)indexPath.row];
        } else {
            // Если есть элементы в избранных
            BOOL favorites = [MWStorage routeStorage].allFavorites.count > 0;
        
            // Если есть предыдущие маршруты
            BOOL lastRoutes = [MWStorage routeStorage].lastRoutes.count > 0;
        
            if (indexPath.section == 2) {
                cell = [self cellForNearestStation:(int)indexPath.row];
            } else if (indexPath.section == 1) {
                if (favorites) {
                    if (lastRoutes) {
                        cell = [self cellForLastRoutes:(int)indexPath.row];
                    } else {
                        cell = [self cellForNearestStation:(int)indexPath.row];
                    }
                } else {
                    cell = [self cellForNearestStation:(int)indexPath.row];
                }
            } else if (indexPath.section == 0) {
                if (favorites) {
                    cell = [self cellForFavorites:(int)indexPath.row];
                } else if (lastRoutes) {
                    cell = [self cellForLastRoutes:(int)indexPath.row];
                } else {
                    cell = [self cellForNearestStation:(int)indexPath.row];
                }
            }
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.5;
}

- (float)heightForFavorite:(int)row
{
    NSArray *allFavotites = [MWStorage routeStorage].allFavorites;
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    MWRouteItem *routeItem = (MWRouteItem *)[allFavotites objectAtIndex:row];
    
    if (routeItem.type == MWRouteItemTypeFavoriteRoute) {
        if ([MWSettings settings].showEnglishTitles && [metroMap englishTextExists]) {
            return 120;
        } else {
            return 85;
        }
    } else return 50;
}

- (float)heightForLastRoute
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    if ([MWSettings settings].showEnglishTitles && [metroMap englishTextExists]) {
        return 100;
    } else {
        return 65;
    }
}

- (float)heightForNearestStation
{
    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (filteredStations.count > 0) {
        return 50;
    } else {
        // Если есть элементы в избранных
        NSArray *allFavotites = [MWStorage routeStorage].allFavorites;
        BOOL favorites = allFavotites.count > 0;
    
        switch ((int)indexPath.section) {
            case 0:
                if (favorites) {
                    return [self heightForFavorite:(int)indexPath.row];
                } else if ([MWStorage routeStorage].lastRoutes.count > 0) {
                    // Высота ячейки для последних маршрутов
                    return [self heightForLastRoute];
                } else {
                    return [self heightForNearestStation]; // Ближайшие станции
                }
                break;
            case 1:
                if (favorites && [MWStorage routeStorage].lastRoutes.count > 0) {
                        return [self heightForLastRoute];
                } else return [self heightForNearestStation];
                break;
            case 2:
                return [self heightForNearestStation];
                break;
            default:
                return 65;
                break;
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *headerTitle;
 
    if (filteredStations.count > 0) {
        headerTitle = [MWLanguage localizedStringForKey:@"SearchStation_SearchResultHeaderSection"];
    } else {
        // Если есть элементы в избранных
        BOOL favorites = [MWStorage routeStorage].allFavorites.count > 0;
    
        // Если есть предыдущие маршруты
        BOOL lastRoutes = [MWStorage routeStorage].lastRoutes.count > 0;
    
        if (section == 2) {
            headerTitle = [MWLanguage localizedStringForKey:@"SearchStation_NearestStationsHeaderTitle"];
        } else if (section == 1) {
            if (favorites) {
                if (lastRoutes) {
                    headerTitle = [MWLanguage localizedStringForKey:@"SearchStation_LastRoutesHeaderTitle"];
                } else {
                    headerTitle = [MWLanguage localizedStringForKey:@"SearchStation_NearestStationsHeaderTitle"];
                }
            } else {
                headerTitle = [MWLanguage localizedStringForKey:@"SearchStation_NearestStationsHeaderTitle"];
            }
        } else if (section == 0) {
            if (favorites) {
                headerTitle = [MWLanguage localizedStringForKey:@"SearchStation_FavoritesHeaderTitle"];
            } else if (lastRoutes) {
                headerTitle = [MWLanguage localizedStringForKey:@"SearchStation_LastRoutesHeaderTitle"];
            } else {
                headerTitle = [MWLanguage localizedStringForKey:@"SearchStation_NearestStationsHeaderTitle"];
            }
        }
    }
    
    UIView *customHeader = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 55)];
//    customHeader.backgroundColor = [UIColor whiteColor];

    UIView *backgroundHeader = [[UIView alloc] initWithFrame:CGRectMake(10.5, 11, self.view.window.bounds.size.width - 21, 34.5)];
    backgroundHeader.backgroundColor = [UIColor whiteColor];
//    backgroundHeader.layer.cornerRadius = 2;
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    headerLabel.frame = CGRectMake(23.5, 18.5, self.view.window.bounds.size.width - 47, 20);
    headerLabel.text = headerTitle;
    
    [customHeader addSubview:backgroundHeader];
    [customHeader addSubview:headerLabel];
    return customHeader;
}

- (void)deleteFavorite:(UIView *)button
{
    UIAlertView *deleteFavoriteAlert = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"SearchStation_DeleteFavoriteAlertViewHeader"]
                                                 message:[MWLanguage localizedStringForKey:@"SearchStation_DeleteFavoriteAlertViewMessage"]
                                                delegate:self
                                       cancelButtonTitle:[MWLanguage localizedStringForKey:@"SearchStation_DeleteFavoriteAlertViewNo"]
                                       otherButtonTitles:[MWLanguage localizedStringForKey:@"SearchStation_DeleteFavoriteAlertViewYes"], nil];
    deleteFavoriteAlert.tag = button.tag;
    [deleteFavoriteAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Удаляем элемент из избранных после подтверждения
    if (buttonIndex == 1) {
        MWRouteStorage *routeStorage = [MWStorage routeStorage];
        NSArray *favorites = routeStorage.allFavorites;
        MWRouteItem *routeItem = (MWRouteItem *)[favorites objectAtIndex:alertView.tag];
        [routeStorage.items removeObject:routeItem];
        [routeStorage save];
        [[self tableView] reloadData];
    }
}

- (void)setStartStation:(MWStation *)station
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (![metroMap.startStation isEqual:station]) {
        metroMap.startStation = station;
        // Отсылаем всем сообщение, что выбрана новая начальная станция
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *changeStartStation = [NSNotification notificationWithName:@"changeStartStation" object:nil];
        [notificationCenter postNotification:changeStartStation];
    }
}

- (void)setFinishStation:(MWStation *)station
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (![metroMap.finishStation isEqual:station]) {
        metroMap.finishStation = station;
        // Отсылаем всем сообщение, что выбрана новая конечная станция
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *changeFinishStation = [NSNotification notificationWithName:@"changeFinishStation" object:nil];
        [notificationCenter postNotification:changeFinishStation];
    }
}

- (void)setLastRoute:(MWStation *)startStation to:(MWStation *)finishStation
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (![metroMap.startStation isEqual:startStation] && ![metroMap.finishStation isEqual:finishStation]) {
        metroMap.startStation = startStation;
        metroMap.finishStation = finishStation;
        // Отсылаем всем сообщение, что выбран новый маршрут
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *notification = [NSNotification notificationWithName:@"changeRoute" object:nil];
        [notificationCenter postNotification:notification];
    } else if (![metroMap.startStation isEqual:startStation]) {
        [self setStartStation:startStation];
    }  else if (![metroMap.finishStation isEqual:finishStation]) {
        [self setFinishStation:finishStation];
    }
}

- (void)setFavoriteRoute:(MWStation *)startStation to:(MWStation *)finishStation routeItem:(MWRouteItem *)routeItem
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    metroMap.startStation = startStation;
    metroMap.finishStation = finishStation;
    // Отсылаем всем сообщение, что необходимо показать избранный маршрут
    
    NSDictionary *details = [[NSDictionary alloc] initWithObjectsAndKeys:@(routeItem.sortingType), @"sortingType", @(routeItem.routeNumber), @"routeNumber", nil];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [NSNotification notificationWithName:@"needToShowFavoriteRoute" object:self userInfo:details];

    [notificationCenter postNotification:notification];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWBaseTableViewCell *cell = (MWBaseTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.station1 && cell.station2 && cell.routeItem) { // Избранный маршрут
        [self setFavoriteRoute:cell.station1 to:cell.station2 routeItem:cell.routeItem];
        [self dismissMe];
    } else if (cell.station1 && cell.station2) { // Последний маршрут
        [self setLastRoute:cell.station1 to:cell.station2];
        [self dismissMe];
    } else if (![cell.station1 isClosed]) {
        if (self.is_From && ![metroMap.finishStation isEqual:cell.station1]) {
            [self setStartStation:cell.station1];
            [self dismissMe];
        } else if (![metroMap.startStation isEqual:cell.station1]) {
            [self setFinishStation:cell.station1];
            [self dismissMe];
        }
    }
}

- (void)dismissMe
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setSearchResult
{
    NSPredicate *predicate;
    if ([MWSettings settings].showEnglishTitles) {
        NSPredicate *predicate1 = [NSPredicate predicateWithFormat: @"SELF.nameOriginal contains[cd]%@", self.searchTextField.text];
        NSPredicate *predicate2 = [NSPredicate predicateWithFormat: @"SELF.nameEnglish contains[cd]%@",  self.searchTextField.text];
        predicate  = [NSCompoundPredicate orPredicateWithSubpredicates:@[predicate1, predicate2]];
    } else {
        predicate = [NSPredicate predicateWithFormat: @"SELF.nameOriginal contains[cd]%@", self.searchTextField.text];
    }
    self.filteredStations = [[MWStorage currentMetroMap].stations filteredArrayUsingPredicate:predicate];
    
    NSMutableArray *prefixNames = [NSMutableArray array];
    for (MWStation *station in [MWStorage currentMetroMap].stations) {
        if ([station.nameOriginal.uppercaseString hasPrefix:_searchTextField.text.uppercaseString] && ![prefixNames containsObject:station]) {
            [prefixNames addObject:station];
            continue;
        }
        if ([MWSettings settings].showEnglishTitles && [station.nameEnglish.uppercaseString hasPrefix:_searchTextField.text.uppercaseString] && ![prefixNames containsObject:station]) {
            [prefixNames addObject:station];
        }
    }
    
    for (MWStation *station in filteredStations) {
        if (![prefixNames containsObject:station]) {
            [prefixNames addObject:station];
        }
    }
    
    filteredStations = nil;
    filteredStations = [NSArray arrayWithArray:prefixNames];
    
    [self.tableView reloadData];
    for (UIView *subview in self.tableView.subviews) {
        if ([subview class] == [UILabel class]) {
            UILabel *lbl = (UILabel *)subview;
            lbl.hidden = filteredStations.count == 0 && self.searchTextField.text.length > 0 ? NO : YES;
        }
    }
    [self setNoResultsLabel];
}

- (void)searchTextFieldDidChange:(UITextField *)textField
{
    [self setSearchResult];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self setSearchResult];
    return YES;
}

@end
