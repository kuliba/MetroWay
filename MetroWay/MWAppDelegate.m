//
//  MMAppDelegate.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 04.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWAppDelegate.h"
#import "MWStorage.h"
#import "MWSettings.h"
#import "MWMetroMapViewController.h"
#import "MWDownload.h"
#import "MWList.h"
#import "Flurry.h"

#ifdef DEBUG
#import "MWDevelopment.h"
#endif

@implementation MWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
#ifdef DEBUG
    //[MMDevelopment createAllMetro:YES];
    //[MMDevelopment createWuhanMetro:NO];
    //[MMDevelopment createLosAngelesMetro:NO];
    //[MMDevelopment createMoscowMetro:NO];
    //[MMDevelopment createKyotoSubway:NO];
    //[MMDevelopment createTorontoSubway:NO];
    //[MMDevelopment createAmsterdamMetro:NO];
    //[MMDevelopment createNizhnyNovgorodMetro:NO];
    //[MMDevelopment createPortoAlegreMetro:NO];
    //[MMDevelopment createYokohamaSubway:NO];
    //[MMDevelopment createMedellinMetro:NO];
    [MWDevelopment createBostonSubway:NO];
    
    [MWDevelopment createNewList:YES];
    //[MMDevelopment createRandomRoute];
    //[MMSettings resetSettings];
    //[MMDevelopment uploadMetroMapImageToSite:@"yokohama_subway"];
    
    //[MMSettings setCurrentMetroMapIdentifier:@"mo];
    
//    [MMLocation correctZeroDistances:[MMStorage currentMetroMap]];
#endif
    
#ifndef DEBUG
    [Flurry setCrashReportingEnabled:YES];
    [Flurry startSession:@"D8NTDJCMG2RNQFBY2C4Y"];
#endif
    
    [[MWStorage storage] checkListUpdate];
    
    // Устанавливаем белый цвет шрифта для системного статусбара
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    MWMetroMapViewController *metroMapViewController = [[MWMetroMapViewController alloc] init];
    self.window.rootViewController = metroMapViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
