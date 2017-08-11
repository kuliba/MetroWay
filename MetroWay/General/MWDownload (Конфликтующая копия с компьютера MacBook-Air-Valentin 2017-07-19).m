//
//  MMDownload.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 20.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDownload.h"
#import "SystemConfiguration/SystemConfiguration.h"

@implementation MWDownload;

+ (NSString *)serverURL:(NSString *)path;
{
#ifdef DEBUG
    return [NSString stringWithFormat:@"%@%@", @"http://www.clickwood-.org/metroway/", path]; // На сервер ничего не посылаем
#else
    return [NSString stringWithFormat:@"%@%@", @"http://www.clickwood.org/metroway/", path];
#endif
}

// Возвращаем единственный экземпляр (синглетон)
+ (MWDownload *)downloadManager
{
    // Реализуем синглетон
    static MWDownload *download = nil;
    if (!download) {
        download = [[super allocWithZone:nil] init];
    }
    return download;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self downloadManager];
}

+ (BOOL)isConnectionAvailable
{
    SCNetworkReachabilityFlags flags;
    BOOL receivedFlags;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [@"apple.com" UTF8String]);
    receivedFlags = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);
    
    if (!receivedFlags || (flags == 0)) {
        return false;
    } else {
        return true;
    }
}

+ (void)updateList
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSURL *downloadTaskURL = [NSURL URLWithString:[MWDownload serverURL:@"_get_file.php?file=list.data"]];
    [[session downloadTaskWithURL: downloadTaskURL
                completionHandler:^(NSURL *location, NSURLResponse *responce, NSError *error) {
                    
                    if(error == nil)
                    {
                        NSError *err = nil;
                        NSFileManager *fileManager = [NSFileManager defaultManager];
                        NSString *cashDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                        
                        // Удаляем предыдущую версию файла
                        NSString *path = [cashDir stringByAppendingPathComponent:@"new_list.data"];
                        [fileManager removeItemAtPath:path error:NULL];
                        
                        NSURL *cashDirURL = [NSURL fileURLWithPath:path];
                        if ([fileManager moveItemAtURL:location
                                                 toURL:cashDirURL
                                                 error: &err])
                        {
                            //NSLog(@"File is saved to: %@", docsDir);
                        }
                        else
                        {
                            //NSLog(@"failed to move: %@", [err userInfo]);
                        }
                        
                        [fileManager removeItemAtURL:location error:nil];
                        
                        // В случае, если интернет нам вместо списка выдаст любые данные, например, при редиректе, то пропускаем обновление
                        @try {
                            MWList *newMetroList = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

                            // Обновляем текущий список
                            [[MWStorage metroMapList] updateList:newMetroList];
                            
                            // Отсылаем всем сообщение, что новый список загружен и обновлен
                            NSNotification *listDownloaded = [NSNotification notificationWithName:@"listDownloaded" object:self];
                            NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
                            [notificationCenter postNotification:listDownloaded];
                            
                            MWList *list = [MWStorage metroMapList];
                            
                            if (list.newVersions.count && [MWSettings automaticUpdates]) [self updateMetroMaps];
                        }
                        @catch (NSException *exception) {
                            //
                        }
                        @finally {
                            //
                        }
                    }
                }] resume];
}

+ (void)updateMetroMaps
{
    MWList *list = [MWStorage metroMapList];
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    
    for (MWListItem *listItem in list.newVersions) {
        NSURL *downloadTaskURL = [NSURL URLWithString:[MWDownload serverURL:[NSString stringWithFormat:@"_get_file.php?file=%@.mm", listItem.identifier]]];
        [[session downloadTaskWithURL: downloadTaskURL
                    completionHandler:^(NSURL *location, NSURLResponse *responce, NSError *error) {
                        
                        if(error == nil)
                        {
                            NSError *err = nil;
                            NSFileManager *fileManager = [NSFileManager defaultManager];
                            NSString *cashDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                            
                            // Удаляем предыдущую версию файла
                            NSString *path = [cashDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mm", listItem.identifier]];
                            [fileManager removeItemAtPath:path error:NULL];
                            
                            NSURL *cashDirURL = [NSURL fileURLWithPath:path];
                            if ([fileManager moveItemAtURL:location
                                                     toURL:cashDirURL
                                                     error: &err])
                            {
                                //NSLog(@"File is saved to: %@", docsDir);
                            }
                            else
                            {
                                //NSLog(@"failed to move: %@", [err userInfo]);
                            }
                            
                            [fileManager removeItemAtURL:location error:nil];
                            
                            listItem.versionNumberOnDevice = listItem.versionNumberOnSite;
                            [[MWStorage metroMapList] save];
                            
                            if ([listItem.identifier isEqualToString:[MWSettings currentMetroMapIdentifier]]) {
                                [[MWStorage storage] reloadCurrentMetroMap];
                            }
                            
                            // Отсылаем всем сообщение, что схема метро загружена и обновлена (для экрана выбора схемы)
                            NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
                            NSDictionary *details = [[NSDictionary alloc] initWithObjectsAndKeys:listItem.identifier, @"identifier", nil];
                            NSNotification *newMapDownloaded1 = [NSNotification notificationWithName:@"metroMapDownloaded" object:self userInfo:details];
                            [notificationCenter postNotification:newMapDownloaded1];
                        }
                    }] resume];
    }
}

- (void)downloadMetroMap:(MWListItem *)listItem
{
    NSURLSessionDownloadTask *downloadTask;
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self.self delegateQueue:nil];
    
    NSURL *downloadTaskURL = [NSURL URLWithString:[MWDownload serverURL:[NSString stringWithFormat:@"_get_file.php?file=%@.mm", listItem.identifier]]];
    
    downloadTask = [session downloadTaskWithURL:downloadTaskURL];

    [downloadTask resume];
    listItem.downloadTask = downloadTask;
}

 - (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
 {
     MWList *list = [MWStorage metroMapList];
     for (MWListItem *listItem in list.items) {
         if ([listItem.downloadTask isEqual:downloadTask]) {
             listItem.downloadProgress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
         }
     }
 }

 - (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
 {
     MWList *list = [MWStorage metroMapList];
     for (MWListItem *listItem in list.items) {
          if ([listItem.downloadTask isEqual:downloadTask]) {
              NSError *err = nil;
              NSFileManager *fileManager = [NSFileManager defaultManager];
              NSString *cashDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
              
              // Удаляем предыдущую версию файла
              NSString *path = [cashDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mm", listItem.identifier]];
              [fileManager removeItemAtPath:path error:NULL];
              
              NSURL *cashDirURL = [NSURL fileURLWithPath:path];
              if ([fileManager moveItemAtURL:location
                                       toURL:cashDirURL
                                       error: &err])
              {
                  //NSLog(@"File is saved to: %@", docsDir);
              }
              else
              {
                  //NSLog(@"failed to move: %@", [err userInfo]);
              }
              
              [fileManager removeItemAtURL:location error:nil];
              
              listItem.versionNumberOnDevice = listItem.versionNumberOnSite;
              [list save];
              
              if ([listItem.identifier isEqualToString:[MWSettings currentMetroMapIdentifier]]) {
                  [[MWStorage storage] reloadCurrentMetroMap];
              }
              
              // Отсылаем всем сообщение, что схема метро загружена и обновлена (для экрана выбора схемы)
              NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
              NSDictionary *details = [[NSDictionary alloc] initWithObjectsAndKeys:listItem.identifier, @"identifier", nil];
              NSNotification *newMapDownloaded1 = [NSNotification notificationWithName:@"metroMapDownloaded" object:self userInfo:details];
              [notificationCenter postNotification:newMapDownloaded1];
          }
     }
 }

+ (void)downloadThumbnail:(NSString *)identifier
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSString *fileName = [NSString stringWithFormat:@"%@_thumbnail.jpg", identifier];
    NSURL *downloadTaskURL = [NSURL URLWithString:[MWDownload serverURL:[NSString stringWithFormat:@"_get_file.php?file=%@", fileName]]];
    [[session downloadTaskWithURL: downloadTaskURL
                completionHandler:^(NSURL *location, NSURLResponse *responce, NSError *error) {
                    
                    if(error == nil)
                    {
                        NSError *err = nil;
                        NSFileManager *fileManager = [NSFileManager defaultManager];
                        NSString *cashDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                        
                        // Удаляем предыдущую версию файла
                        NSString *path = [cashDir stringByAppendingPathComponent:fileName];
                        [fileManager removeItemAtPath:path error:NULL];
                        
                        NSURL *cashDirURL = [NSURL fileURLWithPath:path];
                        if ([fileManager moveItemAtURL:location
                                                 toURL:cashDirURL
                                                 error: &err])
                        {
                            //NSLog(@"File is saved to: %@", docsDir);
                        }
                        else
                        {
                            //NSLog(@"failed to move: %@", [err userInfo]);
                        }
                        
                        [fileManager removeItemAtURL:location error:nil];
                        
                        // Отсылаем всем сообщение, что загружена превьюшка
                        NSDictionary *details = [[NSDictionary alloc] initWithObjectsAndKeys:identifier, @"identifier", nil];
                        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
                        NSNotification *thumbnail_downloaded = [NSNotification notificationWithName:@"thumbnail_downloaded" object:self userInfo:details];
                        [notificationCenter postNotification:thumbnail_downloaded];
                    }
                }] resume];
}

@end
