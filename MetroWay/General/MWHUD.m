//
//  HFTextHUD.m
//  HotelFace
//
//  Created by Valentin Ozerov on 12.05.15.
//  Copyright (c) 2015 Hotel-Face. All rights reserved.
//

#import "MWHUD.h"

@implementation MWHUD

@synthesize text;

- (id)initWithViewController:(UIViewController *)vc
{
    self = [super init];
    if (self) {
        _HUD = [[UIView alloc] init];
        
        _HUD.alpha = 0.0;
        
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.lineBreakMode = NSLineBreakByWordWrapping;
        _label.numberOfLines = 0;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = [UIColor whiteColor];
        [_HUD addSubview:_label];
        
        _spin = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _spin.center = CGPointMake(_HUD.frame.size.width / 2, _HUD.frame.size.height / 2);
        [_HUD addSubview:_spin];
        
        _viewController = vc;
        
        _HUD.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:0.5];
        _HUD.layer.cornerRadius = 6;
        
        [_viewController.view addSubview:_HUD];
        
        // Подписываемся на события
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(deviceOrientationDidChangeNotification:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

- (void)setHUDFrame
{
    CGSize textSize = [self textSize];
    CGSize contentSize;
    
    if (_spin.hidden) {
        [_spin stopAnimating];
    } else {
        [_spin startAnimating];
        contentSize.height = _spin.frame.size.height + 10;
        contentSize.width = _spin.frame.size.width + 10;
    }
    
    if (text.length > 0) {
        if (textSize.width + 20 > contentSize.width) {
            contentSize.width = textSize.width + 20;
        }
        contentSize.height += textSize.height + 20;
    }
    
    CGRect HUDFrame = CGRectMake(0, 0, contentSize.width + 20, contentSize.height + 15);
    
    if (HUDFrame.size.height < 50) {
        HUDFrame.size.height = 50;
    }
    
    if (HUDFrame.size.width < 50) {
        HUDFrame.size.width = 50;
    }
    
    if (!_spin.hidden && !text.length) {
        HUDFrame.size.height += 5;
    }
    
    HUDFrame.origin.x = (_viewController.view.frame.size.width - HUDFrame.size.width) / 2;
    HUDFrame.origin.y = (_viewController.view.frame.size.height - HUDFrame.size.height) / 2;
    
    _HUD.frame = HUDFrame;
    
    CGRect spinFrame = _spin.frame;
    float currentY = 15;
    
    if (!_spin.hidden) {
        spinFrame = _spin.frame;
        spinFrame.origin.x = (_HUD.frame.size.width - spinFrame.size.width ) / 2;
        spinFrame.origin.y = 15;
        _spin.frame = spinFrame;
        currentY += spinFrame.size.height + 15;
    }
    
    if (text.length > 0) {
        //        currentY += 5;
        CGRect labelFrame;
        labelFrame.size = textSize;
        labelFrame.origin.x = (HUDFrame.size.width - textSize.width) / 2;
        labelFrame.origin.y = currentY;
        
        _label.numberOfLines = 0;
        _label.frame = labelFrame;
        [_label sizeToFit];
    }
}

- (CGSize)textSize
{
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, 200)];
    testLabel.lineBreakMode = NSLineBreakByWordWrapping;
    testLabel.numberOfLines = 0;
    
    testLabel.font = [UIFont systemFontOfSize:14];
    testLabel.text = text;
    [testLabel sizeToFit];
    
    CGSize textSize = [testLabel.text boundingRectWithSize:CGSizeMake(frame.size.width / 2, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:testLabel.font} context:nil].size;
    
    return textSize;
}

- (void)deviceOrientationDidChangeNotification:(NSNotification*)note
{
    [self setHUDFrame];
}

- (void)show
{
    [self setHUDFrame];
    [UIView animateWithDuration:0.5 animations:^{
        _HUD.alpha = 1.0;
    }];
}

- (void)hide
{
    [UIView animateWithDuration:0.5 animations:^{
        _HUD.alpha = 0.0;
    }];
}

- (NSString *)text
{
    return text;
}

- (void)setText:(NSString *)t
{
    text = t;
    _label.text = text;
}

- (void)showAtPeriod:(int)inSeconds
{
    [self setHUDFrame];
    [UIView animateWithDuration:0.5 animations:^{
        _HUD.alpha = 1.0;
    } completion:^(BOOL finished) {
        [NSTimer scheduledTimerWithTimeInterval:inSeconds target:self selector:@selector(hide) userInfo:nil repeats:NO];
    }];
}

@end
