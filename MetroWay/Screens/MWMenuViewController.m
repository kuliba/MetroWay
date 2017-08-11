//
//  MMMenuViewController2.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 07.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWMenuViewController.h"
#import "MWInApp.h"
#import "MWHUD.h"

@interface MWMenuViewController ()

@end

@implementation MWMenuViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    // Do any additional setup after loading the view from its nib.
    
    // Создаем фон
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    NSString *fileName = @"bg.png";
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        self.backgroundImageView.image = image;
        image = nil;
    }
    
    // Делаем заголовок темным
    [self setNeedsStatusBarAppearanceUpdate];
    
    // Настраиваем кнопку "Готово"
    [_doneButton.titleLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:16.5]];
    [_doneButton setTitleColor:[UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1] forState:UIControlStateNormal];
    [_doneButton setTitle:[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarDoneButton"] forState:UIControlStateNormal];

    _doneButton.titleLabel.frame = _doneButton.frame;
    
    // Настраиваем заголовок
    NSMutableAttributedString *attributedString;
    NSString *text = [[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarTitle"] uppercaseString];
    attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSKernAttributeName value:@4 range:NSMakeRange(0, attributedString.length)];
    [self.titleLabel setAttributedText:attributedString];
    
    // Делаем tableView прозрачным
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    
    _fade = [[UIButton alloc] initWithFrame:self.view.frame];
    _fade.alpha = 0;
    _fade.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:0.6];
    _fade.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_fade];
    [self.view bringSubviewToFront:_fade];
    _HUD = [[MWHUD alloc] initWithViewController:self];
    
    // Подписываемся на событие обновления языка интерфейса
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(setText) name:@"changeLanguage" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeMetroMap) name:@"changeMetroMap" object:nil];
    [notificationCenter addObserver:self selector:@selector(removeAds) name:@"removeAds" object:nil];
    [notificationCenter addObserver:self selector:@selector(hideInAppHUD) name:@"hideInAppHUD" object:nil];
    [notificationCenter addObserver:self selector:@selector(inAppRestored) name:@"inAppRestored" object:nil];
    [notificationCenter addObserver:self selector:@selector(hideInAppHUD) name:@"inAppCancelled" object:nil];
}

- (void)removeAds
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView reloadData];
    });
}

- (void)setText
{
    [_doneButton setTitle:[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarDoneButton"] forState:UIControlStateNormal];
//    [_doneButton sizeToFit];
    [_doneButton.titleLabel sizeToFit];
    _doneButton.titleLabel.frame = _doneButton.frame;
    
    // Настраиваем заголовок
    NSMutableAttributedString *attributedString;
    NSString *text = [[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarTitle"] uppercaseString];
    attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSKernAttributeName value:@4 range:NSMakeRange(0, attributedString.length)];
    [self.titleLabel setAttributedText:attributedString];
    
    [self.tableView reloadData];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)done:(id)sender {
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
    if (metroMap.englishTextExists && [MWStorage needChangeEnglishSet:metroMap]) {
        [metroMapViewContoller startSpinner:[MWLanguage localizedStringForKey:metroMap.englishTextDrawn ? @"MetroMap_SpinnerDeletingEnglishTextTitle" : @"MetroMap_SpinnerAddingEnglishTextTitle"]];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [MWSettings settings].areAdsRemoved ? 4 : 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 5;
            break;
        case 2:
            return [MWSettings settings].areAdsRemoved ? 1 : 2;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        switch (indexPath.section) {
            case 0:
                cell = [self cellForSelectMetroMap];
                break;
            case 1:
                switch (indexPath.row) {
                    case 0:
                        cell = [self cellForLanguage];
                        break;
                    case 1:
                        cell = [self cellForEnglishTitles];
                        break;
                    case 2:
                        cell = [self cellForRoutesSortType];
                        break;
                    case 3:
                        cell = [self cellForAutoUpdate];
                        break;
                    case 4:
                        cell = [self cellForShowSelectedStationExplorer];
                        break;
                    default:
                        break;
                }
                break;
            case 2:
                if ([MWSettings settings].areAdsRemoved) {
                    cell = [self cellForSendEmail];
                } else {
                    // Выводим 2 ячейки
                    switch ((int)indexPath.row) {
                        case 0:
                            cell = [self cellForAds:[MWLanguage localizedStringForKey:@"MainMenu_AdsRemoveCell"]];
                            break;
                        case 1:
                            cell = [self cellForAds:[MWLanguage localizedStringForKey:@"MainMenu_AdsRestoreCell"]];
                            break;
                        default:
                            break;
                    }
                }
                break;
            case 3:
                cell = [MWSettings settings].areAdsRemoved ? [self cellForSocialNetworkButtons] : [self cellForSendEmail];
                break;
            case 4:
                cell = [self cellForSocialNetworkButtons];
                break;
            default:
                break;
        }
    }
    return cell;
}

- (UITableViewCell *)cellForSelectMetroMap
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    MWList *list = [MWStorage metroMapList];
    
    UILabel *disclosureIndicatorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    disclosureIndicatorLabel.font = [UIFont fontWithName:@"EuphemiaUCAS" size:24];
    disclosureIndicatorLabel.frame = CGRectMake(self.view.frame.size.width - 50, 18.5, 10, 30);
    disclosureIndicatorLabel.textColor = [UIColor colorWithRed:(141/255.0) green:(141/255.0) blue:(141/255.0) alpha:1];
    disclosureIndicatorLabel.text = @">";

    UILabel *metroMapCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    metroMapCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    metroMapCountLabel.frame = CGRectMake(self.view.frame.size.width - 110, 18.5, 30, 30);
    metroMapCountLabel.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    metroMapCountLabel.text = [NSString stringWithFormat:@"%d", (int)list.items.count];
    metroMapCountLabel.textAlignment = NSTextAlignmentRight;

    UILabel *metroMapTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    metroMapTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    metroMapTitleLabel.frame = CGRectMake(17, 9.5, cell.bounds.size.width - 55 - disclosureIndicatorLabel.bounds.size.width - metroMapCountLabel.bounds.size.width, 30);
    metroMapTitleLabel.textColor = [UIColor colorWithRed:(46/255.0) green:(51/255.0) blue:(60/255.0) alpha:1];
    metroMapTitleLabel.text = [MWLanguage localizedStringForKey:@"MainMenu_MetroMapsCellTextLabelTitle"];
    
    UILabel *currentMetroMapLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    currentMetroMapLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    currentMetroMapLabel.frame = CGRectMake(17, 32, cell.bounds.size.width - 55 - disclosureIndicatorLabel.bounds.size.width - metroMapCountLabel.bounds.size.width, 30);
    currentMetroMapLabel.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    MWListItem *listItem = [list itemByIdentifier:[MWSettings settings].currentMetroMapIdentifier];
    currentMetroMapLabel.text = [NSString stringWithFormat:@"%@: %@, %@",[MWLanguage localizedStringForKey:@"MainMenu_MetroMapsCurrent"], [MWLanguage LocalizedCurrentMetroMapName:listItem], [MWLanguage localizedCountry:listItem]];
    
    [cell addSubview:disclosureIndicatorLabel];
    [cell addSubview:metroMapCountLabel];
    [cell addSubview:metroMapTitleLabel];
    [cell addSubview:currentMetroMapLabel];
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForLanguage
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UILabel *disclosureIndicatorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    disclosureIndicatorLabel.font = [UIFont fontWithName:@"EuphemiaUCAS" size:24];
    disclosureIndicatorLabel.frame = CGRectMake(self.view.frame.size.width - 50, 18.5, 10, 30);
    disclosureIndicatorLabel.textColor = [UIColor colorWithRed:(141/255.0) green:(141/255.0) blue:(141/255.0) alpha:1];
    disclosureIndicatorLabel.text = @">";
    
    UILabel *languageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    languageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    languageLabel.frame = CGRectMake(self.view.frame.size.width - 170, 17, 100, 30);
    languageLabel.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];

    switch ([MWSettings settings].interfaceLanguage) {
        case 0:
            languageLabel.text = @"Automatic";
            break;
        case 1:
            languageLabel.text = @"English";
            break;
        case 2:
            languageLabel.text = @"Русский";
            break;
        default:
            break;
    }
    
    languageLabel.textAlignment = NSTextAlignmentRight;
    
    UILabel *languageTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    languageTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    languageTitleLabel.frame = CGRectMake(17, 17, cell.bounds.size.width - 55 - disclosureIndicatorLabel.bounds.size.width - languageLabel.bounds.size.width, 30);
    languageTitleLabel.textColor = [UIColor colorWithRed:(46/255.0) green:(51/255.0) blue:(60/255.0) alpha:1];
    languageTitleLabel.text = [MWLanguage localizedStringForKey:@"MainMenu_SettingsLanguage"];
    
    [cell addSubview:disclosureIndicatorLabel];
    [cell addSubview:languageLabel];
    [cell addSubview:languageTitleLabel];
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForEnglishTitles
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];

    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    cell.accessoryView = switchView;
    
    switchView.on = [MWSettings settings].showEnglishTitles;
    switchView.tag = 1;
    [switchView addTarget:self action:@selector(updateSwitch:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *englishTitlesTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    englishTitlesTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    englishTitlesTitleLabel.frame = CGRectMake(17, 17, cell.bounds.size.width - 50 - switchView.bounds.size.width, 30);
    englishTitlesTitleLabel.textColor = [UIColor colorWithRed:(46/255.0) green:(51/255.0) blue:(60/255.0) alpha:1];
    englishTitlesTitleLabel.text = [MWLanguage localizedStringForKey:@"MainMenu_SettingsEnglishTitles"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell addSubview:separator];
    [cell addSubview:englishTitlesTitleLabel];
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForRoutesSortType
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];

    UILabel *disclosureIndicatorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    disclosureIndicatorLabel.font = [UIFont fontWithName:@"EuphemiaUCAS" size:24];
    disclosureIndicatorLabel.frame = CGRectMake(self.view.frame.size.width - 50, 18.5, 10, 30);
    disclosureIndicatorLabel.textColor = [UIColor colorWithRed:(141/255.0) green:(141/255.0) blue:(141/255.0) alpha:1];
    disclosureIndicatorLabel.text = @">";
    
    UILabel *routesSortTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    routesSortTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    routesSortTitleLabel.frame = CGRectMake(17, 17, cell.bounds.size.width - 55 - disclosureIndicatorLabel.bounds.size.width, 30);
    routesSortTitleLabel.textColor = [UIColor colorWithRed:(46/255.0) green:(51/255.0) blue:(60/255.0) alpha:1];
    routesSortTitleLabel.text = [MWLanguage localizedStringForKey:@"MainMenu_SettingsRoutesSortingType"];

    [cell addSubview:separator];
    [cell addSubview:disclosureIndicatorLabel];
    [cell addSubview:routesSortTitleLabel];
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForAutoUpdate
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    cell.accessoryView = switchView;
    
    switchView.on = [MWSettings settings].automaticUpdates;
    switchView.tag = 2;
    [switchView addTarget:self action:@selector(updateSwitch:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *autoUpdateTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    autoUpdateTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    autoUpdateTitleLabel.frame = CGRectMake(17, 17, cell.bounds.size.width - 50 - switchView.bounds.size.width, 30);
    autoUpdateTitleLabel.textColor = [UIColor colorWithRed:(46/255.0) green:(51/255.0) blue:(60/255.0) alpha:1];
    autoUpdateTitleLabel.text = [MWLanguage localizedStringForKey:@"MainMenu_SettingsAutomaticUpdate"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell addSubview:separator];
    [cell addSubview:autoUpdateTitleLabel];
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForShowSelectedStationExplorer
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    cell.accessoryView = switchView;
    
    switchView.on = [MWSettings settings].showSelectedStationExplorer;
    switchView.tag = 3;
    [switchView addTarget:self action:@selector(updateSwitch:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    titleLabel.frame = CGRectMake(17, 17, cell.bounds.size.width - 50 - switchView.bounds.size.width, 30);
    titleLabel.textColor = [UIColor colorWithRed:(46/255.0) green:(51/255.0) blue:(60/255.0) alpha:1];
    titleLabel.text = [MWLanguage localizedStringForKey:@"MainMenu_SettingsSelectedStationExplorer"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell addSubview:separator];
    [cell addSubview:titleLabel];
    
    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForSendEmail
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];

    cell.backgroundView.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:[MWLanguage localizedStringForKey:@"MainMenu_FeedbackSendAnLetter"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake((cell.bounds.size.width - 208) / 2, 9, 208, 44.5);
    button.layer.cornerRadius = 4;
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
    
    [cell addSubview:button];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForSocialNetworkButtons
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 36.5)];
    
    cell.backgroundView.backgroundColor = [UIColor redColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    
    UIButton *FBButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [FBButton addTarget:self action:@selector(openFBURL) forControlEvents:UIControlEventTouchUpInside];
    FBButton.backgroundColor = [UIColor clearColor];
    [FBButton setBackgroundImage: [UIImage imageNamed:@"FB.png"] forState:UIControlStateNormal];

    [cell addSubview:FBButton];

    UIButton *TwitterButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [TwitterButton addTarget:self action:@selector(openTwitterURL) forControlEvents:UIControlEventTouchUpInside];
    TwitterButton.backgroundColor = [UIColor clearColor];
    [TwitterButton setBackgroundImage: [UIImage imageNamed:@"Twitter.jpg"] forState:UIControlStateNormal];
    
    [cell addSubview:TwitterButton];

    if ([MWLanguage isRussianLanguage]) {
        UIButton *VKButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [VKButton addTarget:self action:@selector(openVKURL) forControlEvents:UIControlEventTouchUpInside];
        VKButton.backgroundColor = [UIColor clearColor];
        VKButton.frame = CGRectMake(cell.bounds.size.width / 2 + 10, 0, 36.5, 36.5);
        [VKButton setBackgroundImage: [UIImage imageNamed:@"vk.png"] forState:UIControlStateNormal];
        
        [cell addSubview:VKButton];
        
        FBButton.frame = CGRectMake((cell.bounds.size.width - 73) / 2 - 10 - 10 - 36.5 / 2, 0, 36.5, 36.5);
        TwitterButton.frame = CGRectMake(cell.bounds.size.width / 2 - 36.5 / 2, 0, 36.5, 36.5);
        VKButton.frame = CGRectMake(cell.bounds.size.width / 2 + 36.5 / 2 + 20, 0, 36.5, 36.5);
    } else {
        FBButton.frame = CGRectMake((cell.bounds.size.width - 73) / 2 - 10, 0, 36.5, 36.5);
        TwitterButton.frame = CGRectMake(cell.bounds.size.width / 2 + 10, 0, 36.5, 36.5);
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForAds:(NSString *)text
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 65)];
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    label.frame = CGRectMake(17, 17, cell.bounds.size.width - 50, 30);
    label.textColor = [UIColor colorWithRed:(46/255.0) green:(51/255.0) blue:(60/255.0) alpha:1];
    label.text = text;
    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell addSubview:separator];
    [cell addSubview:label];
    
    return (UITableViewCell *)cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 69;
            break;
        case 1:
            return 66;
            break;
        case 2:
            return 66;
            break;
        case 3:
            return [MWSettings settings].areAdsRemoved ? 36.5 : 66;
            break;
        case 4:
            return 66;
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
            case 0:
            return 6.5;
            break;
        case 1:
            return 0;
            break;
        case 2:
            return [MWSettings settings].areAdsRemoved ? 0 : 50;
            break;
        case 3:
            return 0;
            break;
        case 4:
            return 0;
            break;
        default:
            return 0;
            break;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ((int)section == 2 && ![MWSettings settings].areAdsRemoved) {
        UIView *customHeader = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 20, 50)];
        customHeader.backgroundColor = [UIColor clearColor];
        
        UIView *background = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 20, 50)];
        background.backgroundColor = [UIColor whiteColor];
        [customHeader addSubview:background];

        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 15, self.view.window.bounds.size.width - 47, 20)];
        headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
        headerLabel.text = [MWLanguage localizedStringForKey:@"MainMenu_Ads"];
        
        [customHeader addSubview:headerLabel];
        
        return customHeader;
    } else {
        return [[UIView alloc] initWithFrame:CGRectZero];
    }
}

- (void)updateSwitch:(UISwitch *)switchView
{
    if (switchView) {
        if (switchView.tag == 1) {
            [MWSettings settings].showEnglishTitles = switchView.on;
        } else if (switchView.tag == 2) {
            [MWSettings settings].automaticUpdates = switchView.on;
        } else if (switchView.tag == 3) {
            [MWSettings settings].showSelectedStationExplorer = switchView.on;
        }
    }
}

- (void)sendEmail
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        NSArray *toArray = [[NSArray alloc] initWithObjects:@"kuliba@gmail.com", nil];
        [controller setToRecipients:toArray];
        [controller setSubject:[MWLanguage localizedStringForKey:@"MainMenu_FeedbackMailSubject"]];
        //[controller setMessageBody:@"Hello there" isHTML:NO];
        if (controller) {
            [self presentViewController:controller animated:YES completion:nil];
            controller = nil;
        }
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"MainMenu_FeedbackMailAlertTitle"] message:[MWLanguage localizedStringForKey:@"MainMenu_FeedbackMailAlertMessage"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (result == MFMailComposeResultSent) {
//        NSLog(@"Письмо ушло");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.section == 0) {
        MWMetroMapsViewController *metroMapsViewController = [[MWMetroMapsViewController alloc] init];
        [self presentViewController:metroMapsViewController animated:YES completion:nil];
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            MWSelectLanguageViewController *selectLanguageViewController = [[MWSelectLanguageViewController alloc] init];
            [self presentViewController:selectLanguageViewController animated:YES completion:nil];
        } else if (indexPath.row == 2) {
            MWSelectSortViewController *selectSortViewController = [[MWSelectSortViewController alloc] init];
            [self presentViewController:selectSortViewController animated:YES completion:nil];
        }
    } else if (indexPath.section == 2 && ![MWSettings settings].areAdsRemoved) {
        if (indexPath.row == 0) {
            [self showHUD];
            [[MWInApp inAppManager] removeAds];
        } else if (indexPath.row == 1) {
            [self showHUD];
            [[MWInApp inAppManager] restore];
        }
    }
}

- (void)showHUD
{
    _HUD.text = nil;
    [self.view bringSubviewToFront:_HUD.HUD];
    _HUD.spin.hidden = false;
    [_HUD show];
    [UIView animateWithDuration:0.5 animations:^{
        _fade.alpha = 1;
    }];
}

- (void)hideHUD
{
    [UIView animateWithDuration:0.5 animations:^{
        _fade.alpha = 0;
    }];
    [_HUD hide];
}

- (void)changeMetroMap
{
    [self.tableView reloadData];
}

- (void)openFBURL
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/MetroWayApp"]];
}

- (void)openTwitterURL
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/MetroWayApp"]];
}

- (void)openVKURL
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://vk.com/metroway"]];
}

- (void)inAppRestored
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView setContentOffset:CGPointZero animated:NO];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"MainMenu_AdsRemovedTitle"] message:[MWLanguage localizedStringForKey:@"MainMenu_AdsRemovedMessage"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    });
}

- (void)hideInAppHUD
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView setContentOffset:CGPointZero animated:NO];
        [self hideHUD];
    });
}

- (IBAction)swipeRecognized:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end