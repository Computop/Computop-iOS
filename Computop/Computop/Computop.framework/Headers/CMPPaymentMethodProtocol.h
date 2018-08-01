//
//  CMPPaymentMethodProtocol.h
//  Computop
//
//  Created by Thomas Segkoulis on 12/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 CMPPaymentMethodProtocol
 
 Protocol that defines all payment method data.
 
 */
@protocol CMPPaymentMethodProtocol

@required

/**
 Payment method id.
 */
@property (nonatomic, strong, readonly) NSString *pmID;

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


- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@optional

@end
