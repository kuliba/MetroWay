//
//  MMMenuViewController2.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 07.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWMenuViewController.h"

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
    [self.doneButton.titleLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:16.5]];
    [self.doneButton setTitleColor:[UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1] forState:UIControlStateNormal];
    [self.doneButton setTitle:[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarDoneButton"] forState:UIControlStateNormal];

    // Настраиваем заголовок
    NSMutableAttributedString *attributedString;
    NSString *text = [[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarTitle"] uppercaseString];
    attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSKernAttributeName value:@4 range:NSMakeRange(0, attributedString.length)];
    [self.titleLabel setAttributedText:attributedString];
    
    // Делаем tableView прозрачным
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    
    // Подписываемся на событие обновления языка интерфейса
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(setText) name:@"changeLanguage" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeMetroMap) name:@"changeMetroMap" object:nil];
}

- (void)setText
{
    self.doneButton.titleLabel.text = [MWLanguage localizedStringForKey:@"MainMenu_NavigationBarDoneButton"];
    
    // Настраиваем заголовок
    NSMutableAttributedString *attributedString;
    NSString *text = [[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarTitle"] uppercaseString];
    attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSKernAttributeName value:@4 range:NSMakeRange(0, attributedString.length)];
    [self.titleLabel setAttributedText:attributedString];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    [metroMapViewContoller hideMenuViewController];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 1;
            break;
        case 3:
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
                    default:
                        break;
                }
                break;
            case 2:
                cell = [self cellForSendEmail];
                break;
            case 3:
                cell = [self cellForSocialNetworkButtons];
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
    disclosureIndicatorLabel.frame = CGRectMake(276.5, 18.5, 10, 30);
    disclosureIndicatorLabel.textColor = [UIColor colorWithRed:(141/255.0) green:(141/255.0) blue:(141/255.0) alpha:1];
    disclosureIndicatorLabel.text = @">";

    UILabel *metroMapCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    metroMapCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    metroMapCountLabel.frame = CGRectMake(229.5, 18.5, 30, 30);
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
    MWListItem *listItem = [list itemByIdentifier:[MWSettings currentMetroMapIdentifier]];
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
    disclosureIndicatorLabel.frame = CGRectMake(276.5, 18.5, 10, 30);
    disclosureIndicatorLabel.textColor = [UIColor colorWithRed:(141/255.0) green:(141/255.0) blue:(141/255.0) alpha:1];
    disclosureIndicatorLabel.text = @">";
    
    UILabel *languageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    languageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    languageLabel.frame = CGRectMake(159.5, 17, 100, 30);
    languageLabel.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];

    switch ([MWSettings language]) {
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
    
    switchView.on = [MWSettings showEnglishTitles];
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
    disclosureIndicatorLabel.frame = CGRectMake(276.5, 18.5, 10, 30);
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
    
    switchView.on = [MWSettings automaticUpdates];
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

    return (UITableViewCell *)cell;
}

- (UITableViewCell *)cellForSocialNetworkButtons
{
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 36.5)];
    
    cell.backgroundView.backgroundColor = [UIColor redColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(openFBURL) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake((cell.bounds.size.width - 36.5) / 2, 0, 36.5, 36.5);
    [button setBackgroundImage: [UIImage imageNamed:@"FB.png"] forState:UIControlStateNormal];

    [cell addSubview:button];
    
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
            return 36.5;
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
        case 3:
            return 0;
            break;
        default:
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
    return [[UIView alloc] initWithFrame:CGRectZero];    
}

- (void)updateSwitch:(UISwitch *)switchView
{
    if (switchView) {
        if (switchView.tag == 1) {
            [MWSettings setShowEnglishTitles:switchView.on];
        } else if (switchView.tag == 2) {
            [MWSettings setAutomaticUpdates:switchView.on];
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

    MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
    
    if (indexPath.section == 0) {
        [metroMapViewContoller showSelectMapViewController:self];
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [metroMapViewContoller showSelectLanguageViewController:self];
        } else if (indexPath.row == 2) {
            [metroMapViewContoller showSelectSortViewController:self];
        }
    }
}

- (void)changeMetroMap
{
    [self.tableView reloadData];
}

- (void)openFBURL
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/MetroWayApp"]];
}

@end