//
//  ProductOrderedCell.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/8/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductOrderedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UILabel *lblProductType;
@property (weak, nonatomic) IBOutlet UILabel *lblProductQuantity;
@property (weak, nonatomic) IBOutlet UITextField *txtPrductQuantity;
@property (weak, nonatomic) IBOutlet UIImageView *imgProductOrdered;

@end
