//
//  MWInApp.m
//  MetroWay
//
//  Created by Valentin Ozerov on 12.12.15.
//  Copyright © 2015 Valentin Ozerov. All rights reserved.
//

#import "MWInApp.h"
#import "MWSettings.h"

@implementation MWInApp

+ (MWInApp *)inAppManager
{
    // Реализуем синглетон
    static MWInApp *inApp = nil;
    if (!inApp) {
        inApp = [[super allocWithZone:nil] init];
    }
    return inApp;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    // Реализуем синглетон
    return [self inAppManager];
}

- (id)init
{
    self = [super init];
    return self;
}

#define kRemoveAdsProductIdentifier @"org.clickwood.metroway.removeads"

- (void)removeAds{
    
    NSLog(@"User requests to remove ads");
    
    if([SKPaymentQueue canMakePayments]){
        NSLog(@"User can make payments");
        
        //If you have more than one in-app purchase, and would like
        //to have the user purchase a different product, simply define
        //another function and replace kRemoveAdsProductIdentifier with
        //the identifier for the other product
        
        SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:kRemoveAdsProductIdentifier]];
        productsRequest.delegate = self;
        [productsRequest start];
        
    }
    else{
        NSLog(@"User cannot make payments due to parental controls");
        //this is called the user cannot make payments, most likely due to parental controls

        [self hideInAppHUD];
    }
}

- (void)hideInAppHUD
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [NSNotification notificationWithName:@"hideInAppHUD" object:self userInfo:nil];
    [notificationCenter postNotification:notification];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    SKProduct *validProduct = nil;
    int count = (int)[response.products count];
    if(count > 0){
        validProduct = [response.products objectAtIndex:0];
        NSLog(@"Products Available!");
        [self purchase:validProduct];
    }
    else if(!validProduct){
        NSLog(@"No products available");
        //this is called if your product id is not valid, this shouldn't be called unless that happens.
    }
}

- (void)purchase:(SKProduct *)product
{
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void)restore{
    //this is called when the user restores purchases, you should hook this up to a button
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    NSLog(@"received restored transactions: %lu", (unsigned long)queue.transactions.count);
    for(SKPaymentTransaction *transaction in queue.transactions){
        
        switch(transaction.transactionState){
            case SKPaymentTransactionStatePurchasing: NSLog(@"Transaction state -> Purchasing");
                //called when the user is in the process of purchasing, do not add any of your own code here.
                break;
            case SKPaymentTransactionStatePurchased:
                //this is called when the user has successfully purchased the package (Cha-Ching!)
                [self doRemoveAds]; //you can add your code for what you want to happen when the user buys the purchase here, for this tutorial we use removing ads
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                NSLog(@"Transaction state -> Purchased");
                break;
            case SKPaymentTransactionStateRestored:
                //called when the user successfully restores a purchase
                NSLog(@"Transaction state -> Restored");
                
                [self doRemoveAds];
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];

                [self inAppRestored];
                break;
            case SKPaymentTransactionStateFailed:
                //called when the transaction does not finish
                if(transaction.error.code == SKErrorPaymentCancelled){
                    NSLog(@"Transaction state -> Cancelled");
                    //the user cancelled the payment ;(
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                [self inAppCancelled];
            case SKPaymentTransactionStateDeferred:
                NSLog(@"SKPaymentTransactionStateDeferred");
                break;
        }
    }
    [self hideInAppHUD];
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error
{
    NSLog(@"%@", error.localizedDescription);
    [self hideInAppHUD];
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions{
    for(SKPaymentTransaction *transaction in transactions){
        switch(transaction.transactionState){
            case SKPaymentTransactionStatePurchasing: NSLog(@"Transaction state -> Purchasing");
                //called when the user is in the process of purchasing, do not add any of your own code here.
                break;
            case SKPaymentTransactionStatePurchased:
                //this is called when the user has successfully purchased the package (Cha-Ching!)
                [self doRemoveAds]; //you can add your code for what you want to happen when the user buys the purchase here, for this tutorial we use removing ads
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                NSLog(@"Transaction state -> Purchased");
                [self hideInAppHUD];
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"Transaction state -> Restored");
                //add the same code as you did from SKPaymentTransactionStatePurchased here
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                [self hideInAppHUD];
                break;
            case SKPaymentTransactionStateFailed:
                //called when the transaction does not finish
                if(transaction.error.code == SKErrorPaymentCancelled){
                    NSLog(@"Transaction state -> Cancelled");
                    //the user cancelled the payment ;(
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                [self inAppCancelled];
            case SKPaymentTransactionStateDeferred:
                NSLog(@"SKPaymentTransactionStateDeferred");
                break;
        }
    }
}

- (void)doRemoveAds
{
    [MWSettings settings].areAdsRemoved = true;

    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [NSNotification notificationWithName:@"removeAds" object:self userInfo:nil];
    [notificationCenter postNotification:notification];
}

- (void)inAppRestored
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [NSNotification notificationWithName:@"inAppRestored" object:self userInfo:nil];
    [notificationCenter postNotification:notification];
}

- (void)inAppCancelled
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [NSNotification notificationWithName:@"inAppCancelled" object:self userInfo:nil];
    [notificationCenter postNotification:notification];
}

@end
