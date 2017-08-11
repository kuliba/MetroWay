//
//  MMSelectLanguageViewController2.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 11.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWSelectLanguageViewController.h"

@interface MWSelectLanguageViewController ()

@end

@implementation MWSelectLanguageViewController

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
    
    // Настраиваем кнопку "<"
    [self.doneButton.titleLabel setFont:[UIFont fontWithName:@"EuphemiaUCAS" size:24]];
    [self.doneButton setTitleColor:[UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1] forState:UIControlStateNormal];
    self.doneButton.titleLabel.text = @"<";
    
    [self setText];

    // Настраиваем кнопку "Назад"
    [self.backButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:16.5]];
    [self.backButton setTitleColor:[UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1] forState:UIControlStateNormal];
    [self.backButton setTitle:[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarTitle"] forState:UIControlStateNormal];
    
    // Делаем tableView прозрачным
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    
    self.tableView.tintColor = [UIColor colorWithRed:(76/255.0) green:(217/255.0) blue:(100/255.0) alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)swipeRecognizer:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0,0,200,65)];
    }
        
    cell.accessoryType = UITableViewCellAccessoryCheckmark;

    if (indexPath.row > 0) {
        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
        separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
        [cell addSubview:separator];
    }
        
    UILabel *languageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    languageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    languageLabel.frame = CGRectMake(17, 17, cell.bounds.size.width - 50, 30);
    languageLabel.textColor = [UIColor colorWithRed:(46/255.0) green:(51/255.0) blue:(60/255.0) alpha:1];

    switch (indexPath.row) {
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

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    [cell addSubview:languageLabel];
    
    MWInterfaceLanguage interfaceLanguage = [MWSettings settings].interfaceLanguage;
    
    if ((interfaceLanguage == MWInterfaceLanguageAutomatic && (int)indexPath.row == 0) ||
        (interfaceLanguage == MWInterfaceLanguageEnglish && (int)indexPath.row == 1) ||
        (interfaceLanguage == MWInterfaceLanguageRussian && (int)indexPath.row == 2)) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return (UITableViewCell *)cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 6.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    static int old_language = -1;
    
    UITableViewCell *cell;
    
    switch ((int)indexPath.row) {
        case 0:
            [MWSettings settings].interfaceLanguage = MWInterfaceLanguageAutomatic;
            break;
        case 1:
            [MWSettings settings].interfaceLanguage = MWInterfaceLanguageEnglish;
            break;
        case 2:
            [MWSettings settings].interfaceLanguage = MWInterfaceLanguageRussian;
            break;
        default:
            break;
    }
    
    MWInterfaceLanguage interfaceLanguage = [MWSettings settings].interfaceLanguage;

    for (int i = 0; i < [self.tableView numberOfRowsInSection:0]; i++) {
        cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if ((i == 0 && interfaceLanguage == MWInterfaceLanguageAutomatic) ||
            (i == 1 && interfaceLanguage == MWInterfaceLanguageEnglish) ||
            (i == 2 && interfaceLanguage == MWInterfaceLanguageRussian)) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    if (old_language != interfaceLanguage) {
        old_language = interfaceLanguage;
        [self setText];
        // Отсылаем всем сообщение, что язык интерфейса изменился)
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *newMapDownloaded1 = [NSNotification notificationWithName:@"changeLanguage" object:nil];
        [notificationCenter postNotification:newMapDownloaded1];
        [[MWStorage metroMapList] clearCountryArray];
    }
}

- (void)setText
{
    [self.backButton setTitle:[MWLanguage localizedStringForKey:@"MainMenu_NavigationBarTitle"] forState:UIControlStateNormal];
    NSString *text = [[MWLanguage localizedStringForKey:@"SelectLanguage_Title"] uppercaseString];
    // Настраиваем заголовок
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSKernAttributeName value:@4 range:NSMakeRange(0, attributedString.length)];
    [self.titleLabel setAttributedText:attributedString];
}

@end
