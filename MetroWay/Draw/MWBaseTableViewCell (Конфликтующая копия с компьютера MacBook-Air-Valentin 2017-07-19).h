//
//  MMTableViewCell.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 29.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWStation.h"
#import "MWListItem.h"

@interface MWBaseTableViewCell : UITableViewCell

@property (weak, nonatomic) MWStation *station1, *station2;
@property (weak, nonatomic) MWListItem *listItem;

@end
