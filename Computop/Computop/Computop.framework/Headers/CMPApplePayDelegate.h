//
//  CMPApplePayDelegate.h
//  Computop
//
//  Created by Thomas Segkoulis on 29/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMPPaymentDataProtocol.h"

/**
 'CMPApplePayDelegate'
 
 The 'CMPApplePayDelegate' protocol is used to return the navigation and payment results to the object conforming to it.
 
 */
@protocol CMPApplePayDelegate 

@required

/**
 Called when PKPaymentAuthorizationViewController is dismissed.
 
 */
- (void)applePayDidDismiss;

/**
 Called after Apple Pay payment is authorized successfully.
 All the shipping data entered are merged into the existing PaymentData.
 
 @param paymentData A paymentData object conforming to CMPPaymentDataProtocol

 */
- (void)applePayDidAuthorizePaymentForPaymentData:(id <CMPPaymentDataProtocol>) paymentData;


/**
 Called after Apple Pay payment failed to be authorized.
 
 @param paymentData A paymentData object conforming to CMPPaymentDataProtocol
 @param error Returns the error if the authorization was not successful.
 
 */
- (void)applePayDidFailToAuthorizePaymentForPaymentData:(id <CMPPaymentDataProtocol>) paymentData withError:(NSError *)error;


@optional

/**
 Called when User has selected a new payment card. Use this delegate callback if you need to 
 update the summary items in response to the card type changing (for example, applying credit card surcharges).
 
 @param paymentMethod A PKPaymentMethod object containing details of the selected payment method.
 @param completion A block that is called to pass PKPaymentSummaryItem objects in order to update the summary items in response to the card type changing.

 */
- (void)applePayPaymentDidSelectPaymentMethod:(PKPaymentMethod *)paymentMethod
                                   completion:(void (^)(NSArray<PKPaymentSummaryItem *> *summaryItems))completion NS_AVAILABLE_IOS(9_0);

/**
 Called when User changes shipping data.
 
 @param contact A PKContact object containing details of the selected shipping data.
 @param completion A block that is called to pass a PKPaymentAuthorizationStatus object and PKPaymentSummaryItem objects in order to update the summary items in response to the shipping data changing.
 
 */
- (void)applePayPaymentDidSelectShippingContact:(nonnull PKContact *)contact
                                     completion:(nonnull void (^)(PKPaymentAuthorizationStatus authorizationStatus, NSArray<PKPaymentSummaryItem *> *summaryItems))completion NS_AVAILABLE_IOS(9_0);

@end
