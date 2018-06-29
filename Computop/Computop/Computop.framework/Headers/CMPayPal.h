//
//  PayPal.h
//  Computop
//
//  Created by Gerald collaku on 23.04.18.
//  Copyright © 2018 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMPPaymentData.h"
#import "CMPPaymentMethod.h"


@interface CMPayPal : NSObject

 - (void)startPaypalPay:(CMPPaymentMethod *)paymentMethod success:(void (^)(NSData *data))onSuccess failure:(void (^)(NSError *error))onFailure;

-(id) init;
    
@end
