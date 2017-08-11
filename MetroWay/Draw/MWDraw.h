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
#import "MWRoute.h"

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
+ (float)drawRouteList:(MWRoute *)route layer:(CALayer *)layer inContext:(CGContextRef)context;
+ (float)routeListLength:(MWRoute *)route;
+ (NSString *)cutString:(NSString *)string length:(int)length;
+ (void)createThumbnail:(MWMetroMap *)metroMap;
+ (float)fontSize:(NSString *)text maxWidth:(float)width fromSize:(float)size;
+ (UIImage *)resizeImageWithAspect:(UIImage *)image scaledToMaxWidth:(CGFloat)width height:(CGFloat)height;
+ (UIColor *)colorAtPosition:(UIImage *)image atPosition:(CGPoint)position;
+ (NSString *)hexStringFromColor:(UIColor *)color;
+ (UIColor *)colorAtPixel:(CGPoint)point inImage:(UIImage *)image;

@end
