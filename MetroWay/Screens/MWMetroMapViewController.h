//
//  MMMetroMapViewController.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 06.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWMenuViewController.h"
#import "Flurry.h"

@interface MWMetroMapViewController : UIViewController <UIScrollViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) IBOutlet UIScrollView *metroMapScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *routeListScrollView;
@property (strong, nonatomic) IBOutlet UIButton *searchStartStationBackgroung;
@property (strong, nonatomic) IBOutlet UIButton *searchFinishStationBackground;
@property (strong, nonatomic) IBOutlet UILabel *searchStartStationLabel;
@property (strong, nonatomic) IBOutlet UILabel *searchFinishStationLabel;
@property (strong, nonatomic) IBOutlet UIButton *searchStartStationButton;
@property (strong, nonatomic) IBOutlet UIButton *searchFinishStationButton;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) UIImageView *launchImageView;

- (IBAction)menuButton:(id)sender;
- (IBAction)searchStartStation:(id)sender;
- (IBAction)searchFinishStation:(id)sender;

@property (strong, nonatomic) UIImageView *metroMapImageView;
@property (strong, nonatomic) UIView *routeListView;
@property (weak, nonatomic) MWStation *tapStation;

- (void)startSpinner:(NSString *)message;

@end
