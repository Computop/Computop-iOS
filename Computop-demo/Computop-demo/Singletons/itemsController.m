//
//  itemsController.m
//  Computop-demo
//
//  Created by Thomas Segkoulis on 24/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import "ItemsController.h"
#import "ItemVO.h"

@interface ItemsController()

@end

@implementation ItemsController

#pragma mark - Singleton -

+ (id)sharedManager
{
    static ItemsController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

#pragma mark - LifeCycle -

- (id)init
{
    if (self = [super init])
    {
        self.totalItems = [[NSArray alloc] initWithObjects:[[ItemVO alloc] initWithDescr:@"Pretzel" withAmount:340 withImg:@"pretzelImg"],
                                                           [[ItemVO alloc] initWithDescr:@"Wurst" withAmount:300 withImg:@"wurstImg"],
                                                           [[ItemVO alloc] initWithDescr:@"Hat" withAmount:3200 withImg:@"hatImg"],
                                                           [[ItemVO alloc] initWithDescr:@"Duplo" withAmount:200 withImg:@"duploImg"],
                                                           [[ItemVO alloc] initWithDescr:@"Hanuta" withAmount:150 withImg:@"hanutaImg"],nil];
        
        self.selectedItems = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Total Amount -

- (NSString *)totalItemsAmount
{
    NSNumber *sum = [[NSNumber alloc] initWithLongLong:0.0];
    
    for(ItemVO *item in [self.selectedItems copy])
    {
        sum = [NSNumber numberWithLongLong:([sum longLongValue] + [item.amount longLongValue])];
        
    }
    
    return [sum stringValue];
}

@end
