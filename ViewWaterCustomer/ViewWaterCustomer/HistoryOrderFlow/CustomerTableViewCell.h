//
//  CustomerTableViewCell.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/8/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblCustomerName;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblCustomerContact;
@property (weak, nonatomic) IBOutlet UIImageView *imgCustomer;

@end
