//
//  MMStationListViewController.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 29.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWMetroMap.h"
#import "MWStorage.h"
#import "MWLanguage.h"
#import "MWBaseTableViewCell.h"
#import "MWViewStationCircleR14.h"
#import "MWRouter.h"
#import "MWDraw.h"

@interface MWStationListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)select:(id)sender;
- (IBAction)done:(id)sender;

@property BOOL is_From;

@end
