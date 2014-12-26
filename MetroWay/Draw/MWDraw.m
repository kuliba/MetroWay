//
//  MMDraw.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 15.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDraw.h"
#import "MWDrawLine.h"
#import "MWDrawArc.h"
#import "MWDrawGradientRect.h"
#import "MWDrawFillCircle.h"
#import "MWDrawGradientArc.h"
#import "MWDrawTextLine.h"
#import "MWHaul.h"
#import "MWLine.h"
#import "MWEdge.h"
#import "MWSettings.h"
#import "MWDrawRoundedRect.h"
#import "MWStorage.h"

@implementation MWDraw

// Возвращаем единственный экземпляр (синглетон)
+ (MWDraw *)draw
{
    // Реализуем синглетон
    static MWDraw *draw = nil;
    if (!draw) {
        draw = [[super allocWithZone:nil] init];
    }
    return draw;
}

// Возвращаем единственный экземпляр (синглетон)
+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self draw];
}

// Берем фоновую картинку, рисуем на ней схему метро
+ (UIImage *)createMetroMapImage:(MWMetroMap *)metroMap
{
    // begin a graphics context of sufficient size
	UIGraphicsBeginImageContext(metroMap.backgroundImage.size);
    
	// draw original image into the context
	[metroMap.backgroundImage drawAtPoint:CGPointZero];
    
	// get the context for CoreGraphics
	CGContextRef context = UIGraphicsGetCurrentContext();
    
//////////////////////
    
    if (!metroMap.drawLinesOrder.count)
        [metroMap.drawLinesOrder addObjectsFromArray:metroMap.lines];
    
    MWStation *station = [[MWStation alloc] init];
    MWHaul *haul;
    NSMutableArray *primitives = [[NSMutableArray alloc] init];
    
    // Рисуем дополнительные объекты под картой
    for (NSObject *primitive in metroMap.additionalUnderMapPrimitives) {
        [self drawPrimitive:primitive inContext:context size:metroMap.backgroundImage.size];
    }
    
    // Рисуем перегоны
    for (MWLine *line in metroMap.drawLinesOrder) {
        // Рисуем все ребра
        for (MWEdge *edge in metroMap.edges) {
            if ([edge.line isEqual:line]) {
                // Рисуем все элементы
                for (NSObject *element in edge.elements) {
                    [primitives removeAllObjects];
                    if ([element isKindOfClass:[MWHaul class]]) {
                        haul = (MWHaul *)element;
                        if (haul.showOnMap) {
                            [primitives addObjectsFromArray:haul.drawPrimitives];
                        }
                    }
                    for (NSMutableArray *primitive in primitives) {
                        [self drawPrimitive:primitive inContext:context size:metroMap.backgroundImage.size];
                    }
                }
            }
        }
    }
    
    // Рисуем станции
    for (MWLine *line in metroMap.drawLinesOrder) {
        // Рисуем все ребра
        for (MWEdge *edge in metroMap.edges) {
            if ([edge.line isEqual:line]) {
                // Рисуем все элементы
                for (NSObject *element in edge.elements) {
                    [primitives removeAllObjects];
                    if ([element isKindOfClass:station.class]) {
                        station = (MWStation *)element;
                        [primitives addObjectsFromArray:station.drawPrimitives];
                    }
                    for (NSMutableArray *primitive in primitives) {
                        [self drawPrimitive:primitive inContext:context size:metroMap.backgroundImage.size];
                    }
                }
            }
        }
    }
    
    // Рисуем вершины
    for (MWVertex *vertex in metroMap.vertices)
        for (NSObject *primitive in vertex.drawPrimitives)
            [self drawPrimitive:primitive inContext:context size:metroMap.backgroundImage.size];
    
    // Рисуем названия станций на родном языке
    for (MWLine *line in metroMap.drawLinesOrder) {
        for (MWEdge *edge in metroMap.edges) {
            if ([edge.line isEqual:line]) {
                for (NSObject *element in edge.elements) {
                    if ([element isKindOfClass:station.class]) {
                        station = (MWStation *)element;
                        if (!station.showNameOnMap) {
                            continue;
                        }
                        // Рисуем название станции
                        for (NSObject *primitive in station.nameOriginalTextPrimitives) {
                            [self drawPrimitive:primitive inContext:context size:metroMap.backgroundImage.size];
                        }
                    }
                }
            }
        }
    }
    
    if ([MWSettings showEnglishTitles]) {
        metroMap.englishTextDrawn = true;
        // Рисуем названия станций на английском языке
        for(MWLine *line in metroMap.drawLinesOrder) {
            for (MWEdge *edge in metroMap.edges) {
                if ([edge.line isEqual:line]) {
                    for (NSObject *element in edge.elements) {
                        if ([element isKindOfClass:station.class]) {
                            station = (MWStation *)element;
                            if (!station.showNameOnMap) {
                                continue;
                            }
                            // Рисуем название станции
                            for (NSObject *primitive in station.nameEnglishTextPrimitives) {
                                [self drawPrimitive:primitive inContext:context size:metroMap.backgroundImage.size];
                            }
                        }
                    }
                }
            }
        }
        
        // Рисуем дополнительные надписи на английском языке
        for (NSObject *primitive in metroMap.additionalEnglishTextPrimitives) {
            [self drawPrimitive:primitive inContext:context size:metroMap.backgroundImage.size];
        }
    }
    
    // Рисуем дополнительные объекты над картой
    for (NSObject *primitive in metroMap.additionalOverMapPrimitives) {
        [self drawPrimitive:primitive inContext:context size:metroMap.backgroundImage.size];
    }

    metroMap.englishTextDrawn = [MWSettings showEnglishTitles];
/////////////////////////
    
	// make image out of bitmap context
	UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    
	// free the context
	UIGraphicsEndImageContext();
    
    // Записываем схему метро
    // [UIImagePNGRepresentation(retImage) writeToFile:path atomically:YES];
    
    return retImage;
}

// Рисуем линию
+ (void)drawLine:(MWDrawLine *)line inContext:(CGContextRef)context
{
    CGContextSetStrokeColorWithColor(context, (line.color.CGColor));
    CGContextSetLineWidth(context, line.width);
    CGContextMoveToPoint(context, line.startPoint.x, line.startPoint.y);
    CGContextAddLineToPoint(context, line.endPoint.x, line.endPoint.y);
    CGContextStrokePath(context);
}

// Рисуем дугу
+ (void)drawArc:(MWDrawArc *)arc inContext:(CGContextRef)context
{
    CGContextSetStrokeColorWithColor(context, (arc.color.CGColor));
    CGContextSetLineWidth(context, arc.width);
    CGContextAddArc(context, arc.center.x, arc.center.y, arc.radius, arc.endRadians, arc.startRadians, 1);
    CGContextStrokePath(context);
}

// Рисуем прямоугольник с градиентом
+ (void)drawGradientRect:(MWDrawGradientRect *)gradientRect inContext:(CGContextRef)context
{
    CGContextSaveGState(context);
    
    const CGFloat *sComponents = CGColorGetComponents(gradientRect.startColor.CGColor);
    CGFloat sRed = sComponents[0];
    CGFloat sGreen = sComponents[1];
    CGFloat sBlue = sComponents[2];
    CGFloat sAlpha = sComponents[3];
    
    const CGFloat *eComponents = CGColorGetComponents(gradientRect.endColor.CGColor);
    CGFloat eRed = eComponents[0];
    CGFloat eGreen = eComponents[1];
    CGFloat eBlue = eComponents[2];
    CGFloat eAlpha = eComponents[3];
    
    CGFloat colors [] = {
        sRed, sGreen, sBlue, sAlpha,
        eRed, eGreen, eBlue, eAlpha
    };
    
    CGPoint points [] = {gradientRect.point1, gradientRect.point2, gradientRect.point3, gradientRect.point4};
    
    CGContextBeginPath(context);
    CGContextAddLines(context, points, 4);
    CGContextClosePath(context);
    CGContextClip(context);
    
    CGFloat locations [] = {0, 1};
    
    CGPoint startPoint = CGPointMake(gradientRect.point1.x + (gradientRect.point2.x - gradientRect.point1.x) / 2, gradientRect.point1.y + (gradientRect.point2.y - gradientRect.point1.y) / 2);
    CGPoint endPoint = CGPointMake(gradientRect.point4.x + (gradientRect.point3.x - gradientRect.point4.x) / 2, gradientRect.point4.y + (gradientRect.point3.y - gradientRect.point4.y) / 2);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 2);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

// Рисуем залитый круг
+ (void)drawFillCircle:(MWDrawFillCircle *)fillCircle inContext:(CGContextRef)context
{
    CGContextSetFillColorWithColor(context, fillCircle.fillColor.CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(fillCircle.center.x - fillCircle.radius, fillCircle.center.y - fillCircle.radius, fillCircle.radius * 2, fillCircle.radius * 2));
}

// Рисуем дугу с градиентом
+ (void)drawGradientArc:(MWDrawGradientArc *)gradientArc inContext:(CGContextRef)context size:(CGSize)size
{
    // Create The Mask Image
    UIGraphicsBeginImageContext(size);
    CGContextRef imageCtx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(imageCtx, gradientArc.center.x, size.height - gradientArc.center.y, gradientArc.radius, - gradientArc.endRadians, - gradientArc.startRadians, 0);
    //[[UIColor redColor] set];
    
    // define the path
    CGContextSetLineWidth(imageCtx, gradientArc.width);
    CGContextDrawPath(imageCtx, kCGPathStroke);
    
    // save the context content into the image mask
    CGImageRef mask = CGBitmapContextCreateImage(UIGraphicsGetCurrentContext());
    UIGraphicsEndImageContext();
    
    // Clip Context to the mask
    CGContextSaveGState(context);
    
    CGRect bounds = CGRectMake(0, 0, size.width, size.height);
    
    CGContextClipToMask(context, bounds, mask);
    CGImageRelease(mask);
    
    // The Gradient
    const CGFloat *sComponents = CGColorGetComponents(gradientArc.startColor.CGColor);
    CGFloat sRed = sComponents[0];
    CGFloat sGreen = sComponents[1];
    CGFloat sBlue = sComponents[2];
    CGFloat sAlpha = sComponents[3];
    
    const CGFloat *eComponents = CGColorGetComponents(gradientArc.endColor.CGColor);
    CGFloat eRed = eComponents[0];
    CGFloat eGreen = eComponents[1];
    CGFloat eBlue = eComponents[2];
    CGFloat eAlpha = eComponents[3];
    
    CGFloat components[8] = {
        sRed, sGreen, sBlue, sAlpha,
        eRed, eGreen, eBlue, eAlpha
    };
    
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, components, NULL, 2);
    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
    
    // Gradient direction
    CGContextDrawLinearGradient(context, gradient, gradientArc.startGradient, gradientArc.endGradient, 0);
    
    CGGradientRelease(gradient), gradient = NULL;
    
    CGContextRestoreGState(context);
}

// Рисуем текст
+ (void)drawTextLine:(MWDrawTextLine *)textLine inContext:(CGContextRef)context
{
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, textLine.origin.x, textLine.origin.y);
    CGContextRotateCTM(context, textLine.radians);
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    UIFont *font = [UIFont fontWithName:textLine.fontName size:textLine.fontSize];
    [dictionary setValue:font forKey:NSFontAttributeName];
    [dictionary setValue:textLine.fontColor forKey:NSForegroundColorAttributeName];
    [dictionary setValue:style forKey:NSParagraphStyleAttributeName];
    if (textLine.kernSpacing)
        [dictionary setValue:@(textLine.kernSpacing) forKey:NSKernAttributeName];
        
    UIGraphicsPushContext(context);
    [textLine.text drawInRect:CGRectMake(0, 0, 1500, 1500) withAttributes:dictionary];
    UIGraphicsPopContext();
    CGContextRestoreGState(context);
}

// Рисуем прямоугольник с закругленными углами
+ (void)drawRoundedRect:(MWDrawRoundedRect *)roundedRect inContext:(CGContextRef)context
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:roundedRect.rect cornerRadius:roundedRect.cornerRadius];
    CGContextAddPath(context, path.CGPath);
    CGContextSetFillColorWithColor(context, roundedRect.color.CGColor);
    CGContextFillPath(context);
}

+ (void)drawPrimitive:(NSObject *)primitive inContext:(CGContextRef)context size:(CGSize)size
{
    static MWDrawLine *line;
    if (!line) {
        line = [[MWDrawLine alloc] init];
    }
    
    static MWDrawArc *arc;
    if (!arc) {
        arc = [[MWDrawArc alloc] init];
    }
    
    static MWDrawGradientRect *gradientRect;
    if (!gradientRect) {
        gradientRect = [[MWDrawGradientRect alloc] init];
    }
    
    static MWDrawFillCircle *fillCircle;
    if (!fillCircle) {
        fillCircle = [[MWDrawFillCircle alloc] init];
    }
    
    static MWDrawGradientArc *gradientArc;
    if (!gradientArc) {
        gradientArc = [[MWDrawGradientArc alloc] init];
    }
    
    static MWDrawTextLine *textLine;
    if (!textLine) {
        textLine = [[MWDrawTextLine alloc] init];
    }
    
    static MWDrawRoundedRect *roundedRect;
    if (!roundedRect) {
        roundedRect = [[MWDrawRoundedRect alloc] init];
    }
    
    // Рисуем линию
    if ([primitive isKindOfClass:[line class]]) {
        line = (MWDrawLine *)primitive;
        [self drawLine:line inContext:context];
        // Рисуем дугу
    } else if ([primitive isKindOfClass:[arc class]]) {
        arc = (MWDrawArc *)primitive;
        [self drawArc:arc inContext:context];
        // Рисуем прямоугольник с градиентом
    } else if ([primitive isKindOfClass:[gradientRect class]]) {
        gradientRect = (MWDrawGradientRect *)primitive;
        [self drawGradientRect:gradientRect inContext:context];
        // Рисуем залитый круг
    } else if ([primitive isKindOfClass:[fillCircle class]]) {
        fillCircle = (MWDrawFillCircle *)primitive;
        [self drawFillCircle:fillCircle inContext:context];
        // Рисуем дугу с градиентом
    } else if ([primitive isKindOfClass:[gradientArc class]]) {
        gradientArc = (MWDrawGradientArc *)primitive;
        [self drawGradientArc:gradientArc inContext:context size:size];
        // Рисуем текст
    } else if ([primitive isKindOfClass:[textLine class]]) {
        textLine = (MWDrawTextLine *)primitive;
        [self drawTextLine:textLine inContext:context];
        // Рисуем текст под углом
    } else if ([primitive isKindOfClass:[roundedRect class]]) {
        roundedRect = (MWDrawRoundedRect *)primitive;
        [self drawRoundedRect:roundedRect inContext:context];
    }
}

+ (UIColor *)colorByChangingAlphaTo:(CGFloat)newAlpha forColor:(UIColor *)color
{
	// oldComponents is the array INSIDE the original color
	// changing these changes the original, so we copy it
	CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(color.CGColor);
	int numComponents = (int)CGColorGetNumberOfComponents(color.CGColor);
	CGFloat newComponents[4];
    
	switch (numComponents)
	{
		case 2:
		{
			//grayscale
			newComponents[0] = oldComponents[0];
			newComponents[1] = oldComponents[0];
			newComponents[2] = oldComponents[0];
			newComponents[3] = newAlpha;
			break;
		}
		case 4:
		{
			//RGBA
			newComponents[0] = oldComponents[0];
			newComponents[1] = oldComponents[1];
			newComponents[2] = oldComponents[2];
			newComponents[3] = newAlpha;
			break;
		}
	}
    
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
	return retColor;
}

+ (UIColor *)readableForegroundColorForBackgroundColor:(UIColor *)backgroundColor
{
    const CGFloat *componentColors = CGColorGetComponents(backgroundColor.CGColor);
    CGFloat darknessScore = (((componentColors[0] * 255) * 299) + ((componentColors[1] * 255) * 587) + ((componentColors[2] * 255) * 114)) / 1000;
    if (darknessScore >= 125) {
        return [UIColor blackColor];
    }
    
    return [UIColor whiteColor];
}

+ (UIImage *)blur:(UIImage *)theImage
{
    // create out blurred image
    CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer: @(YES)}];
    // Строка     CIContext *context = [CIContext contextWithOptions:nil];
    // Вызывает предупреждение "BSXPCMessage received error for message: Connection interrupted"
    
    CIImage *inputImage = [CIImage imageWithCGImage:theImage.CGImage];
    
    // setting up Gaussian Blur
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:12.0f] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    // CIGaussianBlue has a tendency to shrink the image a little, this ensures it matches up exactly to the bounds of our original image
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage]; // create a UIImage for this function to "return" so that ARC can manage the memory of the blur... ARC can't manage CGImage so we need to release it before this function "returns" and ends.
    CGImageRelease(cgImage);
    
    return returnImage;
}

+ (UIImage *)cropImage:(UIImage *)image rect:(CGRect)cropRect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return img;
}

+ (void)createBlurBackgrounds
{
    // Получаем схему метро и ее изображение
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (!metroMap) return;
    UIImage *image = metroMap.image;
    UIImage *tempImage = nil;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    // Масштабируем
    if (metroMap.initialZoomScale < 1) {
        CGSize targetSize = CGSizeMake(metroMap.image.size.width * metroMap.initialZoomScale, metroMap.image.size.height * metroMap.initialZoomScale);
        UIGraphicsBeginImageContext(targetSize);
        
        CGRect thumbnailRect = CGRectMake(0, 0, 0, 0);
        thumbnailRect.origin = CGPointMake(0.0, 0.0);
        thumbnailRect.size.width = targetSize.width;
        thumbnailRect.size.height = targetSize.height - 75/2; // Проверить на картах, занимающих полный экран, например - Москва

        // Заливаем белым цветом
        MWDrawLine *drawLine = [[MWDrawLine alloc] init];
        drawLine.startPoint = CGPointMake(image.size.width / 2, 0);
        drawLine.endPoint = CGPointMake(image.size.width / 2, image.size.height);
        drawLine.width = image.size.width;
        drawLine.color = [UIColor whiteColor];

        [MWDraw drawLine:drawLine inContext:UIGraphicsGetCurrentContext()];

        [image drawInRect:thumbnailRect];
        
        tempImage = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
        image = tempImage;
        tempImage = nil;
    }

    // Вырезаем нужный кусок
    image = [self cropImage:image rect:CGRectMake(metroMap.contentOffset.x, metroMap.contentOffset.y, screenRect.size.width, screenRect.size.height)];
    
    // Блюрим
    image = [self blur:image];
    
    // Сохраняем полный скриншот
    NSString *fileName = @"bg.png";
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:path atomically:YES];
    //[MMUpload uploadFileSynchronous:fileName];
    
    // Делаем картинку для меню
    tempImage = [self cropImage:image rect:CGRectMake(0, 75, image.size.width, image.size.height - 75)];
    fileName = @"bg_menu.png";

    // Сохраняем
    path = [cachesDirectory stringByAppendingPathComponent:fileName];
    data = UIImagePNGRepresentation(tempImage);
    [data writeToFile:path atomically:YES];
    
    //[MMUpload uploadFileSynchronous:fileName];
    
    tempImage = nil;

    // Делаем картинку для фона при показе маршрута списком
    tempImage = [self cropImage:image rect:CGRectMake(0, 0, image.size.width, image.size.height)];
    fileName = @"bg_route.png";
    
    // Сохраняем
    path = [cachesDirectory stringByAppendingPathComponent:fileName];
    data = UIImagePNGRepresentation(tempImage);
    [data writeToFile:path atomically:YES];
    //[MMUpload uploadFileSynchronous:fileName];
    
    tempImage = nil;

    // Удаляем ресурсы
    image = nil;
}

// Получаем область отображения примитива
+ (CGRect)calculatePrimitiveFrame:(NSObject *)primitive
{
    CGRect result = CGRectZero;

    if ([primitive isKindOfClass:[MWDrawLine class]]) {
        result = ((MWDrawLine *)primitive).frame;
    } else if ([primitive isKindOfClass:[MWDrawArc class]]) {
        result = ((MWDrawArc *)primitive).frame;
    } else if ([primitive isKindOfClass:[MWDrawGradientRect class]]) {
        result = ((MWDrawGradientRect *)primitive).frame;
    } else if ([primitive isKindOfClass:[MWDrawFillCircle class]]) {
        result = ((MWDrawFillCircle *)primitive).frame;
    } else if ([primitive isKindOfClass:[MWDrawGradientArc class]]) {
        result = ((MWDrawGradientArc *)primitive).frame;
    } else if ([primitive isKindOfClass:[MWDrawTextLine class]]) {
        result = ((MWDrawTextLine *)primitive).frame;
    } else if ([primitive isKindOfClass:[MWDrawRoundedRect class]]) {
        result = ((MWDrawRoundedRect *)primitive).frame;
    }
    
    return result;
}

+ (CGRect)extensionFrame:(CGRect)currentFrame toRect:(CGRect)addedFrame
{
    float x1, x2, y1, y2;
    
    if ((int)currentFrame.origin.x == 0) {
        x1 = addedFrame.origin.x;
    } else {
        x1 = MIN(currentFrame.origin.x, addedFrame.origin.x);
    }
    
    x2 = MAX(currentFrame.origin.x + currentFrame.size.width, addedFrame.origin.x + addedFrame.size.width);

    if ((int)currentFrame.origin.y == 0) {
        y1 = addedFrame.origin.y;
    } else {
        y1 = MIN(currentFrame.origin.y, addedFrame.origin.y);
    }

   y2 = MAX(currentFrame.origin.y + currentFrame.size.height, addedFrame.origin.y + addedFrame.size.height);

    return CGRectMake(x1, y1, x2 - x1, y2 - y1);
}

+ (CGRect)drawRoute:(NSArray *)route layer:(CALayer *)layer inContext:(CGContextRef)context
{
    NSMutableArray *primitives = [[NSMutableArray alloc] init];
    
    MWHaul *haul;
    MWEdge *edge;
    MWStation *station1, *station2;
    MWVertex *vertex;

    // Инициализируем маршрут и переходы (прописываем маршруты в вершинах)
    //[[MMRouter router] routeTransfers:(NSMutableArray *)route];
    
    CGRect primitiveFrame = CGRectZero;
    CGRect routeFrame = CGRectZero;
    
    // Рисуем перегоны
    for (NSObject *object in route) {
        if ([object isKindOfClass:[MWEdge class]]) {
            edge = (MWEdge *)object;
            for (NSObject *element in edge.elements) {
                if ([element isKindOfClass:[MWHaul class]]) {
                    haul = (MWHaul *)element;
                    [primitives removeAllObjects];
                    [primitives addObjectsFromArray:haul.drawPrimitives];
                    for (NSMutableArray *primitive in primitives) {
                        [self drawPrimitive:primitive inContext:context size:layer.bounds.size];
                        if ([primitive isKindOfClass:[MWDrawLine class]] ||
                            [primitive isKindOfClass:[MWDrawTextLine class]]) {
                            primitiveFrame = [self calculatePrimitiveFrame:primitive];
                            routeFrame = [self extensionFrame:routeFrame toRect:primitiveFrame];
                        }
                    }
                }
            }
        }
    }

    // Рисуем станции
    for (NSObject *object in route) {
        if ([object isKindOfClass:[MWEdge class]]) {
            edge = (MWEdge *)object;
            for (NSObject *element in edge.elements) {
                if ([element isKindOfClass:[MWStation class]]) {
                    station1 = (MWStation *)element;
                    [primitives removeAllObjects];
                    [primitives addObjectsFromArray:station1.drawPrimitives];
                    [primitives addObjectsFromArray:station1.nameOriginalTextPrimitives];
                    if ([MWSettings showEnglishTitles]) {
                        [primitives addObjectsFromArray:station1.nameEnglishTextPrimitives];
                    }
                    for (NSMutableArray *primitive in primitives) {
                        [self drawPrimitive:primitive inContext:context size:layer.bounds.size];
                        if ([primitive isKindOfClass:[MWDrawLine class]] ||
                            [primitive isKindOfClass:[MWDrawTextLine class]]) {
                            primitiveFrame = [self calculatePrimitiveFrame:primitive];
                            routeFrame = [self extensionFrame:routeFrame toRect:primitiveFrame];
                        }
                    }
                }
            }
        }
    }

    // Рисуем вершины
    for (NSObject *object in route) {
        if ([object isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)object;
            if (vertex.transfers.count > 1) { // Есть переходы, надо рисовать
                for (int i = 0; i < vertex.transfers.count; i = i + 2) {
                    station1 = [vertex.transfers objectAtIndex:i];
                    station2 = [vertex.transfers objectAtIndex:i + 1];
                    
                    MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];

                    fillCircle.center = station1.mapLocation;
                    fillCircle.radius = 15.5;
                    fillCircle.fillColor = [UIColor colorWithRed:255/255.0 green:83/255.0 blue:34/255.0 alpha:1];
                    [self drawFillCircle:fillCircle inContext:context];
                    
                    fillCircle.center = station2.mapLocation;
                    fillCircle.radius = 15.5;
                    fillCircle.fillColor = [UIColor colorWithRed:255/255.0 green:83/255.0 blue:34/255.0 alpha:1];
                    [self drawFillCircle:fillCircle inContext:context];
                    
                    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
                    
                    drawLine.startPoint = station1.mapLocation;
                    drawLine.endPoint = station2.mapLocation;
                    drawLine.width = 16;
                    drawLine.color = [UIColor colorWithRed:255/255.0 green:83/255.0 blue:34/255.0 alpha:1];
                    [self drawLine:drawLine inContext:context];

                    fillCircle.center = station1.mapLocation;
                    fillCircle.radius = 10.5;
                    fillCircle.fillColor = [UIColor whiteColor];
                    [self drawFillCircle:fillCircle inContext:context];

                    fillCircle.center = station2.mapLocation;
                    fillCircle.radius = 10.5;
                    fillCircle.fillColor = [UIColor whiteColor];
                    [self drawFillCircle:fillCircle inContext:context];

                    drawLine.startPoint = station1.mapLocation;
                    drawLine.endPoint = station2.mapLocation;
                    drawLine.width = 5.5;
                    drawLine.color = [UIColor whiteColor];
                    [self drawLine:drawLine inContext:context];

                    MWLine *line;
                    
                    line = [MWRouter lineByStation:station1];
                    fillCircle.center = station1.mapLocation;
                    fillCircle.radius = 6.5;
                    fillCircle.fillColor = line.color;
                    [self drawFillCircle:fillCircle inContext:context];

                    line = [MWRouter lineByStation:station2];
                    fillCircle.center = station2.mapLocation;
                    fillCircle.radius = 6.5;
                    fillCircle.fillColor = line.color;
                    [self drawFillCircle:fillCircle inContext:context];

                    fillCircle = nil;
                    drawLine = nil;
                    line = nil;
                }
            }
        }
    }
    
    return routeFrame;
}

// Расстояние от верхнего края до центра начала списка
float topOffset = 63;
// Расстояние от конца списка до нижнего края
float bottomOffset = 140;
// Расстояние между станциями
float haulLength = 35.5;
// Высота от узла до первой станции
float firstStationOffset = 83.5;
// Высота от последней станции до узла
float lastStationOffset = 56.5;
// Расстояние между узлами пересадок без английских надписей
float transferLength_original = 19;
// Расстояние между узлами пересадок с английскими надписями
float transferLength_withEnglish = 36;

// Вычисляем длину участка
+ (float)edgeLength:(MWEdge *)edge
{
    float result = 0;
    int stationCount = edge.stationsCount;
    
    if (!edge) {
        return result;
    }

    result += firstStationOffset;

    if (stationCount > 2) {
        result += (stationCount - 3) * haulLength;
        result += lastStationOffset;
    }
    
    return result;
}

// Вычисляем длину пересадки
+ (float)vertexLength:(MWVertex *)vertex
{
    float result;
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    if (metroMap.englishTextExists && [MWSettings showEnglishTitles]) {
        result = vertex.transfers.count / 2 * transferLength_withEnglish;
    } else {
        result = vertex.transfers.count / 2 * transferLength_original;
    }
 
    if ([vertex.transfers containsObject:metroMap.startStation]) {
        if (metroMap.englishTextExists && [MWSettings showEnglishTitles]) {
            result -= 3;
        } else {
            result += 12;
        }
    }
    
    if ([vertex.transfers containsObject:metroMap.finishStation]) {
        result += 14;
    }

    return result;
}

// Вычисляем длину всего списка
+ (float)routeListLength:(NSArray *)route
{
    float result = 0;
        
    result += topOffset;

    for (NSObject *element in route) {
        if ([element isKindOfClass:[MWVertex class]]) {
            result += [MWDraw vertexLength:(MWVertex *)element];
        } else if ([element isKindOfClass:[MWEdge class]]) {
            result += [MWDraw edgeLength:(MWEdge *)element];
        }
    }
    
    result += bottomOffset;
    
    return result;
}

static NSDate *arrivalTime;

+ (float)drawRouteListVertex:(MWVertex *)vertex route:(NSArray *)route layer:(CALayer *)layer inContext:(CGContextRef)context fromTop:(float)currentPosition
{
    float endPosition = currentPosition;
    UIColor *fontColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];

    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWStation *station;
    MWLine *line;
    MWDrawArc *drawArc;
    float vCenter;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];

    // Если узлы конечные, то просто возвращаем текущую позицию, т.к. мы ничего не рисуем
    if (vertex.transfers.count == 0) {
        return currentPosition;
    }

    // Определяем конечную точку
    endPosition += [MWDraw vertexLength:vertex];

    MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
    MWDrawTextLine *drawTextLine = [[MWDrawTextLine alloc] init];

    if ([vertex.transfers containsObject:metroMap.startStation]) {
        fillCircle.center = CGPointMake(46.5, currentPosition);
        fillCircle.radius = 65.5 / 2;
        fillCircle.fillColor = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:0.3];
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
        drawArc.startRadians = 0;
        drawArc.endRadians = 2 * M_PI;
        drawArc.radius = 33.5;
        drawArc.width = 1.5;
        drawArc.center = CGPointMake(46.5, currentPosition);
        drawArc.color = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:1];
        [MWDraw drawArc:drawArc inContext:context];
        
        // Рисуем время - начало поездки
        drawTextLine.text = [dateFormatter stringFromDate:arrivalTime];
        drawTextLine.fontName = @"HelveticaNeue-Light";
        drawTextLine.fontColor = fontColor;
        drawTextLine.fontSize = 15;
        drawTextLine.origin = CGPointMake(269.5, currentPosition - 10);
        [MWDraw drawTextLine:drawTextLine inContext:context];
    } else if ([vertex.transfers containsObject:metroMap.finishStation]) {
        fillCircle.center = CGPointMake(46.5, endPosition);
        fillCircle.radius = 65.5 / 3;
        fillCircle.fillColor = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:0.3];
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
        drawArc.startRadians = 0;
        drawArc.endRadians = 2 * M_PI;
        drawArc.radius = 33.5;
        drawArc.width = 1.5;
        drawArc.center = CGPointMake(46.5, endPosition);
        drawArc.color = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:1];
        [MWDraw drawArc:drawArc inContext:context];
        
        // Рисуем время - окончание поездки
        NSTimeInterval vertexTrip;
        vertexTrip = [[MWRouter router] routeTripTime:route] * 60;
        NSDate *endTripTime = [[NSDate date] dateByAddingTimeInterval:vertexTrip];
        
        drawTextLine.text = [dateFormatter stringFromDate:endTripTime];
        drawTextLine.fontName = @"HelveticaNeue-Light";
        drawTextLine.fontColor = fontColor;
        drawTextLine.fontSize = 15;
        drawTextLine.origin = CGPointMake(269.5, endPosition - 10);
        [MWDraw drawTextLine:drawTextLine inContext:context];
    }

    
    // Нарисуем два красных кружка и соединяюющую их линию

    fillCircle.center = CGPointMake(46.5, currentPosition);
    fillCircle.radius = 15.5;
    fillCircle.fillColor = [UIColor colorWithRed:(255/255.0) green:(83/255.0) blue:(34/255.0) alpha:1];
    [MWDraw drawFillCircle:fillCircle inContext:context];

    fillCircle.center = CGPointMake(46.5, endPosition);
    fillCircle.radius = 15.5;
    fillCircle.fillColor = [UIColor colorWithRed:(255/255.0) green:(83/255.0) blue:(34/255.0) alpha:1];
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    drawLine.startPoint = CGPointMake(46.5, currentPosition);
    drawLine.endPoint = CGPointMake(46.5, endPosition);
    drawLine.width = 31;
    drawLine.color = [UIColor colorWithRed:(255/255.0) green:(83/255.0) blue:(34/255.0) alpha:1];
    [MWDraw drawLine:drawLine inContext:context];

    // Определяем количество дополнительных переходов в узле
    int inTransfersCount = (int)(vertex.transfers.count / 2) - 1;
    
    // Рисуем дополнительные переходы
    float inTransfersLength;
    
    inTransfersLength = [MWSettings showEnglishTitles] && metroMap.englishTextExists ? transferLength_withEnglish : transferLength_original;
    
    vCenter = currentPosition;
    
    for (int i = 0; i < inTransfersCount; i++) {
        vCenter += (i + 1) * inTransfersLength;
        
        fillCircle.center = CGPointMake(46.5, vCenter);
        fillCircle.radius = 10.5;
        fillCircle.fillColor = [UIColor whiteColor];
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
        station = [vertex.transfers objectAtIndex:(i + 1) * 2];
        
        line = [MWRouter lineByStation:station];

        fillCircle.center = CGPointMake(46.5, vCenter);
        fillCircle.radius = 6.5;
        fillCircle.fillColor = line.color;
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
        drawTextLine.text = [self cutString:station.nameOriginal length:19];
        drawTextLine.fontName = @"HelveticaNeue-Light";
        drawTextLine.fontColor = fontColor;
        drawTextLine.fontSize = 17;
        drawTextLine.origin = CGPointMake(79, vCenter - 10);
        [MWDraw drawTextLine:drawTextLine inContext:context];
        
        if (metroMap.englishTextExists && [MWSettings showEnglishTitles]) {
            drawTextLine.text = station.nameEnglish;
            drawTextLine.fontName = @"HelveticaNeue-Light";
            drawTextLine.fontColor = fontColor;
            drawTextLine.fontSize = 14;
            drawTextLine.origin = CGPointMake(79, vCenter + 6);
            [MWDraw drawTextLine:drawTextLine inContext:context];
        }
    }
    
    station = nil;
    
    if (vertex.transfers.count == 2 && [vertex.transfers containsObject:metroMap.startStation]) {
        station = metroMap.startStation;
    } else if (vertex.transfers.count == 2 && [vertex.transfers containsObject:metroMap.finishStation]) {
        station = metroMap.finishStation;
        currentPosition = endPosition;
    }
    
    if (station) {
        [self drawOutermostStation:station layer:layer inContext:context atPosition:currentPosition];

        fillCircle.center = CGPointMake(46.5, currentPosition);
        fillCircle.radius = 10.5;
        fillCircle.fillColor = [UIColor whiteColor];
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
        line = [MWRouter lineByStation:station];
        
        fillCircle.center = CGPointMake(46.5, currentPosition);
        fillCircle.radius = 6.5;
        fillCircle.fillColor = line.color;
        [MWDraw drawFillCircle:fillCircle inContext:context];
        
    }

    return endPosition;
}

+ (NSString *)cutString:(NSString *)string length:(int)length
{
    NSString *result;
    
    if (string.length > length + 1) {
        result = [[string substringToIndex:length] stringByAppendingString:@"..."];
    } else {
        result = string;
    }
    
    return result;
}

+ (void)drawOutermostStation:(MWStation *)station layer:(CALayer *)layer inContext:(CGContextRef)context atPosition:(float)position
{
    MWLine *line = [MWRouter lineByStation:station];
    MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
    MWDrawTextLine *drawTextLine = [[MWDrawTextLine alloc] init];
    
    CGPoint point1 = CGPointMake(98, position);
    CGPoint point2 = CGPointMake(106.5, position - 13.5);
    CGPoint point3 = CGPointMake(106.5, position + 13.5);
    CGPoint point4 = CGPointMake(layer.bounds.size.width - 85, position - 13.5);
    CGPoint point5 = CGPointMake(layer.bounds.size.width - 85, position + 13.5);
    
    fillCircle.center = point1;
    fillCircle.radius = 3;
    fillCircle.fillColor = line.color;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    fillCircle.center = point2;
    fillCircle.radius = 3;
    fillCircle.fillColor = line.color;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    fillCircle.center = point3;
    fillCircle.radius = 3;
    fillCircle.fillColor = line.color;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    fillCircle.center = point4;
    fillCircle.radius = 3;
    fillCircle.fillColor = line.color;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    fillCircle.center = point5;
    fillCircle.radius = 3;
    fillCircle.fillColor = line.color;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    drawLine.startPoint = point1;
    drawLine.endPoint = point2;
    drawLine.width = 6;
    drawLine.color = line.color;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = point2;
    drawLine.endPoint = point4;
    drawLine.width = 6;
    drawLine.color = line.color;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = point4;
    drawLine.endPoint = point5;
    drawLine.width = 6;
    drawLine.color = line.color;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = point5;
    drawLine.endPoint = point3;
    drawLine.width = 6;
    drawLine.color = line.color;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = point3;
    drawLine.endPoint = point1;
    drawLine.width = 6;
    drawLine.color = line.color;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(106.5, position);
    drawLine.endPoint = CGPointMake(layer.bounds.size.width - 85, position);
    drawLine.width = 30;
    drawLine.color = line.color;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(105, position - 10);
    drawLine.endPoint = CGPointMake(105, position + 10);
    drawLine.width = 6;
    drawLine.color = line.color;
    [MWDraw drawLine:drawLine inContext:context];

    NSString *stationName = [self cutString:station.nameOriginal length:12];
    
    drawTextLine.text = stationName;
    drawTextLine.fontName = @"HelveticaNeue-Light";
    drawTextLine.fontColor = [MWDraw readableForegroundColorForBackgroundColor:line.color];
    drawTextLine.fontSize = 17;
    drawTextLine.origin = CGPointMake(111, position - 11);
    [MWDraw drawTextLine:drawTextLine inContext:context];
}

+ (float)drawRouteListEdge:(MWEdge *)edge onRoute:(NSArray *)route layer:(CALayer *)layer inContext:(CGContextRef)context fromTop:(float)currentPosition previouslyVertex:(MWVertex *)vertex
{
    float endPosition = currentPosition + [MWDraw edgeLength:edge];
    float cp = currentPosition; // Текущая позиция
    float cpTemp;
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
    MWDrawArc *drawArc = [[MWDrawArc alloc] init];
    MWDrawTextLine *drawTextLine = [[MWDrawTextLine alloc] init];
    MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];
    MWStation *station;
    MWVertex *nextVertex;
    MWHaul *haul;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWLine *line;
    UIColor *fontColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    // Добавляем время, затрачиваемое на пересадки
    //    tripTime += metroMap.switchTime * [self routeTransfers:path];
    
    // Добавляем время самой поездки
    //    tripTime += [self routeLength:path]/(metroMap.middleSpeed*1000/60);

    
    // Проходим циклом по всем станциям
    // Если станция = первой станции маршрута, рисуем начало маршрута
    // Если станция = последней станции маршрута, рисуем завершение маршрута
    // Если станция = первой станцией участка, рисуем начало участка
    // Если станция = последней станцией участка, рисуем окончание участка
    //for (int i = 0; i < edgeStations.count; i++) {
    for (NSObject *object in edge.elements) {
        if ([object isKindOfClass:[MWHaul class]]) {
            haul = (MWHaul *)object;
        } else {
            station = (MWStation *)object;
            line = [MWRouter lineByStation:station];
            if ([station isEqual:metroMap.startStation]) {
                [self drawOutermostStation:station layer:layer inContext:context atPosition:currentPosition];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 65.5 / 2;
                fillCircle.fillColor = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:0.3];
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                drawArc.startRadians = 0;
                drawArc.endRadians = 2 * M_PI;
                drawArc.radius = 33.5;
                drawArc.width = 1.5;
                drawArc.center = CGPointMake(46.5, cp);
                drawArc.color = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:1];
                [MWDraw drawArc:drawArc inContext:context];
                
                drawLine.startPoint = CGPointMake(46.5, cp);
                drawLine.endPoint = CGPointMake(46.5, cp + firstStationOffset);
                drawLine.width = 9;
                drawLine.color = edge.line.color;
                [MWDraw drawLine:drawLine inContext:context];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 10.5;
                fillCircle.fillColor = [UIColor whiteColor];
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 6.5;
                fillCircle.fillColor = line.color;
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                [self drawRouteListTrain:0 position:cp + 20 inContext:context];
                
                // Рисуем время - начало поездки
                drawTextLine.text = [dateFormatter stringFromDate:arrivalTime];
                drawTextLine.fontName = @"HelveticaNeue-Light";
                drawTextLine.fontColor = fontColor;
                drawTextLine.fontSize = 15;
                drawTextLine.origin = CGPointMake(269.5, cp - 10);
                [MWDraw drawTextLine:drawTextLine inContext:context];
                
                cp += firstStationOffset;
            } else if ([station isEqual:metroMap.finishStation]) {
                [self drawOutermostStation:station layer:layer inContext:context atPosition:endPosition];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 65.5 / 2;
                fillCircle.fillColor = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:0.3];
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                drawArc.startRadians = 0;
                drawArc.endRadians = 2 * M_PI;
                drawArc.radius = 33.5;
                drawArc.width = 1.5;
                drawArc.center = CGPointMake(46.5, cp);
                drawArc.color = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:1];
                [MWDraw drawArc:drawArc inContext:context];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 10.5;
                fillCircle.fillColor = [UIColor whiteColor];
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 6.5;
                fillCircle.fillColor = line.color;
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                // Рисуем время - окончание поездки
                NSTimeInterval haulTrip = haul.length * 60 * 60 / (metroMap.middleSpeed * 1000);
                arrivalTime = [arrivalTime dateByAddingTimeInterval:haulTrip];

                drawTextLine.text = [dateFormatter stringFromDate:arrivalTime];
                drawTextLine.fontName = @"HelveticaNeue-Light";
                drawTextLine.fontColor = fontColor;
                drawTextLine.fontSize = 15;
                drawTextLine.origin = CGPointMake(269.5, cp - 10);
                [MWDraw drawTextLine:drawTextLine inContext:context];

            } else if ([station isEqual:[edge.elements firstObject]]) {
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 10.5;
                fillCircle.fillColor = [UIColor whiteColor];
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 6.5;
                fillCircle.fillColor = line.color;
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                drawLine.startPoint = CGPointMake(46.5, cp);
                drawLine.endPoint = CGPointMake(46.5, cp + firstStationOffset);
                drawLine.width = 9;
                drawLine.color = edge.line.color;
                [MWDraw drawLine:drawLine inContext:context];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 10.5;
                fillCircle.fillColor = [UIColor whiteColor];
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 6.5;
                fillCircle.fillColor = line.color;
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                if (metroMap.englishTextExists && [MWSettings showEnglishTitles]) {
                    [self drawRouteListTrain:0 position:cp + 26 inContext:context];
                } else {
                    [self drawRouteListTrain:0 position:cp + 20 inContext:context];
                }
                
                drawTextLine.text = [self cutString:station.nameOriginal length:19];
                drawTextLine.fontName = @"HelveticaNeue-Light";
                drawTextLine.fontColor = fontColor;
                drawTextLine.fontSize = 17;
                drawTextLine.origin = CGPointMake(78, cp - 9);
                [MWDraw drawTextLine:drawTextLine inContext:context];
                
                if (metroMap.englishTextExists && [MWSettings showEnglishTitles]) {
                    drawTextLine.text = station.nameEnglish;
                    drawTextLine.fontName = @"HelveticaNeue-Light";
                    drawTextLine.fontColor = fontColor;
                    drawTextLine.fontSize = 12;
                    drawTextLine.origin = CGPointMake(79, cp + 7);
                    [MWDraw drawTextLine:drawTextLine inContext:context];
                }
                
                // Рисуем время
                NSTimeInterval vertexTrip;
//                vertexTrip = (vertex.transfers.count / 2) * metroMap.switchTime * 60;
                vertexTrip = metroMap.switchTime * 60;
                arrivalTime = [arrivalTime dateByAddingTimeInterval:vertexTrip];
                
                drawTextLine.text = [dateFormatter stringFromDate:arrivalTime];
                drawTextLine.fontName = @"HelveticaNeue-Light";
                drawTextLine.fontColor = fontColor;
                drawTextLine.fontSize = 15;
                drawTextLine.origin = CGPointMake(269.5, cp - 7);
                [MWDraw drawTextLine:drawTextLine inContext:context];
                
                cp += firstStationOffset;
            } else if ([station isEqual:[edge.elements lastObject]]) { // Последняя станция участка
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 10.5;
                fillCircle.fillColor = [UIColor whiteColor];
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 6.5;
                fillCircle.fillColor = line.color;
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                drawTextLine.text = [self cutString:station.nameOriginal length:19];
                drawTextLine.fontName = @"HelveticaNeue-Light";
                drawTextLine.fontColor = fontColor;
                drawTextLine.fontSize = 17;
                drawTextLine.origin = CGPointMake(78, cp - 10);
                [MWDraw drawTextLine:drawTextLine inContext:context];
                
                if (metroMap.englishTextExists && [MWSettings showEnglishTitles]) {
                    drawTextLine.text = station.nameEnglish;
                    drawTextLine.fontName = @"HelveticaNeue-Light";
                    drawTextLine.fontColor = fontColor;
                    drawTextLine.fontSize = 12;
                    drawTextLine.origin = CGPointMake(79, cp + 6);
                    [MWDraw drawTextLine:drawTextLine inContext:context];
                }
                
                // Рисуем время
                NSTimeInterval haulTrip = haul.length * 60 * 60 / (metroMap.middleSpeed * 1000);
                arrivalTime = [arrivalTime dateByAddingTimeInterval:haulTrip];
                
                drawTextLine.text = [dateFormatter stringFromDate:arrivalTime];
                drawTextLine.fontName = @"HelveticaNeue-Light";
                drawTextLine.fontColor = fontColor;
                drawTextLine.fontSize = 15;
                drawTextLine.origin = CGPointMake(269.5, cp - 8.5);
                [MWDraw drawTextLine:drawTextLine inContext:context];
                
                // Получаем следующий узел для отрисовки времени
                nextVertex = nil;
                int k = (int)[route indexOfObject:edge] + 1;
                if (k < route.count) {
                    nextVertex = [route objectAtIndex:k];
                }
                
                if (nextVertex.transfers.count > 2) {
                    // Определяем количество дополнительных переходов в узле
                    int inTransfersCount = (int)nextVertex.transfers.count / 2 - 1;
                    
                    MWMetroMap *metroMap = [MWStorage currentMetroMap];
                    float vCenter;
                    
                    float inTransfersLength = [MWSettings showEnglishTitles] ? transferLength_withEnglish : transferLength_original;
                    
                    for (int i = 0; i < inTransfersCount; i++) {
                        vCenter = cp + (i + 1) * inTransfersLength;
                        // Рисуем время
                        NSTimeInterval vertexTrip;
                        vertexTrip = metroMap.switchTime * 60;
                        arrivalTime = [arrivalTime dateByAddingTimeInterval:vertexTrip];
                        
                        drawTextLine.text = [dateFormatter stringFromDate:arrivalTime];
                        drawTextLine.fontName = @"HelveticaNeue-Light";
                        drawTextLine.fontColor = fontColor;
                        drawTextLine.fontSize = 15;
                        drawTextLine.origin = CGPointMake(269.5, vCenter - 8.5);
                        [MWDraw drawTextLine:drawTextLine inContext:context];
                    }
                }

                
            } else {
                fillCircle.center = CGPointMake(46.5, cp);
                fillCircle.radius = 6.5;
                fillCircle.fillColor = line.color;
                [MWDraw drawFillCircle:fillCircle inContext:context];
                
                if ([edge.elements indexOfObject:station] == edge.elements.count - 3) {
                    cpTemp = lastStationOffset;
                } else {
                    cpTemp = haulLength;
                }
                
                drawLine.startPoint = CGPointMake(46.5, cp);
                drawLine.endPoint = CGPointMake(46.5, cp + cpTemp);
                drawLine.width = 9;
                drawLine.color = edge.line.color;
                [MWDraw drawLine:drawLine inContext:context];
                
                drawTextLine.text = [self cutString:station.nameOriginal length:19];
                drawTextLine.fontName = @"HelveticaNeue-Light";
                drawTextLine.fontColor = fontColor;
                drawTextLine.fontSize = 17;
                drawTextLine.origin = CGPointMake(78, cp - 12);
                [MWDraw drawTextLine:drawTextLine inContext:context];
                
                if (metroMap.englishTextExists && [MWSettings showEnglishTitles]) {
                    drawTextLine.text = station.nameEnglish;;
                    drawTextLine.fontName = @"HelveticaNeue-Light";
                    drawTextLine.fontColor = fontColor;
                    drawTextLine.fontSize = 12;
                    drawTextLine.origin = CGPointMake(79, cp + 4);
                    [MWDraw drawTextLine:drawTextLine inContext:context];
                }
                
                // Рисуем время
                NSTimeInterval haulTrip = haul.length * 60 * 60 / (metroMap.middleSpeed * 1000);
                arrivalTime = [arrivalTime dateByAddingTimeInterval:haulTrip];
                
                drawTextLine.text = [dateFormatter stringFromDate:arrivalTime];
                drawTextLine.fontName = @"HelveticaNeue-Light";
                drawTextLine.fontColor = fontColor;
                drawTextLine.fontSize = 15;
                drawTextLine.origin = CGPointMake(269.5, cp - 10);
                [MWDraw drawTextLine:drawTextLine inContext:context];

                if ([edge.elements indexOfObject:station] == edge.elements.count - 3) {
                    cp += lastStationOffset;
                } else {
                    cp += haulLength;
                }
            }
        }
    }
    
    return endPosition;
}

+ (void)drawRouteList:(NSArray *)route layer:(CALayer *)layer inContext:(CGContextRef)context
{
    // Очищаем
    CGContextClearRect(context, layer.bounds);
    
    MWEdge *edge = nil;
    MWVertex *vertex;
    
    arrivalTime = [NSDate date];
    
    // Рисуем узлы пересадок
    float currentPosition = topOffset;

    for (NSObject *object in route) {
        if ([object isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)object;
            currentPosition = [MWDraw drawRouteListVertex:vertex route:route layer:layer inContext:context fromTop:currentPosition];
        } else if ([object isKindOfClass:[MWEdge class]]) {
            edge = (MWEdge *)object;
            currentPosition += [MWDraw edgeLength:edge];
        }
    }

    // Рисуем участки
    currentPosition = topOffset;
    NSObject *object;
    
    for (int i = 0; i < route.count; i++) {
        object = [route objectAtIndex:i];
        if ([object isKindOfClass:[MWEdge class]]) {
            edge = (MWEdge *)object;
            currentPosition = [MWDraw drawRouteListEdge:edge onRoute:route layer:layer inContext:context fromTop:currentPosition previouslyVertex:vertex];
        } else if ([object isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)object;
            currentPosition += [MWDraw vertexLength:vertex];
        }
    }
}

// Рисуем вагон для поезда, отображаемого в списке маршрута
+ (void)drawRouteListWagon:(BOOL)selected number:(int)number position:(float)position inContext:(CGContextRef)context
{
    MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
    
    UIColor *wagonColor = selected ? [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1] : [UIColor colorWithRed:(182/255.0) green:(195/255.0) blue:(196/255.0) alpha:1];
    
    float left = 136 + (number - 2) * 35.5		;
    
    CGPoint point1 = CGPointMake(left + 2, position + 17);
    CGPoint point2 = CGPointMake(left + 2, position + 4.5);
    CGPoint point3 = CGPointMake(left + 33, position + 4.5);
    CGPoint point4 = CGPointMake(left + 33, position + 17);
    
    fillCircle.center = point1;
    fillCircle.radius = 2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    fillCircle.center = point2;
    fillCircle.radius = 2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    fillCircle.center = point3;
    fillCircle.radius = 2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    fillCircle.center = point4;
    fillCircle.radius = 2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    drawLine.startPoint = point1;
    drawLine.endPoint = point2;
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = point2;
    drawLine.endPoint = point3;
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = point3;
    drawLine.endPoint = point4;
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = point4;
    drawLine.endPoint = point1;
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 4, position + 21.5 / 2);
    drawLine.endPoint = CGPointMake(left + 33, position + 21.5 / 2);
    drawLine.width = 12;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    fillCircle = nil;
    drawLine = nil;
    wagonColor = nil;
}

+ (void)drawRouteListFirstWagon:(BOOL)selected position:(float)position inContext:(CGContextRef)context
{
    UIColor *windowColor, *wagonColor;
    MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];

    selected = false;
    
    if (selected) {
        wagonColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
        windowColor = [UIColor colorWithRed:(161/255.0) green:(173/255.0) blue:(191/255.0) alpha:1];
    } else {
        wagonColor = [UIColor colorWithRed:(182/255.0) green:(195/255.0) blue:(196/255.0) alpha:1];
        windowColor = [UIColor colorWithRed:(207/255.0) green:(211/255.0) blue:(216/255.0) alpha:1];
    }
    
    CGPoint point1 = CGPointMake(99.75, position + 14.75);
    CGPoint point2 = CGPointMake(110, position + 10.5);
    CGPoint point3 = CGPointMake(133.5, position + 4.5);
    CGPoint point4 = CGPointMake(133.5, position + 17);
    
    fillCircle.center = point1;
    fillCircle.radius = 4.2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    fillCircle.center = point2;
    fillCircle.radius = 8;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    fillCircle.center = point3;
    fillCircle.radius = 2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    fillCircle.center = point4;
    fillCircle.radius = 2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    drawLine.startPoint = point3;
    drawLine.endPoint = point4;
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = point3;
    drawLine.endPoint = CGPointMake(110, position + 4.5);
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = point4;
    drawLine.endPoint = CGPointMake(99.75, position + 17);
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(133.5, position + (4.5 + 17) / 2);
    drawLine.endPoint = CGPointMake(110, position + (4.5 + 17) / 2);
    drawLine.width = 12;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(98.5, position + 13);
    drawLine.endPoint = CGPointMake(106.75, position + 6);
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];

    fillCircle.center = CGPointMake(106, position + 9);
    fillCircle.radius = 4;
    fillCircle.fillColor = windowColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    drawLine.startPoint = CGPointMake(106, position + 9);
    drawLine.endPoint = CGPointMake(104, position + 9);
    drawLine.width = 8;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(96.25, position + 13);
    drawLine.endPoint = CGPointMake(104.5, position + 5);
    drawLine.width = 1;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(96.25, position + 12.25);
    drawLine.endPoint = CGPointMake(105.25, position + 4.5);
    drawLine.width = 2;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(98.25, position + 12.5);
    drawLine.endPoint = CGPointMake(106.25, position + 5);
    drawLine.width = 2;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(100.25, position + 12.5);
    drawLine.endPoint = CGPointMake(107.25, position + 5.5);
    drawLine.width = 1;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(100.25, position + 12.5);
    drawLine.endPoint = CGPointMake(108.25, position + 5.5);
    drawLine.width = 1;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(100, position + 12);
    drawLine.endPoint = CGPointMake(106, position + 12);
    drawLine.width = 2;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(96.5, position + 12.5);
    drawLine.endPoint = CGPointMake(106, position + 12.5);
    drawLine.width = 1;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(113, position + 4.5);
    drawLine.endPoint = CGPointMake(104.5, position + 4.5);
    drawLine.width = 1;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(113, position + 5);
    drawLine.endPoint = CGPointMake(103.5, position + 5);
    drawLine.width = 1;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
}

// Рисуем последний вагон поезда
+ (void)drawRouteListLastWagon:(BOOL)selected position:(float)position inContext:(CGContextRef)context
{
    float left = 244.5;
    
    UIColor *windowColor, *wagonColor;
    MWDrawFillCircle *fillCircle = [[MWDrawFillCircle alloc] init];
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
    
    selected = false;
    
    if (selected) {
        wagonColor = [UIColor colorWithRed:(91/255.0) green:(108/255.0) blue:(133/255.0) alpha:1];
        windowColor = [UIColor colorWithRed:(161/255.0) green:(173/255.0) blue:(191/255.0) alpha:1];
    } else {
        wagonColor = [UIColor colorWithRed:(182/255.0) green:(195/255.0) blue:(196/255.0) alpha:1];
        windowColor = [UIColor colorWithRed:(207/255.0) green:(211/255.0) blue:(216/255.0) alpha:1];
    }
    
    CGPoint point1 = CGPointMake(left + 33.75, position + 14.75);
    CGPoint point2 = CGPointMake(left + 23.5, position + 10.5);
    CGPoint point3 = CGPointMake(left, position + 4.5);
    CGPoint point4 = CGPointMake(left, position + 17);

    fillCircle.center = point1;
    fillCircle.radius = 4.2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    fillCircle.center = point2;
    fillCircle.radius = 8;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    fillCircle.center = point3;
    fillCircle.radius = 2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];
    
    fillCircle.center = point4;
    fillCircle.radius = 2;
    fillCircle.fillColor = wagonColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    drawLine.startPoint = point3;
    drawLine.endPoint = point4;
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = point3;
    drawLine.endPoint = CGPointMake(left + 23.5, position + 4.5);
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = point4;
    drawLine.endPoint = CGPointMake(left + 33.75, position + 17);
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = CGPointMake(left, position + (4.5 + 17) / 2);
    drawLine.endPoint = CGPointMake(left + 23.5, position + (4.5 + 17) / 2);
    drawLine.width = 12;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 34.5, position + 13);
    drawLine.endPoint = CGPointMake(left + 26.25, position + 6);
    drawLine.width = 4;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    fillCircle.center = CGPointMake(left + 27, position + 9);
    fillCircle.radius = 4;
    fillCircle.fillColor = windowColor;
    [MWDraw drawFillCircle:fillCircle inContext:context];

    drawLine.startPoint = CGPointMake(left + 27, position + 9);
    drawLine.endPoint = CGPointMake(left + 29, position + 9);
    drawLine.width = 8;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];

    drawLine.startPoint = CGPointMake(left + 36.75, position + 13);
    drawLine.endPoint = CGPointMake(left + 28.5, position + 5);
    drawLine.width = 1;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 36.75, position + 12.25);
    drawLine.endPoint = CGPointMake(left + 27.75, position + 4.5);
    drawLine.width = 2;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 34.75, position + 12.5);
    drawLine.endPoint = CGPointMake(left + 26.75, position + 5);
    drawLine.width = 2;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 33.75, position + 12.5);
    drawLine.endPoint = CGPointMake(left + 25.75, position + 5.5);
    drawLine.width = 1;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 32.75, position + 12.5);
    drawLine.endPoint = CGPointMake(left + 24.75, position + 5.5);
    drawLine.width = 1;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 33, position + 12);
    drawLine.endPoint = CGPointMake(left + 27, position + 12);
    drawLine.width = 2;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 36.5, position + 12.5);
    drawLine.endPoint = CGPointMake(left + 27, position + 12.5);
    drawLine.width = 1;
    drawLine.color = windowColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 20, position + 4.5);
    drawLine.endPoint = CGPointMake(left + 28.5, position + 4.5);
    drawLine.width = 1;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
    
    drawLine.startPoint = CGPointMake(left + 20, position + 5);
    drawLine.endPoint = CGPointMake(left + 29.5, position + 5);
    drawLine.width = 1;
    drawLine.color = wagonColor;
    [MWDraw drawLine:drawLine inContext:context];
}

// Рисуем поезд на схеме метро
// 5й вагон = 1,  00001 in binary
// 4й вагон = 2,  00010 in binary
// 3й вагон = 4,  00100 in binary
// 2й вагон = 8,  01000 in binary
// 1й вагон = 16, 10000 in binary
+ (void)drawRouteListTrain:(int)mask position:(float)position inContext:(CGContextRef)context
{
    // Рисуем первый вагон
    [self drawRouteListFirstWagon:mask & 16 position:position inContext:context];
    
    // Рисуем 2й вагон
    [self drawRouteListWagon:mask & 8 number:2 position:position inContext:context];

    // Рисуем 3й вагон
    [self drawRouteListWagon:mask & 4 number:3 position:position inContext:context];

    // Рисуем 4й вагон
    [self drawRouteListWagon:mask & 2 number:4 position:position inContext:context];

    // Рисуем последний вагон
    [self drawRouteListLastWagon:mask & 1 position:position inContext:context];
}

// Создаем превьюшку для схемы метро. Она используется для показа в списке схем
+ (void)createThumbnail:(MWMetroMap *)metroMap
{
    // Вычисляем размер превьюшки
    CGSize maxSize = CGSizeMake(549 / 2, 389 / 2);
    CGSize thumbnailSize;
    
    float ch = metroMap.image.size.height * maxSize.width / metroMap.image.size.width;
    float cw = metroMap.image.size.width * maxSize.height / metroMap.image.size.height;
    
    if (cw <= maxSize.width) {
        thumbnailSize = CGSizeMake(cw, maxSize.height);
    } else {
        thumbnailSize = CGSizeMake(maxSize.width, ch);
    }
    
    // Создаем превьюшку
    UIGraphicsBeginImageContext(thumbnailSize);
    CGRect thumbnailRect = CGRectMake(0, 0, 0, 0);
    thumbnailRect.origin = CGPointMake(0.0, 0.0);
    thumbnailRect.size.width = thumbnailSize.width;
    thumbnailRect.size.height = thumbnailSize.height;
    
    // Заливаем белым цветом
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
    drawLine.startPoint = CGPointMake(thumbnailRect.size.width / 2, 0);
    drawLine.endPoint = CGPointMake(thumbnailRect.size.width / 2, thumbnailRect.size.height);
    drawLine.width = thumbnailRect.size.width;
    drawLine.color = [UIColor whiteColor];
    
    [MWDraw drawLine:drawLine inContext:UIGraphicsGetCurrentContext()];
    
    [metroMap.image drawInRect:thumbnailRect];
    
    UIImage *thumbnailImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSString *fileName = [NSString stringWithFormat:@"%@_thumbnail.jpg", metroMap.identifier];
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    NSData *data = UIImageJPEGRepresentation(thumbnailImage, 0.8);
    [data writeToFile:path atomically:YES];

    thumbnailImage = nil;
    data = nil;
}

@end
