//
//  ViewController.m
//  Computop-demo
//
//  Created by Thomas Segkoulis on 13/09/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import "PaymentViewController.h"
#import "PaymentMethodTableViewCell.h"
#import "ApplePayTableViewCell.h"
#import <Computop/Computop.h>
#import "ItemsController.h"
#import "ItemVO.h"

@interface PaymentViewController ()<CMPCheckoutViewControllerDelegate, CMPApplePayDelegate, ApplePayTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

// Payment methods
@property (strong, nonatomic) NSArray *paymentMethods;

// ApplePay shipping options

@property (strong, nonatomic) NSArray *applePayShippingOptions;
@property (strong, nonatomic) NSArray *applePayPKShippingOptions;

@property (assign, nonatomic) long selectedShipping;
@property (assign, nonatomic) PKAddressField selectedPKShipping;

// Helpers

@property (assign, nonatomic) BOOL isPaymentFinished;
@property (assign, nonatomic) NSError *paymentError;


/*
 * Computop
 */

/* Checkout */
@property (strong, nonatomic) CMPCheckout *checkout;

/* Apple Pay */
@property (strong, nonatomic) CMPApplePay *applePay;

 /* Payment Data */
@property (strong, nonatomic) CMPPaymentData *paymentData;

@end

@implementation PaymentViewController

#pragma mark - LifeCycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *dismissButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                   target:self
                                                                                   action:@selector(doDismissViewController:)];
    
    [self.navigationItem setLeftBarButtonItem:dismissButton];
    
    self.applePayShippingOptions   = [[NSArray alloc] initWithObjects: @"None", @"Postal Address", @"Phone", @"Email", @"Name", @"All", nil];

    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
    self.pickerView.delegate   = self;
    self.pickerView.dataSource = self;
    self.pickerView.hidden     = true;
    self.selectedShipping = 0;
    self.selectedPKShipping = PKAddressFieldNone;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"Select a payment method";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /**
     * Initialization of payment data
     *
     */
    
    self.paymentData = [[CMPPaymentData alloc] init];
    
    // Mandatory params
    self.paymentData.transID         = @"YOUR_TRANS_ID";
    self.paymentData.Amount          = [[ItemsController sharedManager] totalItemsAmount];
    self.paymentData.Currency        = @"CURRENCY";
    self.paymentData.URLSuccess      = @"YOUR_URL";
    self.paymentData.URLNotify       = @"YOUR_URL";
    self.paymentData.URLFailure      = @"YOUR_URL";
    self.paymentData.payID           = @"PAY_ID";
    
    // Optional params
    self.paymentData.RefNr           = @"YOUR_REFNR";
    self.paymentData.OrderDesc       = @"YOUR_OrderDesc";
    self.paymentData.AddrCity        = @"YOUR_AddrCity";
    self.paymentData.FirstName       = @"YOUR_FirstName";
    self.paymentData.LastName        = @"YOUR_LastName";
    self.paymentData.AddrZip         = @"YOUR_AddrZip";
    self.paymentData.AddrStreet      = @"YOUR_AddrStreet";
    self.paymentData.AddrState       = @"YOUR_AddrState";
    self.paymentData.AddrCountryCode = @"YOUR_AddrCountryCode";
    self.paymentData.Phone           = @"YOUR_Phone";
    self.paymentData.LandingPage     = @"YOUR_LandingPage";
    self.paymentData.eMail           = @"YOUR_eMail";
    self.paymentData.ShopID          = @"YOUR_ShopID";
    self.paymentData.Subject         = @"YOUR_Subject";
    
    
    /**
     * Initialization of Checkout
     *
     */
    self.checkout = [[CMPCheckout alloc] init];
    
    /**
     * Initialization of Apple Pay
     *
     */
    self.applePay = [[CMPApplePay alloc] init];
    self.applePay.delegate = self;
    
    [[Computop sharedInstance] paymentMethodsOnSuccess:^(NSArray<CMPPaymentMethod *> *paymentMethods) {
        
        self.paymentMethods = paymentMethods;
        [self.tableView reloadData];
        
    } onfailure:^(NSError *error) {
        
        self.paymentMethods = @[];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation -

- (void)doDismissViewController:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - CMPCheckoutViewControllerDelegate -

- (void)checkoutDidAuthorizePaymentForPaymentData:(id<CMPPaymentDataProtocol>)paymentData
{
    [[ItemsController sharedManager].selectedItems removeAllObjects];
    [self doDismissViewController:self];
}

- (void)checkoutDidFailToAuthorizePaymentForPaymentData:(id<CMPPaymentDataProtocol>)paymentData withError:(NSError *)error
{
    [self presentAlertWithDescription:error.localizedDescription];
}

#pragma mark - CMPApplePayDelegate -

- (void)applePayDidDismiss
{
    if(self.isPaymentFinished)
    {
        if(self.paymentError != nil)
        {
            [self presentAlertWithDescription:self.paymentError.localizedDescription];
        }
        else
        {
            [[ItemsController sharedManager].selectedItems removeAllObjects];
            [self doDismissViewController:self];
        }
    }
}

- (void)applePayDidAuthorizePaymentForPaymentData:(id<CMPPaymentDataProtocol>)paymentData
{
    [[ItemsController sharedManager].selectedItems removeAllObjects];
    
    self.isPaymentFinished = true;
    self.paymentError      = nil;
}

- (void)applePayDidFailToAuthorizePaymentForPaymentData:(id<CMPPaymentDataProtocol>)paymentData withError:(NSError *)error
{
    [self presentAlertWithDescription:error.localizedDescription];
    
    self.isPaymentFinished = true;
    self.paymentError      = error;
}

- (void)applePayPaymentDidSelectPaymentMethod:(PKPaymentMethod *)paymentMethod completion:(void (^)(NSArray<PKPaymentSummaryItem *> *))completion
{

    switch (paymentMethod.type) {
        case PKPaymentMethodTypeCredit:
        {
            ItemVO *discountItem = [[ItemVO alloc] initWithDescr:@"discount" withAmount:-500 withImg:nil];
            
            NSMutableArray *selectedSummaryItems = [[NSMutableArray alloc] initWithArray:[[ItemsController sharedManager].selectedItems copy]];
            [selectedSummaryItems addObject:discountItem];
            
            NSArray *finalPaymentSummaryItems = [self paymentSummaryItemsForItems:[selectedSummaryItems copy]];
            
            completion(finalPaymentSummaryItems);
        }
            break;
            
        case PKPaymentMethodTypeDebit:
        {
            ItemVO *extraItem = [[ItemVO alloc] initWithDescr:@"extra" withAmount:300 withImg:nil];
            
            NSMutableArray *selectedSummaryItems = [[NSMutableArray alloc] initWithArray:[[ItemsController sharedManager].selectedItems copy]];
            [selectedSummaryItems addObject:extraItem];
            
            NSArray *finalPaymentSummaryItems = [self paymentSummaryItemsForItems:[selectedSummaryItems copy]];
            
            completion(finalPaymentSummaryItems);
        }
            break;
            
        default:
            completion(@[]);

            break;
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate -

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if((indexPath.row == [self numberOfPaymentMethods] - 1))
    {
       ApplePayTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ApplePayTableViewCell" forIndexPath:indexPath];
        
        cell.shippingLabel.text = [NSString stringWithFormat:@"shipping address fields - %@", [self.applePayShippingOptions objectAtIndex:self.selectedShipping]];
        
        cell.delegate = self;
        
        return cell;
    }
    else
    {
        PaymentMethodTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"PaymentMethodTableViewCell" forIndexPath:indexPath];
        
        CMPPaymentMethod *paymentMethod = [[self paymentMethods] objectAtIndex:indexPath.row];
        
        cell.labelTitle.text = paymentMethod.pmID;
        [cell.paymentImageView setImage:[UIImage imageNamed:paymentMethod.imageStr]];
        
        return cell;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfPaymentMethods];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if((indexPath.row == [self numberOfPaymentMethods] - 1))
    {
        return 80;
    }
    
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMPPaymentMethod *paymentMethod = [[self paymentMethods] objectAtIndex:indexPath.row];

    if((indexPath.row != [self numberOfPaymentMethods] - 1))
    {
        
        [self.checkout instantiateCheckoutViewControllerWithPaymentData:self.paymentData
                                                      withPaymentMethod:paymentMethod
                                                              onSuccess:^(CMPCheckoutViewController *checkoutViewController) {
                                                        
                                                    checkoutViewController.delegate = self;
                                                        
                                                    [self.navigationController pushViewController:checkoutViewController animated:true];
                                                        
                                                }
                                                              onFailure:^(NSError *error) {
                                                                     
                                                                    [self presentAlertWithDescription:error.localizedDescription];

        }];
    }
}

#pragma mark - Button Interaction -

- (void)onApplePay
{
    NSArray *supportedNetworks = @[PKPaymentNetworkVisa, PKPaymentNetworkMasterCard, PKPaymentNetworkAmex, PKPaymentNetworkDiscover];
        
    if( [self.applePay canMakePaymentsForSupportedNetworks:supportedNetworks])
    {
        [self.applePay instantiatePKPaymentAuthorizationViewControllerWithPaymentData:self.paymentData
                                                              withPaymentSummaryItems:[self paymentSummaryItemsForItems:[[ItemsController sharedManager].selectedItems copy]]
                                                                withSupportedNetworks:supportedNetworks
                                                    withRequiredShippingAddressFields:self.selectedPKShipping
                                                   paymentAuthorizationViewController:^(PKPaymentAuthorizationViewController *applePayViewController) {
                                                       
                                                       [self presentViewController:applePayViewController
                                                                          animated:true
                                                                        completion:nil];
                                                       
                                                   } onFailure:^(NSError *error) {
                                                       
                                                       [self presentAlertWithDescription:error.localizedDescription];
                                                       
                                                   }];

    }
    else
    {
        
    }
}

- (void)onShipping
{
    self.pickerView.hidden = false;
    self.tableView.userInteractionEnabled = false;
}

#pragma mark - Datasource -

- (NSInteger)numberOfPaymentMethods
{
    return [self.paymentMethods count] + 1;
}

- (NSArray<PKPaymentSummaryItem *> *)paymentSummaryItemsForItems:(NSArray *)paymentItems
{
    if( !((paymentItems != nil) && (paymentItems.count > 0)) )
    {
        PKPaymentSummaryItem *totalPKPaymentSummaryItem = [[PKPaymentSummaryItem alloc] init];
        
        totalPKPaymentSummaryItem.label  = self.paymentData.OrderDesc;
        totalPKPaymentSummaryItem.amount =  [[NSDecimalNumber alloc] initWithString:self.paymentData.Amount];
        
        return @[totalPKPaymentSummaryItem];
    }
    
    NSMutableArray *summaryItems = [[NSMutableArray alloc] init];
    NSDecimalNumber *totalAmount = [[NSDecimalNumber alloc] initWithInt:0];
    
    for(ItemVO *item in paymentItems)
    {
        PKPaymentSummaryItem *pkPaymentSummaryItem = [[PKPaymentSummaryItem alloc] init];
        
        pkPaymentSummaryItem.label  = item.desc;
        
        NSDecimalNumber *majorCurrencyAmount = [NSDecimalNumber decimalNumberWithMantissa:[item.amount longLongValue] exponent:-2 isNegative:NO];
        
        pkPaymentSummaryItem.amount = majorCurrencyAmount;
        
        totalAmount = [totalAmount decimalNumberByAdding:majorCurrencyAmount];
        
        [summaryItems addObject:pkPaymentSummaryItem];
    }
    
    PKPaymentSummaryItem *totalPKPaymentSummaryItem = [[PKPaymentSummaryItem alloc] init];
    
    totalPKPaymentSummaryItem.label  = @"Total";
    totalPKPaymentSummaryItem.amount = totalAmount;
    
    [summaryItems addObject:totalPKPaymentSummaryItem];
    
    return [summaryItems copy];
}

#pragma mark - Validation error -

- (void)presentAlertWithDescription:(NSString *)description
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:nil
                                          message:description
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self doDismissViewController:self];
                               }];
    
    [alertController addAction:okAction];
    
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [self presentViewController:alertController
                           animated:true
                         completion:nil];

    });
    
}

#pragma mark - UIPickerViewDelegate -

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.pickerView.hidden = true;
    self.tableView.userInteractionEnabled = true;
    self.selectedShipping = row;
    
    if(row == 0)
    {
        self.selectedPKShipping = PKAddressFieldNone;
    }
    else if(row == 1)
    {
        self.selectedPKShipping = PKAddressFieldPostalAddress;
    }
    else if(row == 2)
    {
        self.selectedPKShipping = PKAddressFieldPhone;
    }
    else if(row == 3)
    {
        self.selectedPKShipping = PKAddressFieldEmail;
    }
    else if(row == 4)
    {
        self.selectedPKShipping = PKAddressFieldName;
    }
    else if(row == 5)
    {
        self.selectedPKShipping = PKAddressFieldAll;
    }
    else
    {
        self.selectedPKShipping = PKAddressFieldNone;
    }
    
    [self.tableView reloadData];
}

#pragma mark - UIPickerViewDataSource -

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.applePayShippingOptions count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return  [self.applePayShippingOptions objectAtIndex:row];
}


@end
