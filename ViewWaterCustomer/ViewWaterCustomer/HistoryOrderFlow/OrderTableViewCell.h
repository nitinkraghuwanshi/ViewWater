//
//  OrderTableViewCell.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/8/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblOrderid;
@property (weak, nonatomic) IBOutlet UILabel *lblOrderDate;
@property (weak, nonatomic) IBOutlet UILabel *OrderStatus;
@property (weak, nonatomic) IBOutlet UIImageView *imgOrder;

@end
