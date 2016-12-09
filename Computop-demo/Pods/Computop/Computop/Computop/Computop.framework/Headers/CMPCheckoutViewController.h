//
//  CMPCheckoutViewController.h
//  Computop
//
//  Created by Thomas Segkoulis on 07/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#import "CMPPaymentDataProtocol.h"
#import "CMPCheckoutViewControllerDelegate.h"
#import "CMPPaymentMethodProtocol.h"

/**
 'CMPCheckoutViewController'
 
 This is the main UIViewController encapsulating all the views stack in order to proceed with the Payment and providing delegation as well.
 
 */
@interface CMPCheckoutViewController : UIViewController <WKScriptMessageHandler, WKNavigationDelegate>

/**
 Delegate object conforming to 'CMPCheckoutViewControllerDelegate' protocol in order to be informed regarding payment results.
 */
@property (nonatomic, weak) id <CMPCheckoutViewControllerDelegate> delegate;

/**
 An 'id <CMPPaymentDataProtocol>' object that contains all the, inserted by the User, Payment data.
 */
@property (strong, nonatomic) id <CMPPaymentDataProtocol> paymentData;

/**
 An 'id <CMPPaymentMethodProtocol>' object that contains all the data for a Payment method.
 */
@property (strong, nonatomic) id <CMPPaymentMethodProtocol> paymentMethod;


@end

