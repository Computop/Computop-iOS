//
//  CMPPaymentDataProtocol.h
//  Computop
//
//  Created by Thomas Segkoulis on 08/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMPPaymentParam.h"

/**
 CMPPaymentDataProtocol
 
 Protocol that defines all payment data.
 
 */
@protocol CMPPaymentDataProtocol

@required

@property (nonatomic, strong, readonly) NSDictionary *dataThatNeedsToBeValidated;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
     withParamValidationDictionary:(NSDictionary *)paramValidationDictionary;
- (CMPPaymentParam *)paymentParamWithKey:(NSString *)key;
- (void)setParamWithKey:(NSString *)key withValue:(NSString *)value;

@end
