//
//  CMPPaymentRespose.h
//  Computop
//
//  Created by Thomas Segkoulis on 06/02/17.
//  Copyright © 2017 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMPPaymentRespose : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *payID;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *transID;
@property (nonatomic, strong) NSString *prepayid;
@property (nonatomic, strong) NSString *XID;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *refnr;
@property (nonatomic, strong) NSString *MAC;
@property (nonatomic, strong) NSString *type;


- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
