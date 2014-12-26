//
//  MMSelectSortViewController2.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 12.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWStorage.h"
#import "MWLanguage.h"
#import "MWBaseTableViewCell.h"

@interface MWSelectSortViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)done:(id)sender;

@end
