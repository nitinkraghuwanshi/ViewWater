//
//  OrderListCell.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/9/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblCustomerName;
@property (weak, nonatomic) IBOutlet UILabel *lblOrderedDate;
@property (weak, nonatomic) IBOutlet UILabel *lblCustomerAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblPaymentMode;
@property (weak, nonatomic) IBOutlet UILabel *lblDeliveryStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblOrderId;
@property (weak, nonatomic) IBOutlet UILabel *lblProductQuantity;

@end
