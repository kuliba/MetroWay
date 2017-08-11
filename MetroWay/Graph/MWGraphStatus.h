//
//  MWGraphStatus.h
//  MetroWay
//
//  Created by Valentin Ozerov on 17.06.16.
//  Copyright © 2016 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MWGraphObjectStatusNone,
    MWGraphObjectStatusClosed
} MWGraphObjectStatus;

@interface MWGraphStatus : NSObject <NSCoding>

@property (nonatomic) MWGraphObjectStatus status;
@property (nonatomic, strong) NSDate *fromDate;
@property (nonatomic, strong) NSDate *toDate;

@end
