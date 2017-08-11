//
//  MMDrawTextLine.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 12.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWDrawTextLine.h"

@implementation MWDrawTextLine

@synthesize text, fontName, fontSize, fontColor, kernSpacing, origin, frame, radians, degrees;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:text forKey:@"text"];
    [aCoder encodeObject:fontName forKey:@"fontName"];
    [aCoder encodeInt:fontSize forKey:@"fontSize"];
    [aCoder encodeObject:fontColor forKey:@"fontColor"];
    [aCoder encodeFloat:kernSpacing forKey:@"kernSpacing"];
    [aCoder encodeCGPoint:origin forKey:@"origin"];
    [aCoder encodeFloat:radians forKey:@"radians"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setText:[aDecoder decodeObjectForKey:@"text"]];
        [self setFontName:[aDecoder decodeObjectForKey:@"fontName"]];
        [self setFontSize:[aDecoder decodeIntForKey:@"fontSize"]];
        [self setFontColor:[aDecoder decodeObjectForKey:@"fontColor"]];
        [self setKernSpacing:[aDecoder decodeFloatForKey:@"kernSpacing"]];
        [self setOrigin:[aDecoder decodeCGPointForKey:@"origin"]];
        [self setRadians:[aDecoder decodeFloatForKey:@"radians"]];
    }
    return self;
}

- (CGRect)frame
{
    CGSize textSize;
    CGRect result;
    
    textSize = [text boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:[UIFont fontWithName:fontName size:fontSize] } context:nil].size;
        
    // Ищем гипотенузу
    float gip = textSize.width;
        
    // Ищем длину первого катета
    float catet1 = gip * cos(radians);
        
    // Ищем длину второго катета
    float catet2 = gip * sin(radians);
        
    float catet3 = textSize.height * cos(radians);
    float catet4 = textSize.height * sin(radians);
        
    if (radians >= 0 * M_PI / 180 && radians <= 90 * M_PI / 180) {
        result = CGRectMake(origin.x - catet4, origin.y, fabsf(catet1) + fabsf(catet4), fabsf(catet2) + fabsf(catet3));
    } else if (radians > 90 * M_PI / 180 && radians <= 180 * M_PI / 180) {
        result = CGRectMake(origin.x - catet4 + catet1, origin.y + catet3, fabsf(catet1) + fabsf(catet4), fabsf(catet2) + fabsf(catet3));
    } else if (radians > 180 * M_PI / 180 && radians <= 270 * M_PI / 180) {
        result = CGRectMake(origin.x - fabsf(catet1), origin.y - fabsf(catet3) - fabsf(catet2), fabsf(catet1) + fabsf(catet4), fabsf(catet2) + fabsf(catet3));
    } else {
        result = CGRectMake(origin.x, origin.y - fabsf(catet2), fabsf(catet1) + fabsf(catet4), fabsf(catet2) + fabsf(catet3));
    }
    
    return result;
}

- (CGRect)frame_not_rotated
{
    CGSize textSize;
    CGRect result;
    
    textSize = [text boundingRectWithSize:CGSizeMake(HUGE, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:[UIFont fontWithName:fontName size:fontSize] } context:nil].size;
    
    result = CGRectMake(origin.x, origin.y, textSize.width, textSize.height);
    return result;
}

- (void)setDegrees:(float)sd
{
    self.radians = sd * M_PI / 180;
}

- (float)degrees
{
    return self.radians * 180 / M_PI;
}

@end