//
//  MMSelectLanguageViewController2.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 11.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWStorage.h"
#import "MWLanguage.h"
#import "MWBaseTableViewCell.h"
#import "MWMetroMapViewController.h"

@interface MWSelectLanguageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)done:(id)sender;
- (IBAction)swipeRecognizer:(id)sender;

@end
