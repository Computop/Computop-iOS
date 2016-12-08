//
//  itemsController.h
//  Computop-demo
//
//  Created by Thomas Segkoulis on 24/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemsController : NSObject

@property (strong, nonatomic) NSMutableArray *selectedItems;
@property (strong, nonatomic) NSArray *totalItems;

+ (ItemsController *)sharedManager;

- (NSString *)totalItemsAmount;

@end
