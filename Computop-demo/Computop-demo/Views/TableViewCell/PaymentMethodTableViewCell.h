//
//  PaymentMethodTableViewCell.h
//  Computop-demo
//
//  Created by Thomas Segkoulis on 25/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentMethodTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UIImageView *paymentImageView;

@end
