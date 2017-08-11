//
//  MMTableViewCell.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 29.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWBaseTableViewCell.h"
#import "MWDrawFillCircle.h"
#import "MWDraw.h"

@implementation MWBaseTableViewCell

//@synthesize station1, station2, listItem;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    CGRect screenBound = [[UIScreen mainScreen] bounds];

    float inset = 10.5; // Отступ ячейки от краев
    frame.origin.x += inset;
    frame.size.width = screenBound.size.width - 2 * inset;
    [super setFrame:frame];
}

@end
