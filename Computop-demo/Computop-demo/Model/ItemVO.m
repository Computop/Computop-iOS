//
//  ItemVO.m
//  Computop-demo
//
//  Created by Thomas Segkoulis on 24/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import "ItemVO.h"

@implementation ItemVO

- (id) initWithDescr:(NSString *)desc withAmount:(unsigned long)amount withImg:(NSString *)imgStr
{
    self = [super init];
    
    if( !self ) return nil;
    
    self.desc   = desc;
    self.amount = [NSNumber numberWithLongLong:amount];
    self.imgStr = imgStr;
    
    return self;
}

- (NSString *)majorCurrencyAmount
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    NSDecimalNumber *majorCurrencyAmount = [NSDecimalNumber decimalNumberWithMantissa:[self.amount longLongValue] exponent:-2 isNegative:NO];
    
    NSString *finalAmount = [numberFormatter stringFromNumber:majorCurrencyAmount];

    return finalAmount;
}

@end
