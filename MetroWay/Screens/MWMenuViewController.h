//
//  MMMenuViewController2.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 07.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWLanguage.h"
#import "MWStorage.h"
#import "MWBaseTableViewCell.h"
#import <MessageUI/MessageUI.h>
#import "MWSelectSortViewController.h"
#import "MWMetroMapsViewController.h"
#import "MWHUD.h"

@interface MWMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)done:(id)sender;

@property (strong, nonatomic) UIButton *fade;
@property (strong, nonatomic) MWHUD *HUD;

- (IBAction)swipeRecognized:(id)sender;

@end
