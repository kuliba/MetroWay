//
//  MMDrawTextLine.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 12.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWDrawTextLine.h"

@implementation MWDrawTextLine

@synthesize text, fontName, fontSize, fontColor, kernSpacing, origin, frame, radians;

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
        result = CGRectMake(origin.x - catet4, origin.y, abs(catet1) + abs(catet4), abs(catet2) + abs(catet3));
    } else if (radians > 90 * M_PI / 180 && radians <= 180 * M_PI / 180) {
        result = CGRectMake(origin.x - catet4 + catet1, origin.y + catet3, abs(catet1) + abs(catet4), abs(catet2) + abs(catet3));
    } else if (radians > 180 * M_PI / 180 && radians <= 270 * M_PI / 180) {
        result = CGRectMake(origin.x - abs(catet1), origin.y - abs(catet3) - abs(catet2), abs(catet1) + abs(catet4), abs(catet2) + abs(catet3));
    } else {
        result = CGRectMake(origin.x, origin.y - abs(catet2), abs(catet1) + abs(catet4), abs(catet2) + abs(catet3));
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

@end