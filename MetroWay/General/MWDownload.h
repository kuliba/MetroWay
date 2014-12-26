//
//  MMDownload.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 20.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWList.h"
#import "MWStorage.h"
#import "MWSettings.h"
#import "MWListItem.h"

@interface MWDownload : NSObject <NSURLSessionDownloadDelegate>

+ (MWDownload *)downloadManager;
+ (BOOL)isConnectionAvailable;
+ (void)updateList;
- (void)downloadMetroMap:(MWListItem *)listItem;
+ (void)downloadThumbnail:(NSString *)identifier;

@end