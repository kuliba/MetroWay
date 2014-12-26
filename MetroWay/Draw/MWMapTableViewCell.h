//
//  MMMapTableViewCell.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 05.08.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWListItem.h"
#import "MWLanguage.h"
#import "MWStorage.h"
#import "MWDownloadStatusButton.h"

@protocol MWTableViewCellDelegate <NSObject>
- (void)showContextBar:(id)sender;
- (void)selectMetroMap:(id)sender;
@end

@interface MWMapTableViewCell : UITableViewCell <UIGestureRecognizerDelegate>

@property (nonatomic, weak) MWListItem *listItem;
@property (nonatomic, weak) NSIndexPath *indexPath;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;
@property (nonatomic, assign) CGPoint panStartPoint;
@property (nonatomic, strong) UIView *swipeView;
@property (nonatomic, strong) UIView *additionalView;
@property (nonatomic, strong) UIView *separator1;
@property (nonatomic, strong) UIView *separator2;
@property (nonatomic, strong) UIView *separator3;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *topBarImageView;
@property (nonatomic, strong) UIButton *deleteTopButton;
@property (nonatomic, strong) UIButton *deleteBottomButton;
@property (nonatomic, strong) UIButton *downloadTopButton;
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) MWDownloadStatusButton *downloadStatusTopButton;
@property (nonatomic, strong) UILabel *closeAdditionalViewLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *sizeLabel;
@property (nonatomic, strong) UIImageView *thumbnailImageView;
@property (nonatomic, strong) UILabel *thumbnailNotAvailableLabel;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic, strong) UILabel *linesCountTitle;
@property (nonatomic, strong) UILabel *linesCountLabel;
@property (nonatomic, strong) UILabel *stationsCountTitle;
@property (nonatomic, strong) UILabel *stationsCountLabel;
@property (nonatomic, strong) UILabel *lengthTitle;
@property (nonatomic, strong) UILabel *lengthLabel;
@property (nonatomic, strong) UILabel *distanceTitle;
@property (nonatomic, strong) UILabel *distanceLabel;
@property (nonatomic, strong) UIImageView *bottomBarImageView;
@property (nonatomic, strong) UIButton *downloadBottomButton;
@property (nonatomic, strong) MWDownloadStatusButton *downloadStatusBottomButton;
@property (nonatomic, strong) UIButton *updateTopButton;
@property (nonatomic, strong) UIButton *updateBottomButton;
@property (nonatomic, strong) UIButton *selectMapBottomButton;
@property (nonatomic, strong) UIButton *selectMapTopButton;
@property (nonatomic, strong) UIButton *favoriteTopButton;
@property (nonatomic, strong) UIButton *favoriteBottomButton;
@property (nonatomic, weak) id <MWTableViewCellDelegate> delegate;

@end
