//
//  MMLine.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 30.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWLine.h"

@implementation MWLine

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identifier forKey:@"identifier"];
    [aCoder encodeObject:_nameOriginal forKey:@"nameOriginal"];
    [aCoder encodeObject:_nameEnglish forKey:@"nameEnglish"];
    [aCoder encodeObject:_color forKey:@"color"];
    [aCoder encodeInt:_lineType forKey:@"lineType"];
    [aCoder encodeInt:_middleSpeed forKey:@"middleSpeed"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _collapsed = true;
        _identifier = [aDecoder decodeObjectForKey:@"identifier"];
        _nameOriginal = [aDecoder decodeObjectForKey:@"nameOriginal"];
        _nameEnglish = [aDecoder decodeObjectForKey:@"nameEnglish"];
        _color = [aDecoder decodeObjectForKey:@"color"];
        _lineType = [aDecoder decodeIntForKey:@"lineType"];
        _middleSpeed = [aDecoder decodeIntForKey:@"middleSpeed"];
    }
    return self;
}

- (id)init
{
    self = [super init];
    _collapsed = true;
    _lineType = 0;
    _middleSpeed = 0;
    return self;
}

@end
