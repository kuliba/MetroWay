//
//  MMMetroMapViewController.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 06.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWMenuViewController.h"
#import "MWSelectLanguageViewController.h"
#import "MWMetroMapsViewController.h"
#import "MWSelectSortViewController.h"
#import "MWStationListViewController.h"
@import GoogleMobileAds;
#import "MWHUD.h"

@interface MWMetroMapViewController : UIViewController <UIScrollViewDelegate, CLLocationManagerDelegate, GADInterstitialDelegate>
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
@property (strong, nonatomic) IBOutlet GADBannerView *bannerView;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UIImageView *directionImageView;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;

- (IBAction)menuButton:(id)sender;
- (IBAction)searchStartStation:(id)sender;
- (IBAction)searchFinishStation:(id)sender;

@property (strong, nonatomic) UIImageView *launchImageView;
@property (strong, nonatomic) UIImageView *metroMapImageView;
@property (strong, nonatomic) UIView *routeListView;
@property (weak, nonatomic) MWStation *tapStation;
@property (nonatomic, strong) GADInterstitial *interstitial;
@property (nonatomic, strong) NSTimer *interstitialBannerTimer;
@property (strong, nonatomic) MWHUD *HUD;
@property (strong, nonatomic) UIButton *fade;
@property (strong, nonatomic) UIButton *routeContextMenu;
@property (strong, nonatomic) UIButton *closeStationButton;

- (void)startSpinner:(NSString *)message;

typedef enum {
    MWScreenTypeSearchStation,
    MWScreenTypeStationList,
    MWScreenTypeMenu,
    MWScreenTypeMetroMaps,
    MWScreenTypeSelectLanguage,
    MWScreenTypeSelectSort
} MWScreenType;

typedef enum {
    MWScreenAnimationTransitionTypeFlipLeft,
    MWScreenAnimationTransitionTypeFlipTop,
    MWScreenAnimationTransitionTypeFlipRight,
    MWScreenAnimationTransitionTypeFlipBottom,
    MWScreenAnimationTransitionTypeFade,
    MWScreenAnimationTransitionTypeNone
} MWScreenAnimationTransitionType;

@property (strong, nonatomic) UIViewController *screenViewController;

- (void)showScreenWithNoAnimation:(MWScreenType)type;
- (void)showScreenWithDefaultAnimation:(MWScreenType)type;
- (void)showScreen:(MWScreenType)type animation:(MWScreenAnimationTransitionType)transition;
- (void)dismissScreenWithNoAnimation;
- (void)dismissScreenWithDefaultAnimation;
- (void)dismissScreen:(MWScreenAnimationTransitionType)transition;

- (void)dismissModalStackAnimated:(bool)animated completion:(void (^)(void))completion;

@property (nonatomic) float heading;

@end
