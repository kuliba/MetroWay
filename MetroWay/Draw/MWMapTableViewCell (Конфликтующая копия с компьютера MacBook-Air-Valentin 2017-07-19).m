//
//  MMMapTableViewCell.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 05.08.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWMapTableViewCell.h"

@implementation MWMapTableViewCell

@synthesize listItem;

float mainViewHeight = 65;
float additionalViewHeight = 369;
float offset = 10.5;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initSwipeView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryView = nil;
    }
    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panThisCell:)];
    self.panRecognizer.delegate = self;
    [self.contentView addGestureRecognizer:self.panRecognizer];

    self.backgroundColor = [UIColor clearColor];

    return self;
}

- (void)initTopBar
{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGRect frame = CGRectMake(0, 0, screenBound.size.width - offset * 2, 65);
    
    self.topBarImageView = [[UIImageView alloc] initWithFrame:frame];
    self.topBarImageView.image = [UIImage imageNamed:@"grid.png"];
    self.topBarImageView.backgroundColor = [UIColor whiteColor];
    self.topBarImageView.contentMode = UIViewContentModeTopRight;
    [self.contentView addSubview:self.topBarImageView];
    [self.contentView sendSubviewToBack:self.topBarImageView];
    
    self.separator1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width - offset * 2, 0.5)];
    self.separator1.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.separator1];

    self.separator2 = [[UIView alloc] initWithFrame:CGRectMake(13.5, 0, self.bounds.size.width - 48, 0.5)];
    self.separator2.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    [self.contentView addSubview:self.separator2];

    self.separator3 = [[UIView alloc] initWithFrame:CGRectMake([MWSettings.currentMetroMapIdentifier isEqualToString:listItem.identifier] ? screenBound.size.width - 141.5 : screenBound.size.width - 206.5, 0, 0.5, 65)];
    self.separator3.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
    [self.contentView insertSubview:self.separator3 aboveSubview:self.topBarImageView];
    
    self.deleteTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deleteTopButton setImage: [UIImage imageNamed:@"Delete.png"] forState:UIControlStateNormal];
    [self.deleteTopButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    self.deleteTopButton.backgroundColor = [UIColor clearColor];
    self.deleteTopButton.frame = CGRectMake(screenBound.size.width - 82, 0, 65, 65);
    self.deleteTopButton.tintColor = [UIColor colorWithRed:(112/255.0) green:(112/255.0) blue:(112/255.0) alpha:1];
    [self.contentView insertSubview:self.deleteTopButton aboveSubview:self.topBarImageView];
    
    float x = [MWSettings.currentMetroMapIdentifier isEqualToString:listItem.identifier] ? screenBound.size.width - 82 : screenBound.size.width - 140;
    
    self.favoriteTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.favoriteTopButton setImage: [UIImage imageNamed:@"StarOff.png"] forState:UIControlStateNormal];
    [self.favoriteTopButton addTarget:self action:@selector(setFavorite) forControlEvents:UIControlEventTouchUpInside];
    self.favoriteTopButton.backgroundColor = [UIColor clearColor];
    self.favoriteTopButton.frame = CGRectMake(x, 0, 65, 65);
    self.favoriteTopButton.tintColor = [UIColor colorWithRed:(112/255.0) green:(112/255.0) blue:(112/255.0) alpha:1];
    [self.contentView insertSubview:self.favoriteTopButton aboveSubview:self.topBarImageView];

    x = [MWSettings.currentMetroMapIdentifier isEqualToString:listItem.identifier] ? screenBound.size.width - 140 : screenBound.size.width - 203.5;
    
    self.selectMapTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectMapTopButton setImage: [UIImage imageNamed:@"Map.png"] forState:UIControlStateNormal];
    [self.selectMapTopButton addTarget:self action:@selector(selectMetroMap) forControlEvents:UIControlEventTouchUpInside];
    self.selectMapTopButton.backgroundColor = [UIColor clearColor];
    self.selectMapTopButton.frame = CGRectMake(x, 0, 65, 65);
    self.selectMapTopButton.tintColor = [UIColor colorWithRed:(112/255.0) green:(112/255.0) blue:(112/255.0) alpha:1];
    [self.contentView insertSubview:self.selectMapTopButton aboveSubview:self.topBarImageView];
}

- (void)initSwipeView
{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGRect frame = CGRectMake(0, 0.5, screenBound.size.width - offset * 2, 64.5);

    self.swipeView = [[UIView alloc] initWithFrame:frame];
    self.swipeView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.swipeView];

    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 8, self.bounds.size.width - 50, 30)];
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    self.titleLabel.textColor = [UIColor colorWithRed:(21/255.0) green:(125/255.0) blue:(251/255.0) alpha:1];
    [self.swipeView addSubview:self.titleLabel];

    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 30, self.bounds.size.width - 50, 30)];
    self.dateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.dateLabel.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    [self.swipeView addSubview:self.dateLabel];

    self.sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(87, 30, self.bounds.size.width - 50, 30)];
    self.sizeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.sizeLabel.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    [self.swipeView addSubview:self.sizeLabel];

    self.downloadStatusTopButton = [[MWDownloadStatusButton alloc] initWithFrame:CGRectMake(frame.size.width - 65, 0, 65, 65)];
    [self.downloadStatusTopButton addTarget:self action:@selector(cancelDownload) forControlEvents:UIControlEventTouchUpInside];
    [self.swipeView addSubview:self.downloadStatusTopButton];
    
    self.downloadTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.downloadTopButton setImage:[UIImage imageNamed:@"Download.png"] forState:UIControlStateNormal];
    [self.downloadTopButton addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    self.downloadTopButton.frame = CGRectMake(self.swipeView.frame.size.width - 65, 0, 65, 65);
    self.downloadTopButton.tintColor = [UIColor colorWithRed:(112/255.0) green:(112/255.0) blue:(112/255.0) alpha:1];
    [self.swipeView addSubview:self.downloadTopButton];
    
    self.closeAdditionalViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 46.5, 26, 28.5, 30)];
    self.closeAdditionalViewLabel.font = [UIFont fontWithName:@"AppleColorEmoji" size:48];
    self.closeAdditionalViewLabel.textColor = [UIColor colorWithRed:(171/255.0) green:(173/255.0) blue:(177/255.0) alpha:1];
    self.closeAdditionalViewLabel.text = @"^";
    [self.swipeView addSubview:self.closeAdditionalViewLabel];
    
    self.updateTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.updateTopButton.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
    [self.updateTopButton addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    self.updateTopButton.frame = CGRectMake(169, 36, 71, 16);
    self.updateTopButton.tintColor = [UIColor whiteColor];
    self.updateTopButton.layer.cornerRadius = 4;
    [self.updateTopButton setTitle:[MWLanguage localizedStringForKey:@"SelectMap_UpdateButtonTitle"] forState:UIControlStateNormal];
    self.updateTopButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    [self.swipeView addSubview:self.updateTopButton];
}

- (void)initAdditionalView
{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGRect frame = CGRectMake(0, 0, screenBound.size.width - offset * 2, 65);

    frame.size.height = additionalViewHeight;
    frame.origin.y += mainViewHeight;
    self.additionalView = [[UIView alloc] initWithFrame:frame];
    self.additionalView.clipsToBounds = true;
    self.additionalView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.additionalView];

    self.thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, 274.5, 194.5)]; // 549 x 389
    self.thumbnailImageView.backgroundColor = [UIColor whiteColor];
    self.thumbnailImageView.layer.borderColor = [UIColor colorWithRed:(206/255.0) green:(206/255.0) blue:(206/255.0) alpha:1].CGColor;
    self.thumbnailImageView.layer.borderWidth = 0.5f;
    [self.additionalView addSubview:self.thumbnailImageView];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectMetroMap)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.delegate = self;
    self.thumbnailImageView.userInteractionEnabled = YES;
    [self.thumbnailImageView addGestureRecognizer:tapRecognizer];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.spinner.center = CGPointMake(self.thumbnailImageView.frame.size.width / 2, self.thumbnailImageView.frame.size.height / 2);
    [self.thumbnailImageView addSubview:self.spinner];
    
    self.thumbnailNotAvailableLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 85, self.thumbnailImageView.bounds.size.width, 24)];
    self.thumbnailNotAvailableLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.thumbnailNotAvailableLabel.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    self.thumbnailNotAvailableLabel.text = [MWLanguage localizedStringForKey:@"SelectMap_ThumbnailNotAvailable"];
    self.thumbnailNotAvailableLabel.textAlignment = NSTextAlignmentCenter;
    self.thumbnailNotAvailableLabel.hidden = YES;
    [self.thumbnailImageView addSubview:self.thumbnailNotAvailableLabel];
    
    self.linesCountTitle = [[UILabel alloc] initWithFrame:CGRectMake(11, 200, self.bounds.size.width - 50, 30)];
    self.linesCountTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.linesCountTitle.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    self.linesCountTitle.text = [MWLanguage localizedStringForKey:@"SelectMap_LinesCountTitle"];
    [self.additionalView addSubview:self.linesCountTitle];
    
    self.linesCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBound.size.width / 2, 200, 70, 30)];
    self.linesCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.linesCountLabel.textColor = [UIColor blackColor];
    self.linesCountLabel.textAlignment = NSTextAlignmentRight;
    [self.additionalView addSubview:self.linesCountLabel];
    
    self.stationsCountTitle = [[UILabel alloc] initWithFrame:CGRectMake(11, 220, self.bounds.size.width - 50, 30)];
    self.stationsCountTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.stationsCountTitle.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    self.stationsCountTitle.text = [MWLanguage localizedStringForKey:@"SelectMap_StationsCountTitle"];
    [self.additionalView addSubview:self.stationsCountTitle];
    
    self.stationsCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBound.size.width / 2, 220, 70, 30)];
    self.stationsCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.stationsCountLabel.textColor = [UIColor blackColor];
    self.stationsCountLabel.textAlignment = NSTextAlignmentRight;
    [self.additionalView addSubview:self.stationsCountLabel];
    
    self.lengthTitle = [[UILabel alloc] initWithFrame:CGRectMake(11, 240, self.bounds.size.width - 50, 30)];
    self.lengthTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.lengthTitle.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    self.lengthTitle.text = [MWLanguage localizedStringForKey:@"SelectMap_LengthTitle"];
    [self.additionalView addSubview:self.lengthTitle];
    
    self.lengthLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBound.size.width / 2, 240, 70, 30)];
    self.lengthLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.lengthLabel.textColor = [UIColor blackColor];
    self.lengthLabel.textAlignment = NSTextAlignmentRight;
    [self.additionalView addSubview:self.lengthLabel];
    
    self.distanceTitle = [[UILabel alloc] initWithFrame:CGRectMake(11, 260, self.bounds.size.width - 50, 30)];
    self.distanceTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.distanceTitle.textColor = [UIColor colorWithRed:(76/255.0) green:(76/255.0) blue:(76/255.0) alpha:1];
    self.distanceTitle.text = [MWLanguage localizedStringForKey:@"SelectMap_DistanceTitle"];
    [self.additionalView addSubview:self.distanceTitle];
    
    self.distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBound.size.width / 2, 260, 70, 30)];
    self.distanceLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.distanceLabel.textColor = [UIColor blackColor];
    self.distanceLabel.text = [NSString stringWithFormat:@"%f", listItem.distance];
    self.distanceLabel.textAlignment = NSTextAlignmentRight;
    [self.additionalView addSubview:self.distanceLabel];
    
    frame.origin.y = 304;
    self.bottomBarImageView = [[UIImageView alloc] initWithFrame:frame];
    self.bottomBarImageView.image = [UIImage imageNamed:@"grid.png"];
    self.bottomBarImageView.backgroundColor = [UIColor whiteColor];
    self.bottomBarImageView.contentMode = UIViewContentModeTopRight;
    self.bottomBarImageView.layer.borderColor = [UIColor colorWithRed:(240/255.0) green:(242/255.0) blue:(244/255.0) alpha:1].CGColor;
    self.bottomBarImageView.layer.borderWidth = 0.5f;
    [self.additionalView addSubview:self.bottomBarImageView];
    
    // Bottom panel
    self.downloadStatusBottomButton = [[MWDownloadStatusButton alloc] initWithFrame:CGRectMake(screenBound.size.width / 2 - 44.5, 304, 65, 65)];
    [self.downloadStatusBottomButton addTarget:self action:@selector(cancelDownload) forControlEvents:UIControlEventTouchUpInside];
    [self.additionalView addSubview:self.downloadStatusBottomButton];

    self.downloadBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.downloadBottomButton.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
    [self.downloadBottomButton addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    self.downloadBottomButton.frame = CGRectMake(70, 315.5, 154, 42);
    self.downloadTopButton.tintColor = [UIColor whiteColor];
    self.downloadBottomButton.layer.cornerRadius = 4;
    [self.downloadBottomButton setTitle:[MWLanguage localizedStringForKey:@"SelectMap_DownloadButtonTitle"] forState:UIControlStateNormal];
    self.downloadBottomButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    [self.additionalView addSubview:self.downloadBottomButton];
    
    self.updateBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.updateBottomButton setImage: [UIImage imageNamed:@"Update.png"] forState:UIControlStateNormal];
    [self.updateBottomButton addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    self.updateBottomButton.backgroundColor = [UIColor clearColor];
    self.updateBottomButton.frame = CGRectMake(10, 304, 65, 65);
    self.updateBottomButton.tintColor = [UIColor colorWithRed:(112/255.0) green:(112/255.0) blue:(112/255.0) alpha:1];
    [self.additionalView addSubview:self.updateBottomButton];
    
    self.selectMapBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectMapBottomButton setImage: [UIImage imageNamed:@"Map.png"] forState:UIControlStateNormal];
    [self.selectMapBottomButton addTarget:self action:@selector(selectMetroMap) forControlEvents:UIControlEventTouchUpInside];
    self.selectMapBottomButton.backgroundColor = [UIColor clearColor];
    self.selectMapBottomButton.frame = CGRectMake(10, 304, 65, 65);
    self.selectMapBottomButton.tintColor = [UIColor colorWithRed:(112/255.0) green:(112/255.0) blue:(112/255.0) alpha:1];
    [self.additionalView addSubview:self.selectMapBottomButton];
    
    self.favoriteBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.favoriteBottomButton setImage: [UIImage imageNamed:@"StarOff.png"] forState:UIControlStateNormal];
    [self.favoriteBottomButton addTarget:self action:@selector(setFavorite) forControlEvents:UIControlEventTouchUpInside];
    self.favoriteBottomButton.backgroundColor = [UIColor clearColor];
    self.favoriteBottomButton.frame = CGRectMake(10, 304, 65, 65);
    self.favoriteBottomButton.tintColor = [UIColor colorWithRed:(112/255.0) green:(112/255.0) blue:(112/255.0) alpha:1];
    [self.additionalView addSubview:self.favoriteBottomButton];
    
    self.deleteBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deleteBottomButton setImage: [UIImage imageNamed:@"Delete.png"] forState:UIControlStateNormal];
    [self.deleteBottomButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    self.deleteBottomButton.backgroundColor = [UIColor clearColor];
    self.deleteBottomButton.frame = CGRectMake(10, 304, 65, 65);
    self.deleteBottomButton.tintColor = [UIColor colorWithRed:(112/255.0) green:(112/255.0) blue:(112/255.0) alpha:1];
    [self.additionalView addSubview:self.deleteBottomButton];
    
    downloadedThumbnail = NO;
}

- (void)awakeFromNib
{
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setListItem:(MWListItem *)li
{
    listItem = li;
    
    if (listItem.showStatus == 2) {
        [self initTopBar];
        [self setButtons];
    } else if (listItem.showStatus == 1) {
        [self initAdditionalView];
        [self setButtons];
    }
    
    self.titleLabel.text = [MWLanguage LocalizedCurrentMetroMapName:listItem];
    [self changeHeight];
    if (listItem.showStatus == 2) {
        CGRect frame = self.swipeView.frame;
        frame.origin.x -= [self swipeShift];
        self.swipeView.frame = frame;
    }
    
    //[self setButtons];
    
    self.downloadTopButton.hidden = listItem.versionNumberOnDevice > 0 || listItem.downloadTask || listItem.showStatus == 1;
    self.downloadStatusTopButton.hidden = listItem.downloadTask == nil || listItem.showStatus == 1;
    
    self.updateTopButton.hidden = !listItem.isNewVersionAvailable;
    self.updateTopButton.backgroundColor = listItem.showStatus == 1 ? [UIColor colorWithRed:(193/255.0) green:(197/255.0) blue:(203/255.0) alpha:1] : [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
    
    self.downloadStatusTopButton.progress = listItem.downloadProgress;
    self.downloadStatusBottomButton.progress = listItem.downloadProgress;
    
    self.dateLabel.text = listItem.versionDateText;
    
    self.sizeLabel.text = listItem.sizeText;
    self.sizeLabel.hidden = listItem.size == 0;
    self.linesCountLabel.text = [NSString stringWithFormat:@"%d", listItem.linesCount];
    self.stationsCountLabel.text = [NSString stringWithFormat:@"%d", listItem.stationsCount];
    self.lengthLabel.text = [NSString stringWithFormat:@"%d %@", listItem.length, [MWLanguage localizedStringForKey:@"SelectMap_KilometersShort"]];
    [self setDistanceLabelText];

    NSString *favofiteIconName = listItem.favorited ? @"StarOn.png" : @"StarOff.png";
    [self.favoriteBottomButton setImage: [UIImage imageNamed:favofiteIconName] forState:UIControlStateNormal];
    [self.favoriteTopButton setImage: [UIImage imageNamed:favofiteIconName] forState:UIControlStateNormal];

    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGRect frame = self.separator3.frame;
    frame.origin.x = [MWSettings.currentMetroMapIdentifier isEqualToString:listItem.identifier] ? screenBound.size.width - 141.5 : screenBound.size.width - 206.5;
    self.separator3.frame = frame;
    
    frame = self.favoriteTopButton.frame;
    frame.origin.x = [MWSettings.currentMetroMapIdentifier isEqualToString:listItem.identifier] ? screenBound.size.width - 82 : screenBound.size.width - 140;
    self.favoriteTopButton.frame = frame;
    
    frame = self.selectMapTopButton.frame;
    frame.origin.x = [MWSettings.currentMetroMapIdentifier isEqualToString:listItem.identifier] ? screenBound.size.width - 140 : screenBound.size.width - 203.5;
    self.selectMapTopButton.frame = frame;
    
    [listItem addObserver:self forKeyPath:@"showStatus" options:0 context:nil];
    [listItem addObserver:self forKeyPath:@"downloadProgress" options:0 context:nil];
    [listItem addObserver:self forKeyPath:@"versionNumberOnDevice" options:0 context:nil];
    [listItem addObserver:self forKeyPath:@"distance" options:0 context:nil];
    [listItem addObserver:self forKeyPath:@"size" options:0 context:nil];
}

- (MWListItem *)listItem
{
    return listItem;				
}

static BOOL downloadedThumbnail = false;
- (void)initThumbnailImageView:(NSNotification *)notification
{
    if (self.thumbnailImageView.image) return;

    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSString *notificationName = @"thumbnail_downloaded";
    NSString *identifier = nil;
    BOOL downloaded = NO;
    UIImage *image;
    
    if (notification) {
        identifier = [notification.userInfo objectForKey:@"identifier"];
        if ([listItem.identifier isEqualToString:identifier]) {
            image = [MWStorage thumbnail:listItem.identifier];
            if (image) {
                downloaded = YES;
            }
        }
    }
    
    if (downloaded) {
        // Отписываемся от событий
        [notificationCenter removeObserver:self name:notificationName object:nil];

        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
            [self.spinner stopAnimating];
            self.spinner.hidden = true;
        });

        [self.thumbnailNotAvailableLabel removeFromSuperview];
        self.thumbnailNotAvailableLabel.hidden = YES;

        CGRect frame = self.thumbnailImageView.frame;
        frame.size = image.size;
        // Устанавливаем изображение в центре
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        frame.origin.x = screenBound.size.width / 2 - image.size.width / 2 - offset;
        frame.origin.y = (389 / 2 - image.size.height) / 2;

        popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
            self.thumbnailImageView.frame = frame;
            self.thumbnailImageView.image = image;
        });

    } else {
        if (downloadedThumbnail || ![MWDownload isConnectionAvailable]) {
            downloadedThumbnail = NO;
            // Отписываемся от события
            [notificationCenter  removeObserver:self name:notificationName object:nil];
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
                [self.spinner stopAnimating];
                self.spinner.hidden = true;
                self.thumbnailImageView.backgroundColor = [UIColor colorWithRed:(250/255.0) green:(250/255.0) blue:(250/255.0) alpha:1];
                self.thumbnailNotAvailableLabel.hidden = NO;
            });
        }
        [self.spinner startAnimating];
        // Подписываемся на событие, по которому мы можем отследить окончание загрузки превьюшки
        [notificationCenter addObserver:self selector:@selector(initThumbnailImageView:) name:notificationName object:nil];
        downloadedThumbnail = true;
        [MWDownload downloadThumbnail:listItem.identifier];
    }
}

- (void)changeHeight
{
    CGRect frame = self.additionalView.frame;
    if (listItem && listItem.showStatus == 1) {
        if (!self.additionalView) [self initAdditionalView];
        
        ;
        frame.size.height = additionalViewHeight;
        self.closeAdditionalViewLabel.hidden = false;
        [self initThumbnailImageView:nil];
    } else {
        frame.size.height = 0;
        self.closeAdditionalViewLabel.hidden = true;
    }
    [self.additionalView setFrame:frame];
//    [self setInstrumentalBar];
}

- (void)panThisCell:(UIPanGestureRecognizer *)recognizer
{
    CGPoint currentPoint;
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.panStartPoint = [recognizer translationInView:self.swipeView];
            break;
            
        case UIGestureRecognizerStateChanged:
            currentPoint = [recognizer translationInView:self.swipeView];
            if (currentPoint.x < self.panStartPoint.x - 36) {
                [self leftPan];
            } else if (currentPoint.x > self.panStartPoint.x + 36) {
                [self rightPan];
            }
            break;
            
        case UIGestureRecognizerStateEnded:
            break;
            
        case UIGestureRecognizerStateCancelled:
            break;
            
        default:
            break;
    }
}

- (void)leftPan
{
    if (listItem.showStatus == 2) return;
    
    if (!self.topBarImageView) [self initTopBar];
    
    [self setButtons];
    
    if (listItem.versionNumberOnDevice > 0 && listItem.showStatus == 0) {
        if ([self.delegate respondsToSelector:@selector(showContextBar:)]) {
            [self.delegate showContextBar:self];
        }
        CGRect frame = self.swipeView.frame;
        frame.origin.x -= [self swipeShift];
        listItem.showStatus = 2;
        [UIView animateWithDuration: 0.5 animations:^{
            self.swipeView.frame = frame;
        }
                         completion:^(BOOL finished) {
                         }
         ];
    }
}

- (void)rightPan
{
    if (listItem.showStatus == 2) {
        CGRect frame = self.swipeView.frame;
        frame.origin.x += [self swipeShift];
        listItem.showStatus = 0;
        [UIView animateWithDuration: 0.5 animations:^{
            self.swipeView.frame = frame;
        }
                         completion:^(BOOL finished) {
                         }
         ];

    }
}

- (void)swipeOff
{
    CGRect frame = self.swipeView.frame;

    if (frame.origin.x >= 0) {
        return;
    }
    
    frame.origin.x += [self swipeShift];
    [UIView animateWithDuration: 0.5 animations:^{
        self.swipeView.frame = frame;
    }
                        completion:^(BOOL finished) {
                        }
        ];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (float)swipeShift
{
    float result;
    
    if (listItem.versionNumberOnDevice == 0) {
        result = 0;
    } else if ([MWSettings.currentMetroMapIdentifier isEqualToString:listItem.identifier]) {
        result = 2 * 65 + offset - 20;
    } else {
        result = 3 * 65 + offset - 20;
    }

    return result;
}

- (void)setButtons
{
    if (!listItem) return;
    
    BOOL isNewVersionAvailable = listItem.isNewVersionAvailable;

    self.deleteTopButton.hidden = !listItem.isDeleteEnabled || listItem.showStatus == 1;
    self.favoriteTopButton.hidden = listItem.downloadTask || listItem.showStatus == 1 || listItem.versionNumberOnDevice == 0;
    self.downloadTopButton.hidden = listItem.versionNumberOnDevice > 0 || listItem.downloadTask || listItem.showStatus == 1;
    self.downloadStatusTopButton.hidden = listItem.downloadTask == nil || listItem.showStatus == 1;
    self.closeAdditionalViewLabel.hidden = listItem.showStatus != 1;
    
    self.downloadBottomButton.hidden = listItem.versionNumberOnDevice > 0 || listItem.downloadTask || listItem.showStatus != 1;
    self.downloadStatusBottomButton.hidden = listItem.downloadTask == nil || listItem.showStatus != 1;
    
    self.updateTopButton.hidden = !isNewVersionAvailable;
    self.updateTopButton.backgroundColor = listItem.showStatus == 1 ? [UIColor colorWithRed:(193/255.0) green:(197/255.0) blue:(203/255.0) alpha:1] : [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];

    self.updateBottomButton.hidden = !isNewVersionAvailable || listItem.downloadTask || listItem.showStatus != 1 || listItem.versionNumberOnDevice == 0;
    self.selectMapBottomButton.hidden = listItem.versionNumberOnDevice == 0 || listItem.downloadTask || listItem.showStatus != 1;
    self.favoriteBottomButton.hidden = listItem.downloadTask || listItem.showStatus != 1 || listItem.versionNumberOnDevice == 0;
    self.deleteBottomButton.hidden = !listItem.isDeleteEnabled || listItem.showStatus != 1;
    
    float x1 = 0;
    float x2 = 0;
    float x3 = 0;
    float x4 = 0;
    
    if (isNewVersionAvailable) {
        x1 = (self.frame.size.width - 65 * 4 - offset * 2) / 5 + self.frame.origin.x;
        x2 = (self.frame.size.width - 65 * 4 - offset * 2) * 2 / 5 + 65 + self.frame.origin.x;
        x3 = (self.frame.size.width - 65 * 4 - offset * 2) * 3 / 5 + 130 + self.frame.origin.x;
        x4 = (self.frame.size.width - 65 * 4 - offset * 2) * 4 / 5 + 195 + self.frame.origin.x;
    } else if (![listItem.identifier isEqualToString:[MWSettings currentMetroMapIdentifier]]) {
        x2 = (self.frame.size.width - 65 * 3 - offset * 2) / 4 + self.frame.origin.x;
        x3 = (self.frame.size.width - 65 * 3 - offset * 2) * 2 / 4 + 65 + self.frame.origin.x;
        x4 = (self.frame.size.width - 65 * 3 - offset * 2) * 3 / 4 + 130 + self.frame.origin.x;
    } else {
        x2 = (self.frame.size.width - 65 * 2 - offset * 2) / 3 + self.frame.origin.x;
        x3 = (self.frame.size.width - 65 * 2 - offset * 2) * 2 / 3 + 65 + self.frame.origin.x;
    }
    
    CGRect frame = self.updateBottomButton.frame;
    frame.origin.x = x1;
    self.updateBottomButton.frame = frame;
    
    frame.origin.x = x2;
    self.selectMapBottomButton.frame = frame;
    
    frame.origin.x = x3;
    self.favoriteBottomButton.frame = frame;

    frame.origin.x = x4;
    self.deleteBottomButton.frame = frame;
    
    NSString *favofiteIconName = listItem.favorited ? @"StarOn.png" : @"StarOff.png";
    [self.favoriteBottomButton setImage: [UIImage imageNamed:favofiteIconName] forState:UIControlStateNormal];
    [self.favoriteTopButton setImage: [UIImage imageNamed:favofiteIconName] forState:UIControlStateNormal];
}

- (void)delete
{
    // Подтверждение об удалении
    self.alertView = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"SelectMap_PopupMenuDeleteAlertDialogTitle"] message:[MWLanguage localizedStringForKey:@"SelectMap_PopupMenuDeleteAlertDialogMessage"] delegate:self cancelButtonTitle:[MWLanguage localizedStringForKey:@"SelectMap_PopupMenuDeleteAlertDialogCancel"] otherButtonTitles:[MWLanguage localizedStringForKey:@"SelectMap_PopupMenuDeleteAlertDialogDelete"], nil];
    self.alertView.tag = 1;
    [self.alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Окно с требованием подтверждения удалени схемы метро
    if (self.alertView.tag == 1) {
        // Удаляем схему после подтверждения
        if (buttonIndex == 1) {
            [MWStorage deleteMetroMap:listItem.identifier];
            listItem.versionNumberOnDevice = 0;
            [listItem.downloadTask cancel];
            listItem.downloadTask = nil;
            [[MWStorage metroMapList] save];
            
            if (listItem.showStatus == 2) {
                listItem.showStatus = 0;
                [UIView animateWithDuration: 0.5 animations:^{
                    CGRect frame = self.swipeView.frame;
                    frame.origin.x = self.contentView.frame.origin.x - offset;
                    self.swipeView.frame = frame;
                }
                                completion:^(BOOL finished) {
                            }
                 ];
            }
            [self setButtons];
        }
    }
}

- (void)download
{
    // Если интернета нет, выводим предупреждающее окно
    if (![MWDownload isConnectionAvailable]) {
        self.alertView = [[UIAlertView alloc] initWithTitle:[MWLanguage localizedStringForKey:@"SelectMap_NoInternetAlertViewTitle"] message:[MWLanguage localizedStringForKey:@"SelectMap_NoInternetAlertViewMessage"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        self.alertView.tag = 2;
        [self.alertView show];
    } else {
        //// Скачиваем схему метро
        [[MWDownload downloadManager] downloadMetroMap:listItem];
        [self setButtons];
    }
}

- (void)updateDownloadProgress
{
    if (self.downloadStatusTopButton) {
        self.downloadStatusTopButton.progress = listItem.downloadProgress;
    };
    
    if (self.downloadStatusBottomButton) {
        self.downloadStatusBottomButton.progress = listItem.downloadProgress;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"showStatus"]) {
        if (listItem.showStatus == 0) {
            [self swipeOff];
        }
    } else if ([keyPath isEqualToString:@"downloadProgress"]) {
        self.downloadStatusTopButton.progress = listItem.downloadProgress;
        self.downloadStatusBottomButton.progress = listItem.downloadProgress;
    } else if ([keyPath isEqualToString:@"versionNumberOnDevice"]) {
        // Отрабатываем сообщение об окончании загрузки схемы метро
        if (listItem.versionNumberOnDevice > 0) {
            listItem.downloadTask = nil;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
                [NSTimer scheduledTimerWithTimeInterval:.06 target:self selector:@selector(setButtons) userInfo:nil repeats:NO];
                if (listItem.showStatus == 0) {
                    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(leftPan) userInfo:nil repeats:NO];
                }
                if ([MWSettings currentMetroMapIdentifier].length == 0) {
                    [NSTimer scheduledTimerWithTimeInterval:.001 target:self selector:@selector(selectMetroMap) userInfo:nil repeats:NO];
                }
            });
        }
    } else if ([keyPath isEqualToString:@"distance"]) {
        [self setDistanceLabelText];
    } else if ([keyPath isEqualToString:@"size"]) {
        self.sizeLabel.text = [NSByteCountFormatter stringFromByteCount:listItem.size countStyle:NSByteCountFormatterCountStyleFile];
        self.sizeLabel.hidden = !listItem.size;
    }
}

- (void)dealloc
{
    [listItem removeObserver:self forKeyPath:@"showStatus"];
    [listItem removeObserver:self forKeyPath:@"downloadProgress"];
    [listItem removeObserver:self forKeyPath:@"versionNumberOnDevice"];
    [listItem removeObserver:self forKeyPath:@"distance"];
    [listItem removeObserver:self forKeyPath:@"size"];
}

- (void)cancelDownload
{
    [listItem.downloadTask cancel];
    listItem.downloadTask = nil;
    [self setButtons];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.contentView.frame;
    frame.origin.x = offset;
    frame.size.width -= offset * 2;
    self.contentView.frame = frame;
}

- (void)selectMetroMap
{
    if (listItem.versionNumberOnDevice > 0) {
        if ([self.delegate respondsToSelector:@selector(selectMetroMap:)]) {
            [self.delegate selectMetroMap:self];
        }
    } else if ([MWSettings currentMetroMapIdentifier].length == 0) {
        [self download];
    } else {
        [self downloadBottomButtonAnimation];
    }
}

- (void)setDistanceLabelText
{
    NSString *distanceText = @"";
    int distance = (int)listItem.distance / 1000;
    if (distance > 49)
    {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setGroupingSeparator:@" "];
        [formatter setGroupingSize:3];
        NSString *distanceString = [formatter stringFromNumber:[NSNumber numberWithInt:distance]];
        NSString *detail3 = [MWLanguage localizedStringForKey:@"SelectMap_KilometersShort"];
        
        distanceText = [@"" stringByAppendingFormat:@"%@ %@", distanceString, detail3];
    } else {
        distanceText = [MWLanguage localizedStringForKey:@"SelectMap_DistanceNear"];
    }
    
    self.distanceLabel.text = distanceText;
}

- (void)setFavorite
{
    listItem.favorited = !listItem.favorited;
    [[MWStorage metroMapList] save];
    [self setButtons];
}

- (void)downloadBottomButtonAnimation
{
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(1.3, 1.3, 1);
    CATransform3D scale2 = CATransform3DMakeScale(0.8, 0.8, 1);
    CATransform3D scale3 = CATransform3DMakeScale(1.2, 1.2, 1);
    [bounce setValues:[NSArray arrayWithObjects:
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:scale1],
                       [NSValue valueWithCATransform3D:scale2],
                       [NSValue valueWithCATransform3D:scale3],
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       nil]];
    [bounce setDuration:1.5];
    [bounce setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.downloadBottomButton.layer addAnimation:bounce forKey:@"bounceAnimation"];
}

@end
