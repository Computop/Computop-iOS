//
//  CMPPaymentParam.h
//  Pods
//
//  Created by Thomas Segkoulis on 24/03/17.
//
//

#import <Foundation/Foundation.h>

/**
 Is used to validate payment methon param values.
 */
typedef NS_ENUM(NSInteger, RegExPattern) {
    /** alpha numeric */
    alphanumericEx  = 0,
    /** numeric */
    numericEx,
    /** string */
    textEx,
    /** non */
    non
};


/**
 This class describes the payment method params.
 
 */

@interface CMPPaymentParam : NSObject

/**
 Parameter's name.
 
 */
@property (strong, nonatomic) NSString *key;

/**
 Parameter's value.
 
 */
@property (strong, nonatomic) NSString *value;

/**
 Parameter's requirement.
 
 */
@property (assign, nonatomic) BOOL isMandatory;

/**
 Parameter's type.
 
 */
@property (assign, nonatomic) RegExPattern type;

/**
 Parameter's value range. It is used for validation purposes.
 The location of the range is the minimum number of digits & the length is the maximum. 
 
 */
@property (assign, nonatomic) NSRange range;

/**
 If not nil, here are possible value options.
 */
@property (assign, nonatomic) NSArray* options;

/**
 Init method.
 
 @param dictionary A dictionary containing all parameter's data.
 @param key        Parameter's name.
 @param paramValidationArray An array containing all validation information for the parameter.
 
 @param instancetype
 
 */
- (instancetype)initWithDictionary:(NSDictionary*)dictionary
                           withKey:(NSString *)key
          withParamValidationArray:(NSArray *)paramValidationArray;

@end
