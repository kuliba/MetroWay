//
//  MWTransfer.h
//  MetroWay
//
//  Created by Valentin Ozerov on 07.01.17.
//  Copyright © 2017 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWTransfer : NSObject <NSCoding>

// Идентификаторы
@property (nonatomic, strong) NSString *station1Identifier;
@property (nonatomic, strong) NSString *station2Identifier;
// Время пересадки в минутах
@property (nonatomic) float time;
// Длительность пересадки одинакова в обоих направлениях?
@property (nonatomic) BOOL roundTrip;

@end
