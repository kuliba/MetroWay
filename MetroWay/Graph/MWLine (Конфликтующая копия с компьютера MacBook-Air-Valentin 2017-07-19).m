//
//  MMLine.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 30.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWLine.h"

@implementation MWLine

@synthesize nameOriginal, nameEnglish, color, identifier, collapsed, type;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:identifier forKey:@"identifier"];
    [aCoder encodeObject:nameOriginal forKey:@"nameOriginal"];
    [aCoder encodeObject:nameEnglish forKey:@"nameEnglish"];
    [aCoder encodeObject:color forKey:@"color"];
    [aCoder encodeInt:type forKey:@"type"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        collapsed = true;
        self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
        self.nameOriginal = [aDecoder decodeObjectForKey:@"nameOriginal"];
        self.nameEnglish = [aDecoder decodeObjectForKey:@"nameEnglish"];
        self.color = [aDecoder decodeObjectForKey:@"color"];
        self.type = [aDecoder decodeIntForKey:@"type"];
    }
    return self;
}

- (id)init
{
    self = [super init];
    collapsed = true;
    type = 0;
    return self;
}

@end
