//
//  ItemTableViewCell.h
//  Computop-demo
//
//  Created by Thomas Segkoulis on 24/10/16.
//  Copyright © 2016 Exozet Berlin GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet UILabel *itemDetail;

@end
