//
//  MMRouteButton.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 15.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWRouteButton : UIView

@property CGPoint position;
@property UIControlState state;
@property int tripTime;
@property int transfers;

- (id)initWithPosition:(CGPoint)position;

@end
