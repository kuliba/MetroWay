//
//  MWHUD.h
//  MetroWay
//
//  Created by Valentin Ozerov on 13.12.15.
//  Copyright © 2015 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MWHUD : NSObject

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *HUD;
@property (nonatomic, strong) UIActivityIndicatorView *spin;

- (id)initWithViewController:(UIViewController *)viewController;
- (void)show;
- (void)hide;
- (void)showAtPeriod:(int)inSeconds;

@end
