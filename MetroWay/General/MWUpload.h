//
//  MMUpload.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 12.04.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWUpload : NSObject

// Массив файлов, которые необходимо закачать на сервер
@property (nonatomic, strong) NSMutableArray *items;
// Ответ от сервера
@property (nonatomic, retain) NSMutableData *infoData;

+ (MWUpload *)uploader;
+ (void)uploadFileSynchronous:(NSString *)fileName;

@end
