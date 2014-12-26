//
//  MMSearchStationViewController.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 19.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "MWStationListViewController.h"

@interface MWSearchStationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *listButton;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property BOOL is_From;
@property (readonly) NSArray *nearestStations;
@property (strong, nonatomic) NSArray *filteredStations;

- (IBAction)cancel:(id)sender;
- (IBAction)showStationList:(id)sender;

@end
