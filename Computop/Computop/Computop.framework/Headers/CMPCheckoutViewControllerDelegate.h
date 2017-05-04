//
//  CMPCheckoutViewControllerDelegate.h
//  Computop
//
//  Created by Thomas Segkoulis on 08/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMPPaymentRespose.h"
#import "CMPPaymentData.h"

/**
 CMPCheckoutViewControllerDelegate
 
 Protocol used by a CMPCheckoutViewController object, in order to inform the conforming object regarding payment results.
 
 */
@protocol CMPCheckoutViewControllerDelegate <NSObject>

@required

/**
 Called after payment is authorized successfully.
 
 @param paymentData A paymentData object.
 @param response    Response received after exexuting payment request.

 */
- (void)checkoutDidAuthorizePaymentForPaymentData:(CMPPaymentData *)paymentData withResponse: (CMPPaymentRespose *)response;


/**
 Called after payment failed to be authorized.
 
 @param paymentData A paymentData object.
 @param error Returns the error if the authorization was not successful.
 @param response    Response received after exexuting payment request.

 */
- (void)checkoutDidFailToAuthorizePaymentForPaymentData:(CMPPaymentData *)paymentData withError:(NSError *)error withResponse: (CMPPaymentRespose *)response;

/**
 Called after payment has be cancelled by User.
 
 @param paymentData A paymentData object.
 
 */
- (void)checkoutDidCancelForPaymentData:(CMPPaymentData *)paymentData;

@end
