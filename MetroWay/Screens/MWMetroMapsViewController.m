//
//  MMSelectMapViewController2.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 01.08.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWMetroMapsViewController.h"

@interface MWMetroMapsViewController ()

@end

@implementation MWMetroMapsViewController

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

    _isTableRendering = false;
    
    // Do any additional setup after loading the view from its nib.
    
    _metroMaps = [NSArray arrayWithArray:[MWStorage metroMapList].items];
    
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
    
    _noMyMetroMapsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _noMyMetroMapsLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    _noMyMetroMapsLabel.frame = CGRectMake(24, 30, screenBound.size.width - 48, 100);
    _noMyMetroMapsLabel.textAlignment = NSTextAlignmentCenter;
    _noMyMetroMapsLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _noMyMetroMapsLabel.textColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    _noMyMetroMapsLabel.text = [MWLanguage localizedStringForKey:@"SelectMap_MyTabDescription"];
    _noMyMetroMapsLabel.hidden = NO;
    _noMyMetroMapsLabel.numberOfLines = 0;
    [_tableView addSubview:_noMyMetroMapsLabel];

    _noCitiesFoundLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _noCitiesFoundLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    _noCitiesFoundLabel.frame = CGRectMake(24, 30, screenBound.size.width - 48, 100);
    _noCitiesFoundLabel.textAlignment = NSTextAlignmentCenter;
    _noCitiesFoundLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _noCitiesFoundLabel.textColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    _noCitiesFoundLabel.text = [MWLanguage localizedStringForKey:@"SelectMap_NoResultButtonTitle"];
    _noCitiesFoundLabel.hidden = YES;
    _noCitiesFoundLabel.numberOfLines = 0;
    [_tableView addSubview:_noCitiesFoundLabel];
    
    // Подписываемся на события
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];

    // обновления схемы метро
    [notificationCenter addObserver:self selector:@selector(metroMapDownloaded:) name:@"metroMapDownloaded" object:nil];
    [notificationCenter addObserver:self selector:@selector(listDownloaded:) name:@"listDownloaded" object:nil];    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _nearestMetro = [MWStorage metroMapList].nearestMetro;
    _favoritesMetro = [MWStorage metroMapList].favoritesMetro;
    self.doneButton.hidden = ![MWSettings settings].currentMetroMapIdentifier.length;
    [[MWStorage metroMapList] clearShowStatus];
    [[MWStorage metroMapList] addObserver:self forKeyPath:@"currentCoordinate" options:0 context:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[MWStorage metroMapList] removeObserver:self forKeyPath:@"currentCoordinate"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (_isTableRendering) return;
    _isTableRendering = true;
    if ([keyPath isEqualToString:@"currentCoordinate"]) {
        int count = (int)[MWStorage metroMapList].nearestMetro.count;
        if ((_nearestMetro.count != count) || (!_nearestMetro && count > 0)) {
            _nearestMetro = [MWStorage metroMapList].nearestMetro;
            [self.tableView reloadData];
        }
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        _isTableRendering = false;
        
        // Если показываем список метро в первый раз для выбора схемы, то после вывода таблицы обновляем список
        if (![MWSettings settings].currentMetroMapIdentifier.length) {
                [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(firstCheckUpdate) userInfo:nil repeats:NO];
        }
    } else if ([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] firstObject]).row) {
        _isTableRendering = true;
    }
}

- (void)firstCheckUpdate
{
    static dispatch_once_t once;

    dispatch_once(&once, ^{
        if ([MWStorage metroMapList].isNeedUpdate) {
            [MWDownload updateList];
        }
    });

}

- (void)createFilterControls:(UIView *)placeHolder
{
    UIColor *greenColor = [UIColor colorWithRed:(76/255.0) green:(217/255.0) blue:(100/255.0) alpha:1];
    UIColor *purpleColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];

    CGRect frame;
    frame.size.height = 34.5;
    frame.size.width = 200;
    frame.origin.y = 0;
    frame.origin.x = ([UIScreen mainScreen].bounds.size.width - 271) / 2;
    
    // Добавляем UIButton как подложку для UISegmentedControl. В противном случае сквозь невыбранный элемент виден фон
    _backgroundButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _backgroundButton.backgroundColor = purpleColor;
    _backgroundButton.frame = frame;
    _backgroundButton.layer.cornerRadius = 4;
    [_backgroundButton removeFromSuperview];
    [placeHolder addSubview:_backgroundButton];
    
    // Добавляем UISegmentControl
    NSArray *itemArray = [NSArray arrayWithObjects:[MWLanguage localizedStringForKey:@"SelectMap_SegmentedItem1"], [MWLanguage localizedStringForKey:@"SelectMap_SegmentedItem2"], nil];
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    _segmentedControl.frame = frame;
    _segmentedControl.tintColor = greenColor;
    if ([MWSettings settings].showAllMapsInList) {
        _segmentedControl.selectedSegmentIndex = 0;
    } else {
        _segmentedControl.selectedSegmentIndex = 1;
    }
    
    // Задаем шрифт сегментов
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue-Light" size:17], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
    [_segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [_segmentedControl setTitleTextAttributes:attributes forState:UIControlStateSelected];
    
    [_segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [_segmentedControl removeFromSuperview];
    [placeHolder addSubview:_segmentedControl];
    
    // Создаем кнопку с поиском
    frame = CGRectMake(_segmentedControl.frame.origin.x + _segmentedControl.frame.size.width + 10, 0, 61, 34.5);
    _searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _searchButton.backgroundColor = [UIColor colorWithRed:(182/255.0) green:(190/255.0) blue:(199/255.0) alpha:1];
    _searchButton.frame = frame;
    _searchButton.layer.cornerRadius = 4;
    UIImage *magnifierImage = [MWDraw resizeImageWithAspect:[UIImage imageNamed:@"Magnifier.png"] scaledToMaxWidth:16 height:16];
    [_searchButton setImage:magnifierImage forState:UIControlStateNormal];
    _searchButton.tintColor = [UIColor whiteColor];
    [_searchButton addTarget:self action:@selector(switchSearchControlsState) forControlEvents:UIControlEventTouchUpInside];
    [_searchButton removeFromSuperview];
    [placeHolder addSubview:_searchButton];
    
    // Создаем поле поиска
    frame = CGRectMake(20.5, 0, self.view.bounds.size.width - 120, 34.5);
    _searchTextField = [[UITextField alloc] initWithFrame:frame];
    _searchTextField.alpha = 0;
    _searchTextField.backgroundColor = purpleColor;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    _searchTextField.leftView = paddingView;
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    _searchTextField.textColor = [UIColor whiteColor];
    _searchTextField.tintColor = [UIColor whiteColor];
    _searchTextField.layer.cornerRadius = 4;
    
    [_searchTextField addTarget:self action:@selector(searchTextFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [_searchTextField addTarget:self action:@selector(searchTextFieldDidChange) forControlEvents:UIControlEventTouchCancel];
    
    frame = CGRectMake(0, 0, 19, 19);
    _clearButton = [[UIButton alloc] initWithFrame:frame];
    [_clearButton setImage:[MWDraw resizeImageWithAspect:[UIImage imageNamed:@"CloseGray.png"] scaledToMaxWidth:19 height:19] forState:UIControlStateNormal];
    [_clearButton setImage:[MWDraw resizeImageWithAspect:[UIImage imageNamed:@"CloseGray.png"] scaledToMaxWidth:19 height:19] forState:UIControlStateHighlighted];
    _searchTextField.rightView = _clearButton;
    _searchTextField.rightViewMode = UITextFieldViewModeWhileEditing;
    _clearButton.imageEdgeInsets = UIEdgeInsetsMake(-1, -6, 1, 6);
    _clearButton.hidden = true;
    [_clearButton addTarget:self action:@selector(clearSearchTextField) forControlEvents:UIControlEventTouchUpInside];
    
    [_searchTextField removeFromSuperview];
    [placeHolder addSubview:_searchTextField];
    
    // Создаем кнопку отмены поиска
    frame = CGRectMake(self.view.bounds.size.width - 85, 0, 65, 34.5);
    _cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _cancelButton.frame = frame;
    _cancelButton.alpha = 0;
    [_cancelButton setTitle:[MWLanguage localizedStringForKey:@"SelectMap_CancelButtonTitle"] forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    [_cancelButton addTarget:self action:@selector(cancelSearch) forControlEvents:UIControlEventTouchUpInside];
    
    [_cancelButton removeFromSuperview];
    [placeHolder addSubview:_cancelButton];
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)swipeRecognizer:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    switch ([MWSettings settings].interfaceLanguage) {
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
    [MWSettings settings].showAllMapsInList = segmentedControl.selectedSegmentIndex == 0;
    [[MWStorage metroMapList] clearShowStatus];
    _nearestMetro = [MWStorage metroMapList].nearestMetro;
    _favoritesMetro = [MWStorage metroMapList].favoritesMetro;
    [self.tableView reloadData];
}

- (void)clearSearchTextField
{
    _searchTextField.text = @"";
    [self searchTextFieldDidChange];
}

- (void)cancelSearch
{
    [_searchTextField resignFirstResponder];
    _backgroundButton.alpha = 1;
    _segmentedControl.alpha = 1;
    _searchButton.alpha = 1;
    _searchTextField.alpha = 0;
    _cancelButton.alpha = 0;
    [[MWStorage metroMapList] clearShowStatus];
    _nearestMetro = [MWStorage metroMapList].nearestMetro;
    _favoritesMetro = [MWStorage metroMapList].favoritesMetro;
    [self.tableView reloadData];
}

- (void)switchSearchControlsState
{
    [self clearSearchTextField];
    [UIView animateWithDuration: 0.5 animations:^{
        _backgroundButton.alpha = 0;
        _segmentedControl.alpha = 0;
        _searchButton.alpha = 0;
        _searchTextField.alpha = 1;
        _cancelButton.alpha = 1;
    }
                     completion:^(BOOL finished) {
                         [_searchTextField becomeFirstResponder];
                     }
     ];
    [[MWStorage metroMapList] clearShowStatus];
    _nearestMetro = [MWStorage metroMapList].nearestMetro;
    _favoritesMetro = [MWStorage metroMapList].favoritesMetro;
    [self.tableView reloadData];
}

- (void)searchTextFieldDidChange
{
    _clearButton.hidden = _searchTextField.text.length == 0;
    NSPredicate *predicate;
    predicate = [NSPredicate predicateWithFormat: @"SELF.%@ contains[cd]%@", [MWLanguage localizedCityNameFieldName], _searchTextField.text];
    _filteredList = [[MWStorage metroMapList].items filteredArrayUsingPredicate:predicate];
    [_tableView reloadData];
    _noCitiesFoundLabel.hidden = !((self.filteredList.count == 0) && _searchTextField.text.length > 0);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    MWList *list = [MWStorage metroMapList];
    BOOL favoritesMetroFound = _favoritesMetro.count > 0;
    BOOL nearestMetroFound = _nearestMetro.count > 0;
    
    int result = 0;
    
    if (_searchTextField.alpha) { // Выбрана закладка поиска
        if (self.filteredList.count > 0) {
            result = 1;
        } else {
            result = 0;
        }
    } else if (_segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
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
    BOOL favoritesMetroFound = _favoritesMetro.count > 0;
    BOOL nearestMetroFound = _nearestMetro.count > 0;
    int result;

    if (_searchTextField.alpha) { // Выбрана закладка поиска
        result = (int)self.filteredList.count;
    } else if (_segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
        if (nearestMetroFound) {
            if (section == 0) {
                result = (int)_nearestMetro.count;
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
            result = (int)_favoritesMetro.count;
        } else if (favoritesMetroFound && nearestMetroFound) {
            result = (int)_nearestMetro.count;
        } else if (favoritesMetroFound) {
            result = (int)_favoritesMetro.count;
        } else {
            result = (int)_nearestMetro.count;
        }
    }
    
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Получаем элемент списка
    MWList *list = [MWStorage metroMapList];
    MWListItem *listItem = nil;
    BOOL favoritesMetroFound = _favoritesMetro.count > 0;
    BOOL nearestMetroFound = _nearestMetro.count > 0;
    
    if (_searchTextField.alpha) { // Выбрана закладка поиска
        listItem = [self.filteredList objectAtIndex:indexPath.row];
    } else if (_segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
        if (nearestMetroFound) {
            if (indexPath.section == 0) {
                listItem = [_nearestMetro objectAtIndex:indexPath.row];
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
            listItem = [_favoritesMetro objectAtIndex:indexPath.row];
        } else if (favoritesMetroFound && nearestMetroFound) {
            listItem = [_nearestMetro objectAtIndex:indexPath.row];
        } else if (favoritesMetroFound) {
            listItem = [_favoritesMetro objectAtIndex:indexPath.row];
        } else {
            listItem = [_nearestMetro objectAtIndex:indexPath.row];
        }
    }

    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    MWMapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[MWMapTableViewCell alloc] initWithFrame:CGRectZero];
    }
    
    cell.listItem = listItem;
    cell.delegate = self;

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *headerTitle;
    MWList *list = [MWStorage metroMapList];
    BOOL favoritesMetroFound = _favoritesMetro.count > 0;
    BOOL nearestMetroFound = _nearestMetro.count > 0;
    
    if (_searchTextField.alpha) { // Выбрана закладка поиска
        /////
    } else if (_segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
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
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(21.5, 13.5, self.view.window.bounds.size.width - 47, 20)];
    headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    headerLabel.textColor = nearestMetroFound && section == 0 ? [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:1] : [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    headerLabel.text = headerTitle;
    
    [customHeader addSubview:backgroundHeader];
    [customHeader addSubview:headerLabel];

    return customHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    float result = 40.5;
    
    if (_searchTextField.alpha) { // Выбрана закладка поиска
        result = 0;
    }
    
    return result;
}

- (MWListItem *)listItem:(NSIndexPath *)indexPath
{

    MWListItem *listItem = nil;
    MWList *list = [MWStorage metroMapList];
    BOOL favoritesMetroFound = _favoritesMetro.count > 0;
    BOOL nearestMetroFound = _nearestMetro.count > 0;
    
    if (_searchTextField.alpha) { // Выбрана закладка поиска
        listItem = [self.filteredList objectAtIndex:indexPath.row];
    } else if (_segmentedControl.selectedSegmentIndex == 0) { // Выбрана закладка "Все"
        if (nearestMetroFound) {
            if (indexPath.section == 0) {
                listItem = [_nearestMetro objectAtIndex:indexPath.row];
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
            listItem = [_favoritesMetro objectAtIndex:indexPath.row];
        } else if (favoritesMetroFound && nearestMetroFound) {
            listItem = [_nearestMetro objectAtIndex:indexPath.row];
        } else if (favoritesMetroFound) {
            listItem = [_favoritesMetro objectAtIndex:indexPath.row];
        } else {
            listItem = [_nearestMetro objectAtIndex:indexPath.row];
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

    [_searchTextField resignFirstResponder];
    
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
  
    if (![[MWSettings settings].currentMetroMapIdentifier isEqualToString:cell.listItem.identifier]) {
        [MWSettings settings].currentMetroMapIdentifier = cell.listItem.identifier;

        // Отсылаем всем сообщение, что выбрана новая схема метро
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *changeMetroMap = [NSNotification notificationWithName:@"changeMetroMap" object:nil];
        [notificationCenter postNotification:changeMetroMap];
    }

    // Переходим к рутовому контроллеру
//    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    
    MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
    [metroMapViewContoller dismissModalStackAnimated:true completion:nil];
}

- (void)metroMapDownloaded:(NSNotification *)notification
{
    NSString *identifier = [notification.userInfo objectForKey:@"identifier"];
    
    // Если скачана первая схема метро
    if ([MWSettings settings].currentMetroMapIdentifier.length == 0) {
        [MWSettings settings].currentMetroMapIdentifier = identifier;
        [MWStorage storage].firstMetroMapIdentifier = identifier;

        // Отсылаем всем сообщение, что выбрана новая схема метро
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *changeMetroMap = [NSNotification notificationWithName:@"changeMetroMap" object:nil];
        [notificationCenter postNotification:changeMetroMap];

    // Переходим к рутовому контроллеру
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
        
//    MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
//    [metroMapViewContoller dismissModalStackAnimated:true completion:nil];

    }
}

- (void)listDownloaded:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView reloadData];
    });
}

@end
