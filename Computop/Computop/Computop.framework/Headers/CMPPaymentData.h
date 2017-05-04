//
//  CMPPaymentData.h
//  Computop
//
//  Created by Thomas Segkoulis on 09/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMPPaymentDataProtocol.h"
#import "CMPPaymentParam.h"

/**
 CMPPaymentData
 
 The CMPPaymentData class constitutes the model that contains all the, inserted by the User, Payment data.
 
 */
@interface CMPPaymentData : NSObject <CMPPaymentDataProtocol>

/**
 Dictionary containing all payment data, with parameter name as key and CMPPaymentParam object as value.
 
 */
@property (nonatomic, strong, readonly) NSDictionary *data;

/**
 Init method.
 
 @param dictionary  The 'dataElements' dictionary as fetched from JSON.
 @param paramValidationDictionary The dictionary containing all validation information for all payment data parameters.
 
  @param instancetype
 
 */
- (instancetype)initWithDictionary:(NSDictionary*)dictionary
     withParamValidationDictionary:(NSDictionary *)paramValidationDictionary;

/**
 Returns a payment data parameter's value given its key.
 
 @param key The name of payment data parameter.
 
 @return A CMPPaymentParam object.
 
 */
- (CMPPaymentParam *)paymentParamWithKey:(NSString *)key;

/**
 Sets a payment data parameter in the dictionary.
 
 @param key The name of payment data parameter.
 @param value  The value for the payment data parameter.
  
 */
- (void)setParamWithKey:(NSString *)key withValue:(NSString *)value;

@end
