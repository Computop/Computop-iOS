//
//  ItemListViewController.m
//  Computop-demo
//
//  Created by Thomas Segkoulis on 24/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import "ItemListViewController.h"
#import "ItemTableViewCell.h"
#import "ItemsController.h"
#import "ItemVO.h"

@interface ItemListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ItemListViewController

#pragma mark - LifeCycle -

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.title = @"Items";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate -

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ItemTableViewCell" forIndexPath:indexPath];

    ItemVO *item = [[ItemsController sharedManager].totalItems objectAtIndex:indexPath.row];
    
    cell.itemTitle.text  = item.desc;
    cell.itemDetail.text = [item majorCurrencyAmount];
    [cell.itemImage setImage:[UIImage imageNamed:item.imgStr]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ItemsController sharedManager].totalItems.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemVO *item = [[ItemsController sharedManager].totalItems objectAtIndex:indexPath.row];
    ItemTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(![[ItemsController sharedManager].selectedItems containsObject:item])
    {
        CGPoint endPoint = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 100);
        endPoint = [cell.contentView convertPoint:endPoint fromView:self.view];
        CGPoint centerPoint = [cell.contentView convertPoint:self.view.center fromView:self.view];
        
        CGPoint p1 = centerPoint;
        p1.y -= 100;
        
        CGPoint p2 = centerPoint;
        p2.x += 110;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:cell.imageView.center];
        //[path moveToPoint:centerPoint];
        //[path moveToPoint:endPoint];
        [path addCurveToPoint:endPoint controlPoint1:p1 controlPoint2:p2];
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        anim.keyPath = @"position";
        anim.path = path.CGPath;
        anim.duration = 0.5;
        //    orbit.repeatCount = HUGE_VALF;
        anim.calculationMode = kCAAnimationPaced;
        //    orbit.rotationMode = kCAAnimationRotateAuto;
        
        anim.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
        
        [cell.itemImage.layer addAnimation:anim forKey:@"move"];
        
        [[ItemsController sharedManager].selectedItems addObject:item];
    }
}

@end
