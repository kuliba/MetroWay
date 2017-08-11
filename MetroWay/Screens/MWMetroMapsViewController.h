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

@interface MWMetroMapsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MWTableViewCellDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSArray *filteredList;
@property (strong, nonatomic) UILabel *noMyMetroMapsLabel;
@property (strong, nonatomic) UILabel *noCitiesFoundLabel;
@property (strong, nonatomic) NSArray *metroMaps;
@property (nonatomic) BOOL isTableRendering;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) UIButton *backgroundButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *clearButton;
@property (nonatomic, strong) NSArray *nearestMetro;
@property (nonatomic, strong) NSArray *favoritesMetro;

- (IBAction)done:(id)sender;
- (IBAction)swipeRecognizer:(id)sender;

@end
