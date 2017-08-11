//
//  MWInApp.h
//  MetroWay
//
//  Created by Valentin Ozerov on 12.12.15.
//  Copyright © 2015 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface MWInApp : NSObject <SKProductsRequestDelegate, SKPaymentTransactionObserver>

+ (MWInApp *)inAppManager;

- (void)restore;
- (void)removeAds;

@end
