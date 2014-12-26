//
//  MMDraw.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 15.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWMetroMap.h"
#import "MWDrawArc.h"
#import "MWDrawFillCircle.h"
#import "MWDrawLine.h"
#import "MWDrawTextLine.h"
#import "MWRouter.h"
#import "MWStorage.h"
#import "MWUpload.h"

@interface MWDraw : NSObject

+ (MWDraw *)draw;
+ (UIImage *)createMetroMapImage:(MWMetroMap *)metroMap;
+ (void)drawArc:(MWDrawArc *)arc inContext:(CGContextRef)context;
+ (void)drawFillCircle:(MWDrawFillCircle *)fillCircle inContext:(CGContextRef)context;
+ (void)drawLine:(MWDrawLine *)line inContext:(CGContextRef)context;
+ (void)drawTextLine:(MWDrawTextLine *)textLine inContext:(CGContextRef)context;
+ (UIColor *)colorByChangingAlphaTo:(CGFloat)newAlpha forColor:(UIColor *)color;
+ (UIColor *)readableForegroundColorForBackgroundColor:(UIColor *)backgroundColor;
+ (void)createBlurBackgrounds;
// Рисуем маршрут. Возвращаем область, занимаемую маршрутом (приблизительную)
+ (CGRect)drawRoute:(NSArray *)route layer:(CALayer *)layer inContext:(CGContextRef)context;
+ (void)drawRouteList:(NSArray *)route layer:(CALayer *)layer inContext:(CGContextRef)context;
+ (float)routeListLength:(NSArray *)route;
+ (NSString *)cutString:(NSString *)string length:(int)length;
+ (void)createThumbnail:(MWMetroMap *)metroMap;

@end
