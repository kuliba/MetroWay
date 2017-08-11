//
//  MMRouteButton.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 15.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWRouteButton.h"
#import "MWDraw.h"
#import "MWDrawTextLine.h"
#import "MWLanguage.h"
#import "MWDrawFillCircle.h"
#import "MWDrawLine.h"

@implementation MWRouteButton

@synthesize position, tripTime, transfers, state;

/*
- (id)initWithFrame:(CGRect)frame
{
    CGRect f = CGRectMake(frame.origin.x, frame.origin.y, 75, 75);
    self = [super initWithFrame:f];
    if (self) {
        // Initialization code
    }
    self.layer.cornerRadius = 6;
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (id)initWithPosition:(CGPoint)pos
{
    CGRect f = CGRectMake(pos.x, pos.y, 75, 75);
    self = [super initWithFrame:f];
    if (self) {
        // Initialization code
    }
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES;
    self.state = UIControlStateNormal;
    return self;
}

- (void)setPosition:(CGPoint)pos
{
    [self setFrame:CGRectMake(pos.x, pos.y, self.frame.size.width, self.frame.size.height)];
}

- (CGPoint)position
{
    return position;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(37.5, 0);
    drawLine0001.endPoint = CGPointMake(37.5, 49);
    drawLine0001.width = 100;
    drawLine0001.color = state == UIControlStateSelected ? [UIColor colorWithRed:(255/255.0) green:(83/255.0) blue:(34/255.0) alpha:1] : [UIColor colorWithRed:(74/255.0) green:(186/255.0) blue:(91/255.0) alpha:1];
    [MWDraw drawLine:drawLine0001 inContext:context];
    
    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(37.5, 49);
    drawLine0002.endPoint = CGPointMake(37.5, 75);
    drawLine0002.width = 100;
    drawLine0002.color = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
    [MWDraw drawLine:drawLine0002 inContext:context];

    NSString *text = [NSString stringWithFormat:@"%d %@", tripTime, [MWLanguage localizedStringForKey:@"MetroMap_RouterMaps_min"]];
    
    // Вычисляем ширину текста для размещения его по середине
    float textWidth = [text boundingRectWithSize:self.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Light" size:15] } context:nil].size.width;
    float left = (75 - textWidth) / 2;
    
    // Вычисляем вертикальную позицию текста
    float top = transfers ? 6.5 : 16;
    
    MWDrawTextLine *drawTextLine = [[MWDrawTextLine alloc] init];
    drawTextLine.text = text;
    drawTextLine.fontName = @"HelveticaNeue-Light";
    drawTextLine.fontColor = [UIColor whiteColor];
    drawTextLine.fontSize = 15;
    drawTextLine.origin = CGPointMake(left, top);
    [MWDraw drawTextLine:drawTextLine inContext:context];

    // Показываем количество пересадок только при их наличии
    if (transfers) {
        text = [NSString stringWithFormat:@"%d %@", transfers, [MWLanguage localizedStringForKey:@"MetroMap_RouterMaps_transfers_short"]];
        
        // Вычисляем ширину текста для размещения его по середине
        textWidth = [text boundingRectWithSize:self.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Light" size:15] } context:nil].size.width;
        left = (75 - textWidth) / 2;
        
        drawTextLine.text = text;
        drawTextLine.fontName = @"HelveticaNeue-Light";
        drawTextLine.fontColor = [UIColor whiteColor];
        drawTextLine.fontSize = 15;
        drawTextLine.origin = CGPointMake(left, 23.5);
        [MWDraw drawTextLine:drawTextLine inContext:context];
    }
    
    MWDrawFillCircle *drawFillCircle = [[MWDrawFillCircle alloc] init];
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
    
    switch (transfers) {
        case 0:
            drawFillCircle.center = CGPointMake(28.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(28.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(46.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];
            
            drawFillCircle.center = CGPointMake(46.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(37.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];
            
            drawLine.startPoint = CGPointMake(30, 62.5);
            drawLine.endPoint = CGPointMake(37.5, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];
            break;
        case 1:
            drawFillCircle.center = CGPointMake(20, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];
            
            drawFillCircle.center = CGPointMake(20, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(37.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];
            
            drawFillCircle.center = CGPointMake(37.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(55, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];
            
            drawFillCircle.center = CGPointMake(55, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(28.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(46.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawLine.startPoint = CGPointMake(24, 62.5);
            drawLine.endPoint = CGPointMake(28.5, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            drawLine.startPoint = CGPointMake(46.5, 62.5);
            drawLine.endPoint = CGPointMake(51, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];
            break;
            
        case 2:
            drawFillCircle.center = CGPointMake(14.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(14.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(32, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(32, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(44.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(44.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(60.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(60.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(23, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(53.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawLine.startPoint = CGPointMake(19, 62.5);
            drawLine.endPoint = CGPointMake(23, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            drawLine.startPoint = CGPointMake(53.5, 62.5);
            drawLine.endPoint = CGPointMake(58, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            drawLine.startPoint = CGPointMake(35, 62.5);
            drawLine.endPoint = CGPointMake(40, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];
            break;

        case 3:
            drawFillCircle.center = CGPointMake(8.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(8.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(25, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(25, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(37.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(37.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(50, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(50, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(66.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(66.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(16, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(59, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawLine.startPoint = CGPointMake(12, 62.5);
            drawLine.endPoint = CGPointMake(16, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            drawLine.startPoint = CGPointMake(59, 62.5);
            drawLine.endPoint = CGPointMake(63, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            drawLine.startPoint = CGPointMake(30, 62.5);
            drawLine.endPoint = CGPointMake(33, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            drawLine.startPoint = CGPointMake(42, 62.5);
            drawLine.endPoint = CGPointMake(45, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            break;
        default:
            drawLine.startPoint = CGPointMake(20, 62.5);
            drawLine.endPoint = CGPointMake(55, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            drawFillCircle.center = CGPointMake(6.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(6.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(21.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(21.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(32.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(32.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(43.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(43.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(54.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(54.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(68.5, 62.5);
            drawFillCircle.radius = 5.5;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(68.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = state == UIControlStateSelected ? [UIColor colorWithRed:(204/255.0) green:(66/255.0) blue:(27/255.0) alpha:1] : [UIColor colorWithRed:(59/255.0) green:(149/255.0) blue:(73/255.0) alpha:1];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(12.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawFillCircle.center = CGPointMake(63.5, 62.5);
            drawFillCircle.radius = 2;
            drawFillCircle.fillColor = [UIColor whiteColor];
            [MWDraw drawFillCircle:drawFillCircle inContext:context];

            drawLine.startPoint = CGPointMake(12.5, 62.5);
            drawLine.endPoint = CGPointMake(8.5, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            drawLine.startPoint = CGPointMake(63.5, 62.5);
            drawLine.endPoint = CGPointMake(66, 62.5);
            drawLine.width = 4;
            drawLine.color = [UIColor whiteColor];
            [MWDraw drawLine:drawLine inContext:context];

            break;
    }
}

- (void)setTransfers:(int)t
{
    transfers = t;
    [self.layer setNeedsDisplay];
}

- (int)transfers
{
    return transfers;
}

- (void)setTripTime:(int)tt
{
    tripTime = tt;
    [self.layer setNeedsDisplay];
}

- (int)tripTime
{
    return tripTime;
}

- (void)setState:(UIControlState)is
{
    state = is;
    [self.layer setNeedsDisplay];
}

- (UIControlState)state
{
    return state;
}

@end
