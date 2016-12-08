//
//  ItemVO.h
//  Computop-demo
//
//  Created by Thomas Segkoulis on 24/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemVO : NSObject

@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSNumber* amount;
@property (strong, nonatomic) NSString *imgStr;

- (id) initWithDescr:(NSString *)desc withAmount:(unsigned long)amount withImg:(NSString *)imgStr;

- (NSString *)majorCurrencyAmount;

@end
