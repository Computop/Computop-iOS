//
//  ApplePayTableViewCell.m
//  Computop-demo
//
//  Created by Thomas Segkoulis on 25/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import "ApplePayTableViewCell.h"

@implementation ApplePayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.shippingButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)onApplePayButton:(id)sender
{
    [self.delegate onApplePay];
}

- (IBAction)onShippingButton:(id)sender
{
    [self.delegate onShipping];
}

@end
