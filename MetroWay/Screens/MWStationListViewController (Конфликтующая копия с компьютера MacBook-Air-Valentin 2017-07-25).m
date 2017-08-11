//
//  MMStationListViewController.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 29.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWStationListViewController.h"

@interface MWStationListViewController ()

@end

NSArray *stations;

@implementation MWStationListViewController

@synthesize is_From;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        is_From = true;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
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
    
    // Делаем фон окна темным
    self.view.backgroundColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    
    // Настраиваем кнопку "<"
    [self.doneButton.titleLabel setFont:[UIFont fontWithName:@"EuphemiaUCAS" size:29]];
    [self.doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.doneButton.titleLabel.text = @"<";
    
    // Настраиваем высоту сегментов
    CGRect frame = self.segmentedControl.frame;
    frame.size.height = 33;
    [self.segmentedControl setFrame:frame];
    
    // Задаем текст сегментов
    [self.segmentedControl setTitle:[MWLanguage localizedStringForKey:@"StationList_Stations"] forSegmentAtIndex:0];
    [self.segmentedControl setTitle:[MWLanguage localizedStringForKey:@"StationList_Lines"] forSegmentAtIndex:1];
    
    // Задаем шрифт сегментов
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue-Light" size:17], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateSelected];
    
    // Делаем tableView прозрачным
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    
    //self.tableView.tintColor = [UIColor colorWithRed:(76/255.0) green:(217/255.0) blue:(100/255.0) alpha:1];
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
}

// Сортировка строк по алфавиту (для массивов)
NSInteger stationsAlphabeticSort(id station1, id station2, void *context)
{
    MWStation *s1 = (MWStation *)station1;
    MWStation *s2 = (MWStation *)station2;
    return [s1.nameOriginal localizedCaseInsensitiveCompare:s2.nameOriginal];
}

- (NSString *)firstCharacters
{
    NSMutableString *fc;

    if (!fc) {
        NSString *firstLetter;
        
        // Получаем отсортированный массив станций
        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        stations = [NSArray arrayWithArray:[metroMap.stations sortedArrayUsingFunction:stationsAlphabeticSort context:nil]];
        
        // Собираем слово из уникальных первых букв оригинальных названий станций
        fc = [NSMutableString string];
        for (MWStation *station in stations) {
            if (station.nameOriginal.length > 0) {
                firstLetter = [station.nameOriginal substringWithRange:[station.nameOriginal rangeOfComposedCharacterSequenceAtIndex:0]];
                if ([fc rangeOfString:firstLetter].location == NSNotFound) {
                    [fc appendString:[firstLetter uppercaseString]];
                }
            }
        }
    }
    return fc;
}

// Получаем массив станций на заданную букву
- (NSArray *)stationsOnLetter:(NSArray *)stations letter:(NSString *)letter
{
    MWStation *station = nil;
    NSMutableArray *result = [NSMutableArray array];
    for (NSObject *object in stations) {
        if ([object isKindOfClass:[MWStation class]]) {
            station = (MWStation *)object;
            if ([station.nameOriginal rangeOfString:letter].location == 0) {
                [result addObject:station];
            }
        }
    }
    return result;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)select:(id)sender {
    [self.tableView reloadData];
}

- (IBAction)done:(id)sender {
    MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
    [metroMapViewContoller hideStationListViewController];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.segmentedControl.selectedSegmentIndex == 0 ?  [self firstCharacters].length : [MWStorage currentMetroMap].lines.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        NSString *firstCharacters = [self firstCharacters];
        NSString *letter = [firstCharacters substringWithRange:[firstCharacters rangeOfComposedCharacterSequenceAtIndex:section]];
        
        return [self stationsOnLetter:stations letter:letter].count;
    } else {
        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        MWLine *line = [metroMap.lines objectAtIndex:section];
        if (line.collapsed) {
            return 0;
        } else {
            NSArray *stations = [metroMap lineStations:line];
            return stations.count;
        }
    }
}

// Создание ячейки для показа станции
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWLine *line;
    MWStation *station;
    MWBaseTableViewCell *cell = [[MWBaseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];

    if (self.segmentedControl.selectedSegmentIndex == 0) {
        NSString *firstCharacters = [self firstCharacters];
        NSString *letter = [firstCharacters substringWithRange:[firstCharacters rangeOfComposedCharacterSequenceAtIndex:indexPath.section]];
        NSArray *stationsOnLetter = [self stationsOnLetter:stations letter:letter];
        station = (MWStation *)[stationsOnLetter objectAtIndex:indexPath.row];
    } else {
        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        NSArray *stations = [metroMap lineStations:[metroMap.lines objectAtIndex:indexPath.section]];
        station = [stations objectAtIndex:indexPath.row];
    }
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(14.5, 0, cell.bounds.size.width - 29, 0.5)];
    separator.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    
    UILabel *stationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    stationLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    stationLabel.frame = CGRectMake(30, 14, self.view.window.bounds.size.width - 47, 20);
    stationLabel.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
    stationLabel.text = station.nameOriginal;
    
    MWViewStationCircleR14 *stationCircle = [[MWViewStationCircleR14 alloc] initWithFrame:CGRectMake(11, 17.5, 14, 14)];
    line = [MWRouter lineByStation:station];
    stationCircle.color = line.color;
    
    [cell addSubview:separator];
    [cell addSubview:stationCircle];
    [cell addSubview:stationLabel];

    if ([MWSettings showEnglishTitles] && [metroMap englishTextExists]) {
        UILabel *englishLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        englishLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        englishLabel.frame = CGRectMake(30, 32, self.view.window.bounds.size.width - 47, 17);
        englishLabel.textColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
        englishLabel.text = station.nameEnglish;
        
        [cell addSubview:englishLabel];
    }
    
    cell.station1 = station;
    
    cell.hidden = line.collapsed && self.segmentedControl.selectedSegmentIndex == 1;
    
    return (UITableViewCell *)cell;
}

- (UIView *)headerForStations:(NSInteger)section
{
    NSString *firstCharacters = [self firstCharacters];
    NSString *letter = [firstCharacters substringWithRange:[firstCharacters rangeOfComposedCharacterSequenceAtIndex:section]];
    
    UIView *customHeader = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 34.5)];
    //    customHeader.backgroundColor = [UIColor whiteColor];
    
    float top = section == 0 ? 11 : 5;
    UIView *backgroundHeader = [[UIView alloc] initWithFrame:CGRectMake(10.5, top, self.view.window.bounds.size.width - 21, 34.5)];
    backgroundHeader.backgroundColor = [UIColor whiteColor];
    //    backgroundHeader.layer.cornerRadius = 2;

    top = section == 0 ? 21 : 15;
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    headerLabel.frame = CGRectMake(22, top, self.view.window.bounds.size.width - 47, 20);
    headerLabel.text = letter;
    
    [customHeader addSubview:backgroundHeader];
    [customHeader addSubview:headerLabel];
    return customHeader;
}

- (UIView *)headerForLine:(NSInteger)section
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWLine *line = [metroMap.lines objectAtIndex:section];
    NSArray *stations = [metroMap lineStations:line];
    float height, delta;
    
    UIControl *customHeader = [[UIControl alloc] initWithFrame:CGRectMake(10, 0, 300, 49.5)];

    height = [MWSettings showEnglishTitles] && [metroMap englishTextExists] ? 59.5 : 49.5;
    UIButton *backgroundHeader = [[UIButton alloc] initWithFrame:CGRectMake(10.5, 11, self.view.window.bounds.size.width - 21, height)];
    backgroundHeader.backgroundColor = [UIColor whiteColor];

    delta = [MWSettings showEnglishTitles] && [metroMap englishTextExists] ? 0 : 2;
    MWViewStationCircleR14 *lineCircle = [[MWViewStationCircleR14 alloc] initWithFrame:CGRectMake(21.5, 27.5 + delta, 14, 14)];
    lineCircle.color = line.color;

    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    headerLabel.frame = CGRectMake(41, 24 + delta, self.view.window.bounds.size.width - 47, 20);
    headerLabel.text = [MWDraw cutString:line.nameOriginal length:24];

    [customHeader addSubview:backgroundHeader];
    [customHeader addSubview:lineCircle];
    [customHeader addSubview:headerLabel];
    
    if ([MWSettings showEnglishTitles] && [metroMap englishTextExists]) {
        UILabel *englishLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        englishLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        englishLabel.frame = CGRectMake(41, 44, self.view.window.bounds.size.width - 47, 17);
        englishLabel.textColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
        englishLabel.text = [MWDraw cutString:line.nameEnglish length:31];
        
        [customHeader addSubview:englishLabel];
    }

    float labelTop = [MWSettings showEnglishTitles] && [metroMap englishTextExists] ? 26.5 : 20.5;

    UILabel *stationCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    if (line.collapsed) {
        stationCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        stationCountLabel.frame = CGRectMake(customHeader.bounds.size.width - 38.5, labelTop, 28.5, 30);
        stationCountLabel.textColor = [UIColor colorWithRed:(171/255.0) green:(173/255.0) blue:(177/255.0) alpha:1];
        stationCountLabel.text = [NSString stringWithFormat:@"%d", (int)stations.count];
        stationCountLabel.textAlignment = NSTextAlignmentRight;
    } else {
        stationCountLabel.font = [UIFont fontWithName:@"AppleColorEmoji" size:48];
        stationCountLabel.frame = CGRectMake(customHeader.bounds.size.width - 34.5, labelTop + 7, 28.5, 30);
        stationCountLabel.textColor = [UIColor colorWithRed:(171/255.0) green:(173/255.0) blue:(177/255.0) alpha:1];
        stationCountLabel.text = @"^";
        stationCountLabel.textAlignment = NSTextAlignmentRight;
    }
    
    [customHeader addSubview:stationCountLabel];
    
    backgroundHeader.tag = section;
    [backgroundHeader addTarget:self action:@selector(headerTap:) forControlEvents:UIControlEventTouchUpInside];
	    
    return customHeader;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        return [self headerForStations:section];
    } else {
        return [self headerForLine:section];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        return section == 0 ? 45.5 : 39.5;
    } else {
        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        MWLine *line = [metroMap.lines objectAtIndex:section];
        if (line.collapsed) {
            return [MWSettings showEnglishTitles] && [metroMap englishTextExists] ? 64.5 : 54.5;
        } else {
            return [MWSettings showEnglishTitles] && [metroMap englishTextExists] ? 70.5 : 60.5;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    int result = [MWSettings showEnglishTitles] && [metroMap englishTextExists] ? 60 : 50;
    return result;
}

// Отрабатываем тап на заголовке - секция с линией должна открываться или закрываться. Показываем станции на линии
- (void)headerTap:(UIControl *)header
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWLine *line = [metroMap.lines objectAtIndex:header.tag];
    line.collapsed = !line.collapsed;

    NSIndexSet *section = [NSIndexSet indexSetWithIndex:header.tag];
    [self.tableView reloadSections:section withRowAnimation:UITableViewRowAnimationNone];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:NSNotFound inSection:header.tag];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    metroMap = nil;
    line = nil;
    section = nil;
    indexPath = nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    MWBaseTableViewCell *cell = (MWBaseTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    if (is_From && ![metroMap.startStation isEqual:cell.station1]) {
        metroMap.startStation = cell.station1;
        // Отсылаем всем сообщение, что выбрана новая начальная станция
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *changeStartStation = [NSNotification notificationWithName:@"changeStartStation" object:nil];
        [notificationCenter postNotification:changeStartStation];
    } else if (!is_From && ![metroMap.finishStation isEqual:cell.station1]) {
        metroMap.finishStation = cell.station1;
        // Отсылаем всем сообщение, что выбрана новая начальная станция
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSNotification *changeFinishStation = [NSNotification notificationWithName:@"changeFinishStation" object:nil];
        [notificationCenter postNotification:changeFinishStation];
    }
    
    MWMetroMapViewController *metroMapViewContoller = (MWMetroMapViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
    [metroMapViewContoller hideAllViewControllers];
}

@end
