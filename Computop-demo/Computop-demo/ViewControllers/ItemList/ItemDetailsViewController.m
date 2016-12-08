//
//  ItemDetailsViewController.m
//  Computop-demo
//
//  Created by Thomas Segkoulis on 24/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import "ItemDetailsViewController.h"
#import "PaymentViewController.h"
#import "ItemTableViewCell.h"
#import "ItemsController.h"
#import "ItemVO.h"

@interface ItemDetailsViewController()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *buyButton;
@property (strong, nonatomic) IBOutlet UILabel *emptyCartLabel;

@end

@implementation ItemDetailsViewController

#pragma mark - LifeCycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
    self.title = @"Cart";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)updateBuyButton
{
    self.buyButton.hidden = [ItemsController sharedManager].selectedItems.count > 0 ? false: true;
}

#pragma mark - Datasource changed

- (void)updateUI
{
    [self.tableView reloadData];
    [self updateBuyButton];
    
    self.tableView.hidden = [ItemsController sharedManager].selectedItems.count > 0 ? false: true;
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate -

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ItemTableViewCell" forIndexPath:indexPath];
    
    ItemVO *item = [[ItemsController sharedManager].selectedItems objectAtIndex:indexPath.row];
    
    cell.itemTitle.text  = item.desc;
    cell.itemDetail.text = [item majorCurrencyAmount];
    [cell.itemImage setImage:[UIImage imageNamed:item.imgStr]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ItemsController sharedManager].selectedItems.count;
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

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    [[ItemsController sharedManager].selectedItems removeObjectAtIndex:indexPath.row];
    
    [self updateUI];
}

#pragma mark - onBuy -

- (IBAction)onBuy:(id)sender
{
//    PaymentViewController *paymentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PaymentViewController"];

//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:paymentViewController];
//
    UINavigationController *paymentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PaymentNavigationController"];
    
    [self.tabBarController presentViewController:paymentViewController animated:true completion:nil];
}


@end
