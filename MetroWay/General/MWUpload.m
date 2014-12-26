//
//  MMUpload.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 12.04.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWUpload.h"
#import "MWStorage.h"

@implementation MWUpload

@synthesize items, infoData;

+ (MWUpload *)uploader
{
    // Реализуем синглетон
    static MWUpload *uploader = nil;
    if (!uploader) {
        uploader = [[super allocWithZone:nil] init];
    }
    return uploader;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    // Реализуем синглетон
    return [self uploader];
}

- (id)init
{
    self = [super init];
    if (self) {
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    items = nil;
}

- (void)uploadFileAsynchronous
{
    NSString *URL = @"http://www.clickwood.org/mm/_uploader.php";
    URL = [URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0f];
    [theRequest setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [theRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    // Получаем полный путь
    NSString *fileName = @"moscow_metro.mm";
    NSString *path = [[MWStorage cachesDirectory] stringByAppendingPathComponent:fileName];
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n", fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:fileData];
    [body appendData:[@"" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [theRequest setHTTPBody:body];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:theRequest delegate:self];
    if (connection) {
        self.infoData = [NSMutableData data];
    } else {
        NSLog(@"Connection failed");
    }
    NSLog(@"Запрос ушел");
}

// Синхронная загрузка файла на сервер
+ (void)uploadFileSynchronous:(NSString *)fileName
{
    NSString *URL = @"http://www.clickwood.org/mm/_uploader.php";
    URL = [URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0f];
    [theRequest setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [theRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    // Получаем полный путь
    NSString *path = [[MWStorage cachesDirectory] stringByAppendingPathComponent:fileName];
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n", fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:fileData];
    [body appendData:[@"" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [theRequest setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", returnString);
    
    theRequest = nil;
    fileData = nil;
    body = nil;
    returnData = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [infoData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *result = [[NSString alloc] initWithData:infoData encoding:NSUTF8StringEncoding];
    NSLog(@"Отправка файла на сервер закончена с результатом: %@", result);
}

@end
