//
//  MWRoute.h
//  MetroWay
//
//  Created by Valentin Ozerov on 25.01.17.
//  Copyright © 2017 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWRoute : NSObject

// Путь маршрута
@property (nonnull, strong) NSArray *path;
// Время поездки в минутах
@property float tripTime;
// Количество пересадок
@property int transfers;
// Длинна пути
@property float length;

@end
