//
//  CMPWeChat.h
//  Computop
//
//  Created by Gerald Colllaku on 03/03/18.
//  Copyright © 2017 Computop GmbH. All rights reserved.

// hey Gerald
//

#import <Foundation/Foundation.h>
#import "CMPPaymentData.h"
#import "CMPPaymentMethod.h"
@interface CMPWeChat : NSObject

// TODO: add descriptiondd
// TODO: instead of block use delegation because the final response is going to be handled in CMPWeChatManager and we need to get it from there.
- (void)startPaymentWithPaymentData:(CMPPaymentMethod *)paymentMethod success:(void (^)(NSData *data))onSuccess failure:(void (^)(NSError *error))onFailure;

@end
