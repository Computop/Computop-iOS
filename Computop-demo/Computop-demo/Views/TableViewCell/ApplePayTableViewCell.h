//
//  ApplePayTableViewCell.h
//  Computop-demo
//
//  Created by Thomas Segkoulis on 25/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PassKit/PassKit.h>

@protocol ApplePayTableViewCellDelegate

@required

- (void)onApplePay;
- (void)onShipping;

@end

@interface ApplePayTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet PKPaymentButton *payButton;
@property (strong, nonatomic) IBOutlet UIButton *shippingButton;
@property (strong, nonatomic) IBOutlet UILabel *shippingLabel;

@property (nonatomic, weak) id <ApplePayTableViewCellDelegate> delegate;

@end
