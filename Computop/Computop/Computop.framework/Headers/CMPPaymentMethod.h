//
//  CMPPaymentMethod.h
//  Computop
//
//  Created by Thomas Segkoulis on 12/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMPPaymentMethodProtocol.h"
#import "CMPPaymentData.h"
#import <UIKit/UIKit.h>

/**
 CMPPaymentMethod
 
 The CMPPaymentMethod class constitutes the model that contains all the data for a Payment method.
 
 */
@interface CMPPaymentMethod : NSObject <CMPPaymentMethodProtocol>

/**
 Payment method id.
 */
@property (nonatomic, strong, readonly) NSString *pmID;

/**
 Payment method localized description.
 */
@property (nonatomic, strong, readonly) NSString *localizedDescription;

/**
 Payment method url.
 */
@property (nonatomic, strong, readonly) NSString *url;

/**
 Payment method image.
 */
@property (nonatomic, strong, readonly) UIImage *image;

/**
 Payment method template string.
 */
@property (nonatomic, strong, readonly) NSString *templateStr;

/**
 Payment data
 */
@property (nonatomic, strong, readonly) CMPPaymentData *paymentData;

/**
 Init method.
 
 @param dictionary A dictionary containing all payment method's data.
 @param paramValidationDictionary A dictionary containing all validation information for the parameters.
 
 @param instancetype
 
 */
- (instancetype)initWithDictionary:(NSDictionary*)dictionary
     withParamValidationDictionary:(NSDictionary *)paramValidationDictionary;

@end
