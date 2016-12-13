//
//  CMPCheckout.h
//  Computop
//
//  Created by Thomas Segkoulis on 09/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CMPCheckoutViewController.h"
#import "CMPPaymentData.h"
#import "CMPPaymentMethod.h"

/**
 CMPCheckout
 
 The CMPCheckout class is a top-level class that facilitates the payment procedure.
 It is responsible for validating payment data and instantiating a CMPCheckoutViewController object.
 
 */

@interface CMPCheckout : NSObject

/**
 Validates parameters and instantiates an CMPCheckoutViewController object.
 
 @param paymentData            A model object that contains all the inserted Payment data.
 @param paymentMethod          A model object that contains all the Payment Method's related data.
 @param onSuccess              Returns a CMPCheckoutViewController object, if it could be instantiated
 @param onFailure              Returns an error, if the CMPCheckoutViewController object could not be instantiated

 @return Void
 */
- (void)instantiateCheckoutViewControllerWithPaymentData:(CMPPaymentData *)paymentData
                                       withPaymentMethod:(CMPPaymentMethod *)paymentMethod
                                               onSuccess:(void (^)(CMPCheckoutViewController *checkoutViewController))onSuccess
                                               onFailure:(void (^)(NSError *error))onFailure;

@end
