//
//  CMPApplePay.h
//  Computop
//
//  Created by Thomas Segkoulis on 29/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PassKit/PassKit.h>

#import "CMPApplePayDelegate.h"
#import "CMPPaymentData.h"

/**
 CMPApplePay
 
 The CMPApplePay class is a top-level class that facilitates the Apple Pay payment procedure.
 It is responsible for validating payment data and instantiating a PKPaymentAuthorizationViewController object.
 
 */

@interface CMPApplePay : NSObject

/**
 Delegate object conforming to CMPApplePayDelegate protocol in order to retrieve responses from payment.
 
 */
@property (nonatomic, weak) id <CMPApplePayDelegate> delegate;

/**
 Validates parameters and instantiates a PKPaymentAuthorizationViewController object.
 
 @param paymentData                         A model object that contains all the inserted Payment data.
 @param paymentSummaryItems                 An array of PKPaymentSummaryItem objects, defining a summary item in a payment request—for example, total, tax, discount, or grand total.
 @param supportedNetworks                   The payment networks supported by the merchant, for example @[ PKPaymentNetworkVisa, PKPaymentNetworkMasterCard ].  This property constrains payment cards that may fund the payment.
 @param requiredShippingAddressFields       The shipping address fields inside ApplePay UI (PKAddressFieldPostalAddress|PKAddressFieldPhone|PKAddressFieldEmail|PKAddressFieldName)
 @param onSuccess                           A PKPaymentAuthorizationViewController object.
 @param onFailure                           Returns an error, if the PKPaymentAuthorizationViewController object could not be instantiated

 @return Void
 */
- (void)instantiatePKPaymentAuthorizationViewControllerWithPaymentData:(CMPPaymentData *)paymentData
                                               withPaymentSummaryItems:(NSArray<PKPaymentSummaryItem *> *)paymentSummaryItems
                                                 withSupportedNetworks:(NSArray *)supportedNetworks
                                     withRequiredShippingAddressFields:(PKAddressField)requiredShippingAddressFields
                                    paymentAuthorizationViewController:(void (^)(PKPaymentAuthorizationViewController *applePayViewController))onSuccess
                                                             onFailure:(void (^)(NSError *error))onFailure;


/**
 Determine whether this device can process payment requests using specific payment network brands.
 Your application should confirm that the user can make payments before attempting to authorize a payment.
 Your application may also want to alter its appearance or behavior when the user is not allowed to make payments.
 YES if the user can authorize payments on this device using one of the payment networks supported by the merchant.
 NO if the user cannot authorize payments on these networks or if the user is restricted from authorizing payments.
 
 @param supportedNetworks The payment networks supported by the merchant, for example @[ PKPaymentNetworkVisa, PKPaymentNetworkMasterCard ].  This property constrains payment cards that may fund the payment.
 
 */
- (BOOL)canMakePaymentsForSupportedNetworks:(NSArray *)supportedNetworks;

@end
