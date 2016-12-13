//
//  CMPPaymentMethod.h
//  Computop
//
//  Created by Thomas Segkoulis on 12/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMPPaymentMethodProtocol.h"

/**
 CMPPaymentMethod
 
 The CMPPaymentMethod class constitutes the model that contains all the data for a Payment method.
 
 */
@interface CMPPaymentMethod : NSObject <CMPPaymentMethodProtocol>

/**
 Payment method id.
 */
@property (nonatomic, strong) NSString *pmID;

/**
 Payment method url.
 */
@property (nonatomic, strong) NSString *url;

/**
 Payment method image string.
 */
@property (nonatomic, strong) NSString *imageStr;

/**
 Payment method template string.
 */
@property (nonatomic, strong) NSString *templateStr;


- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
