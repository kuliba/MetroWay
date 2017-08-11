//
//  MMSelectMapViewController2.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 01.08.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWSelectMapViewController.h"

@interface MWSelectMapViewController ()

@end

UITextField *searchTextField;
UIButton *backgroundButton;
UISegmentedControl *segmentedControl;
UIButton *cancelButton;
UIButton *searchButton;
UIButton *clearButton;
NSArray *nearestMetro;
NSArray *favoritesMetro;

@implementation MWSelectMapViewController

// Инициализация контроллера
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
    
    // Делаем tableView прозрачным
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 47)];
    self.tableView.tableHeaderView = headerView;
    
    [self createFilterControls:headerView];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    
    self.noMyMetroMapsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.noMyMetroMapsLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    self.noMyMetroMapsLabel.frame = CGRectMake(24, 30, screenBound.size.width - 48, 100);
    self.noMyMetroMapsLabel.textAlignment = NSTextAlignmentCenter;
    self.noMyMetroMapsLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.noMyMetroMapsLabel.textColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    self.noMyMetroMapsLabel.text = [MWLanguage localizedStringForKey:@"SelectMap_MyTabDescription"];
    self.noMyMetroMapsLabel.hidden = NO;
    self.noMyMetroMapsLabel.numberOfLines = 0;
    [self.tableView addSubview:self.noMyMetroMapsLabel];

    self.noCitiesFoundLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.noCitiesFoundLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    self.noCitiesFoundLabel.frame = CGRectMake(24, 30, screenBound.size.width - 48, 100);
    self.noCitiesFoundLabel.textAlignment = NSTextAlignmentCenter;
    self.noCitiesFoundLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.noCitiesFoundLabel.textColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    self.noCitiesFoundLabel.text = [MWLanguage localizedStringForKey:@"SelectMap_NoResultButtonTitle"];
    self.noCitiesFoundLabel.hidden = YES;
    self.noCitiesFoundLabel.numberOfLines = 0;
    [self.tableView addSubview:self.noCitiesFoundLabel];

    // Подписываемся на события
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    // обновления схемы метро
    [notificationCenter addObserver:self selector:@selector(metroMapDownloaded:) name:@"metroMapDownloaded" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    nearestMetro = [MWStorage metroMapList].nearestMetro;
    favoritesMetro = [MWStorage metroMapList].favoritesMetro;
    self.doneButton.hidden = ![MWSettings currentMetroMapIdentifier].length;
    [[MWStorage metroMapList] clearShowStatus];
    [[MWStorage metroMapList] addObserver:self forKeyPath:@"currentCoordinate" options:0 context:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[MWStorage metroMapList] removeObserver:self forKeyPath:@"currentCoordinate"];
}

static bool block = true;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (block) return;
    block = true;
    if ([keyPath isEqualToString:@"currentCoordinate"]) {
        int count = (int)[MWStorage metroMapList].nearestMetro.count;
        if ((nearestMetro.count != count) || (!nearestMetro && count > 0)) {
            nearestMetro = [MWStorage metroMapList].nearestMetro;
            [self.tableView reloadData];
        }
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        block = false;
    }
}

- (void)createFilterControls:(UIView *)placeHolder
{
    UIColor *greenColor = [UIColor colorWithRed:(76/255.0) green:(217/255.0) blue:(100/255.0) alpha:1];
    UIColor *purpleColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];

    CGRect frame = CGRectMake(20.5, 0, self.view.bounds.size.width - 109.5, 34.5);
    // Добавляем UIButton как подложку для UISegmentedControl. В противном случае сквозь невыбранный элемент виден фон
    backgroundButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backgroundButton.backgroundColor = purpleColor;
    backgroundButton.frame = frame;
    backgroundButton.layer.cornerRadius = 4;
    [backgroundButton removeFromSuperview];
    [placeHolder addSubview:backgroundButton];
    
    // Добавляем UISegmentControl
    NSArray *itemArray = [NSArray arrayWithObjects:[MWLanguage localizedStringForKey:@"SelectMap_SegmentedItem1"], [MWLanguage localizedStringForKey:@"SelectMap_SegmentedItem2"], nil];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = frame;
    segmentedControl.tintColor = greenColor;
    if ([MWSettings showAllMapsInList]) {
        segmentedControl.selectedSegmentIndex = 0;
    } else {
        segmentedControl.selectedSegmentIndex = 1;
    }
    
    // Задаем шрифт сегментов
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue-Light" size:17], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateSelected];
    
    [segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [segmentedControl removeFromSuperview];
    [placeHolder addSubview:segmentedControl];
    
    // Создаем кнопку с поиском
    frame = CGRectMake(238.5, 0, 61, 34.5);
    searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton.backgroundColor = [UIColor colorWithRed:(182/255.0) green:(190/255.0) blue:(199/255.0) alpha:1];
    searchButton.frame = frame;
    searchButton.layer.cornerRadius = 4;
    UIImage *magnifierImage = [UIImage imageNamed:@"Magnifier.png"];
    [searchButton setImage:magnifierImage forState:UIControlStateNormal];
    searchButton.tintColor = [UIColor whiteColor];
    [searchButton addTarget:self action:@selector(switchSearchControlsState) forControlEvents:UIControlEventTouchUpInside];
    [searchButton removeFromSuperview];
    [placeHolder addSubview:searchButton];
    
    // Создаем поле поиска
    frame = CGRectMake(20.5, 0, self.view.bounds.size.width - 120, 34.5);
    searchTextField = [[UITextField alloc] initWithFrame:frame];
    searchTextField.alpha = 0;
    searchTextField.backgroundColor = purpleColor;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    searchTextField.leftView = paddingView;
    searchTextField.leftViewMode = UITextFieldViewModeAlways;
    searchTextField.textColor = [UIColor whiteColor];
    searchTextField.tintColor = [UIColor whiteColor];
    searchTextField.layer.cornerRadius = 4;
    
    [searchTextField addTarget:self action:@selector(searchTextFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [searchTextField addTarget:self action:@selector(searchTextFieldDidChange) forControlEvents:UIControlEventTouchCancel];
    
    frame = CGRectMake(0, 0, 19, 19);
    clearButton = [[UIButton alloc] initWithFrame:frame];
    [clearButton setImage:[UIImage imageNamed:@"CloseGray.png"] forState:UIControlStateNormal];
    [clearButton setImage:[UIImage imageNamed:@"CloseGray.png"] forState:UIControlStateHighlighted];
    searchTextField.rightView = clearButton;
    searchTextField.rightViewMode = UITextFieldViewModeWhileEditing;
    clearButton.imageEdgeInsets = UIEdgeInsetsMake(-1, -6, 1, 6);
    clearButton.hidden = true;
    [clearButton addTarget:self action:@selector(clearSearchTextField) forControlEvents:UIControlEventTouchUpInside];
    
    [searchTextField removeFromSuperview];
    [placeHolder addSubview:searchTextField];
    
    // Создаем кнопку отмены поиска
    frame = CGRectMake(self.view.bounds.size.width - 85, 0, 65, 34.5);
    cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = frame;
    cancelButton.alpha = 0;
    [cancelButton setTitle:[MWLanguage localizedStringForKey:@"SelectMap_CancelButtonTitle"] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    [cancelButton addTarget:self action:@selector(cancelSearch) forControlEvents:UIControlEventTouchUpInside];
    
    [cancelButton removeFromSuperview];
    [placeHolder addSubview:cancelButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)done:(id)sender {
    MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
    [metroMapViewContoller hideSelectMapViewController];
}

- (void)setText
{
    NSString *text = [[MWLanguage localizedStringForKey:@"SelectMap_MainTitle"] uppercaseString];
    // Настраиваем заголовок
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSKernAttributeName value:@4 range:NSMakeRange(0, attributedString.length)];
    [self.titleLabel setAttributedText:attributedString];
    
    int y;
    
    switch ([MWSettings language]) {
        case 1:
            y = 42;
            break;
        default:
            y = 41;
            break;
    }
    
    CGRect frame = self.titleLabel.frame;
    frame.origin.y = y;
    self.titleLabel.frame = frame;
}

- (void)segmentedControlValueChanged:(UIView *)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    [MWSettings setShowAllMapsInList:segmentedControl.selectedSegmentIndex == 0];
    [[MWStorage metroMapList] clearShowStatus];
    nearestMetro = [MWStorage metroMapList].nearestMetro;
    favoritesMetro = [MWStorage metroMapList].favoritesMetro;
    [self.tableView reloadData];
}

- (void)clearSearchTextField
{
    searchTextField.text = @"";
    [self searchTextFieldDidChange];
}

- (void)cancelSearch
{
    [searchTextField resignFirstResponder];
    backgroundButton.alpha = 1;
    segmentedControl.alpha = 1;
    searchButton.alpha = 1;
    searchTextField.alpha = 0;
    cancelButton.alpha = 0;
    [[MWStorage metroMapList] clearShowStatus];
    nearestMetro = [MWStorage metroMapList].nearestMetro;
    favoritesMetro = [MWStorage metroMapList].favoritesMetro;
    [self.tableView reloadData];
}

- (void)switchSearchControlsState
{
    [self clearSearchTextField];
    [UIView animateWithDuration: 0.5 animations:^{
        backgroundButton.alpha = 0;
        segmentedControl.alpha = 0;
        searchButton.alpha = 0;
        searchTextField.alpha = 1;
        cancelButton.alpha = 1;
    }
                     completion:^(BOOL finished) {
                         [searchTextField becomeFirstResponder];
                     }
     ];
    [[MWStorage metroMapList] clearShowStatus];
    nearestMetro = [MWStorage metroMapList].nearestMetro;
    favoritesMetro = [MWStorage metroMapList].favoritesMetro;
    [self.tableView reloadData];
}

- (void)searchTextFieldDidChange
{
    clearButton.hidden = searchTextField.text.length == 0;
    NSPredicate *predicate;
    predicate = [NSPredicate predicateWithFormat: @"SELF.%@ contains[cd]%@", [MWLanguage localizedCityNameFieldName], searchTextField.text];
    self.filteredList = [[MWStorage metroMapList].items filteredArrayUsingPredicate:predicate];
    [self.tableView reloadData];
    self.noCitiesFoundLabel.hidden = !((self.filteredList.count == 0) && searchTextField.text.length > 0);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    MWList *list = [MWStorage metroMapList];

    BOOL favoritesMetroFound = favoritesMetro.count > 0;
    BOOL nearestMetroFound = nearestMetro.count > 0;
    
    int result = 0;
    
    if (searchTextField.alpha) { // Выбрана закладка поиска
        if (self.filteredList.count > 0) {
            result = 1;
        } else {
            result = 0;
        }
    } else if (segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
        result = (int)list.countries.count;
        if (nearestMetroFound) result += 1;
        self.noMyMetroMapsLabel.hidden = YES;
    } else { // Выбрана закладка "Мои"
        if (favoritesMetroFound) result += 1;
        if (nearestMetroFound) result += 1;
        self.noMyMetroMapsLabel.hidden = result > 0;
    };
    
    return result;
}

// Возвращаем количество ячеек в сегменте
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MWList *list = [MWStorage metroMapList];
    BOOL favoritesMetroFound = favoritesMetro.count > 0;
    BOOL nearestMetroFound = nearestMetro.count > 0;
    int result;

    if (searchTextField.alpha) { // Выбрана закладка поиска
        result = (int)self.filteredList.count;
    } else if (segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
        if (nearestMetroFound) {
            if (section == 0) {
                result = (int)nearestMetro.count;
            } else {
                long index = section - 1;
                NSString *country = [list.countries objectAtIndex:index];
                result = (int)[list countryItems:country].count;
            }
        } else {
            NSString *country = [list.countries objectAtIndex:section];
            result = (int)[list countryItems:country].count;
        }
    } else { // Выбрана закладка "Мои"
        if (section == 1) {
            result = (int)favoritesMetro.count;
        } else if (favoritesMetroFound && nearestMetroFound) {
            result = (int)nearestMetro.count;
        } else if (favoritesMetroFound) {
            result = (int)favoritesMetro.count;
        } else {
            result = (int)nearestMetro.count;
        }
    }
    
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Получаем элемент списка
    MWList *list = [MWStorage metroMapList];
    MWListItem *listItem = nil;
    BOOL favoritesMetroFound = favoritesMetro.count > 0;
    BOOL nearestMetroFound = nearestMetro.count > 0;
    
    if (searchTextField.alpha) { // Выбрана закладка поиска
        listItem = [self.filteredList objectAtIndex:indexPath.row];
    } else if (segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
        if (nearestMetroFound) {
            if (indexPath.section == 0) {
                listItem = [nearestMetro objectAtIndex:indexPath.row];
            } else {
                int index = (int)indexPath.section - 1;
                NSString *country = [list.countries objectAtIndex:index];
                listItem = [[list countryItems:country] objectAtIndex:indexPath.row];
            }
        } else {
            NSString *country = [list.countries objectAtIndex:indexPath.section];
            listItem = [[list countryItems:country] objectAtIndex:indexPath.row];
        }
    } else { // Выбрана закладка "Мои"
        if (indexPath.section == 1) {
            listItem = [favoritesMetro objectAtIndex:indexPath.row];
        } else if (favoritesMetroFound && nearestMetroFound) {
            listItem = [nearestMetro objectAtIndex:indexPath.row];
        } else if (favoritesMetroFound) {
            listItem = [favoritesMetro objectAtIndex:indexPath.row];
        } else {
            listItem = [nearestMetro objectAtIndex:indexPath.row];
        }
    }

    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    MWMapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[MWMapTableViewCell alloc] initWithFrame:CGRectZero];
        cell.listItem = listItem;
        cell.delegate = self;
    }
        
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    NSString *headerTitle;
    MWList *list = [MWStorage metroMapList];
    BOOL favoritesMetroFound = favoritesMetro.count > 0;
    BOOL nearestMetroFound = nearestMetro.count > 0;
    
    if (searchTextField.alpha) { // Выбрана закладка поиска
        /////
    } else if (segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
        if (nearestMetroFound && section == 0) {
            headerTitle = [MWLanguage localizedStringForKey:@"SelectMap_DistanceNearest"];
        } else {
            int index = (int)section;
            if (nearestMetroFound) {
            index --;
            }
            headerTitle = [list.countries objectAtIndex:index];
        }
    } else { // Выбрана закладка "Мои"
        if (section == 1) {
            headerTitle = [MWLanguage localizedStringForKey:@"SelectMap_FavoritesTitle"];
        } else if (favoritesMetroFound && nearestMetroFound) {
            headerTitle = [MWLanguage localizedStringForKey:@"SelectMap_DistanceNearest"];
        } else if (favoritesMetroFound) {
            headerTitle = [MWLanguage localizedStringForKey:@"SelectMap_FavoritesTitle"];
        } else {
            headerTitle = [MWLanguage localizedStringForKey:@"SelectMap_DistanceNearest"];
        }
    }

    
    UIView *customHeader = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 55)];
    
    UIView *backgroundHeader = [[UIView alloc] initWithFrame:CGRectMake(10.5, 6, self.view.window.bounds.size.width - 21, 34.5)];
    backgroundHeader.backgroundColor = [UIColor whiteColor];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    headerLabel.textColor = nearestMetroFound && section == 0 ? [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:1] : [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    headerLabel.frame = CGRectMake(21.5, 13.5, self.view.window.bounds.size.width - 47, 17);
    headerLabel.text = headerTitle;
    
    [customHeader addSubview:backgroundHeader];
    [customHeader addSubview:headerLabel];

    return customHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    float result = 40.5;
    
    if (searchTextField.alpha) { // Выбрана закладка поиска
        result = 0;
    }
    
    return result;
}

- (MWListItem *)listItem:(NSIndexPath *)indexPath
{

    MWListItem *listItem = nil;
    MWList *list = [MWStorage metroMapList];
    BOOL favoritesMetroFound = favoritesMetro.count > 0;
    BOOL nearestMetroFound = nearestMetro.count > 0;
    
    if (searchTextField.alpha) { // Выбрана закладка поиска
        listItem = [self.filteredList objectAtIndex:indexPath.row];
    } else if (segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
        if (nearestMetroFound) {
            if (indexPath.section == 0) {
                listItem = [nearestMetro objectAtIndex:indexPath.row];
            } else {
                int index = (int)indexPath.section - 1;
                NSString *country = [list.countries objectAtIndex:index];
                listItem = [[list countryItems:country] objectAtIndex:indexPath.row];
            }
        } else {
            NSString *country = [list.countries objectAtIndex:indexPath.section];
            listItem = [[list countryItems:country] objectAtIndex:indexPath.row];
        }
    } else { // Выбрана закладка "Мои"
        if (indexPath.section == 1) {
            listItem = [favoritesMetro objectAtIndex:indexPath.row];
        } else if (favoritesMetroFound && nearestMetroFound) {
            listItem = [nearestMetro objectAtIndex:indexPath.row];
        } else if (favoritesMetroFound) {
            listItem = [favoritesMetro objectAtIndex:indexPath.row];
        } else {
            listItem = [nearestMetro objectAtIndex:indexPath.row];
        }
    }

    return listItem;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MWListItem *listItem = [self listItem:indexPath];
    float result = listItem.showStatus == 1 ? 434 : 65;
    return result;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [searchTextField resignFirstResponder];
    
    MWListItem *listItem = [self listItem:indexPath];
    		
    [self.tableView beginUpdates];
    switch (listItem.showStatus) {
        case 0:
            listItem.showStatus = 1;
            break;
            case 1:
            listItem.showStatus = 0;
            break;
            case 2:
            listItem.showStatus = 1;
            break;
        default:
            break;
    }
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    
    if (listItem.showStatus == 1) {
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

- (void)showContextBar:(id)sender
{
    MWMapTableViewCell *cell = (MWMapTableViewCell *)sender;
    MWList *list = [MWStorage metroMapList];

    for (MWListItem *listItem in list.items) {
        if (![listItem isEqual:cell.listItem] && listItem.showStatus == 2) {
            listItem.showStatus = 0;
        }
    }
}

- (void)selectMetroMap:(id)sender
{
    MWMapTableViewCell *cell = (MWMapTableViewCell *)sender;
  
    if (![[MWSettings currentMetroMapIdentifier] isEqualToString:cell.listItem.identifier]) {
        [MWSettings setCurrentMetroMapIdentifier:cell.listItem.identifier];

        // Отсылаем всем сообщение, что выбрана новая схема метро
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *changeMetroMap = [NSNotification notificationWithName:@"changeMetroMap" object:nil];
        [notificationCenter postNotification:changeMetroMap];
    }
    
    MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
    [metroMapViewContoller hideAllViewControllers];
}

- (void)metroMapDownloaded:(NSNotification *)notification
{
    NSString *identifier = [notification.userInfo objectForKey:@"identifier"];
    
    // Если скачана первая схема метро
    if ([MWSettings currentMetroMapIdentifier].length == 0) {
        [MWSettings setCurrentMetroMapIdentifier:identifier];

        // Отсылаем всем сообщение, что выбрана новая схема метро
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *changeMetroMap = [NSNotification notificationWithName:@"changeMetroMap" object:nil];
        [notificationCenter postNotification:changeMetroMap];

        MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
        [metroMapViewContoller hideAllViewControllers];
    }
}

@end
