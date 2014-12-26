//
//  MMSelectMapViewController2.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 01.08.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWStorage.h"
#import "MWLanguage.h"
#import "MWLanguage.h"
#import "MWBaseTableViewCell.h"
#import "MWMapTableViewCell.h"
#import "MWMetroMapViewController.h"

@interface MWSelectMapViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MWTableViewCellDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSArray *filteredList;
@property (strong, nonatomic) UILabel *noMyMetroMapsLabel;

- (IBAction)done:(id)sender;

@end
