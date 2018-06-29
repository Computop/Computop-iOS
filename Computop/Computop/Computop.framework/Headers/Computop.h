//
//  Computop.h
//  Computop
//
//  Created by Thomas Segkoulis on 13/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for Computop.
FOUNDATION_EXPORT double ComputopVersionNumber;

//! Project version string for Computop.
FOUNDATION_EXPORT const unsigned char ComputopVersionString[];

#import <Computop/CMPConfiguration.h>
#import <Computop/CMPCheckout.h>
#import <Computop/CMPCheckoutViewController.h>
#import <Computop/CMPCheckoutViewControllerDelegate.h>
#import <Computop/CMPApplePay.h>
#import <Computop/CMPApplePayDelegate.h>
#import <Computop/CMPCheckout.h>
#import <Computop/CMPPaymentData.h>
#import <Computop/CMPPaymentDataProtocol.h>
#import <Computop/CMPPaymentMethod.h>
#import <Computop/CMPPaymentMethodProtocol.h>
#import <Computop/CMPWeChat.h>
#import "Computop/CMPayPal.h"

/**
 'Computop'
 
 A project generic Singleton object
 
 */
@interface Computop : NSObject

/**
 Singleton
 
 */
+ (Computop *)sharedInstance;

/**
 Fetches and returns a list of available payment methods for the current Merchant.
 
 @param onSuccess   Returns an array of CMPPaymentMethod objects.
 @param onFailure   Returns an error if the payment methods could not be retrieved.
 
 */
- (void)paymentMethodsOnSuccess:(void (^)(NSArray<CMPPaymentMethod *> *paymentMethods))onSuccess
                      onFailure:(void (^)(NSError *error))onFailure;

/**
 Fetches and returns a payment method given its ID parameter.
 
 @param pmID Payment method's ID parameter.
 
 @return A CMPPaymentMethod object.
 
 */
- (CMPPaymentMethod *)paymentMethodForID:(NSString *)pmID;

@end

