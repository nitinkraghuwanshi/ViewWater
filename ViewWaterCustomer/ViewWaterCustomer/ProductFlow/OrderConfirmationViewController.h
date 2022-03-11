//
//  OrderConfirmationViewController.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProductListViewController.h"

@interface OrderConfirmationViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *lbladdress;

@property (weak, nonatomic) IBOutlet UIImageView *imgOrder;

@property (weak, nonatomic) IBOutlet UIButton *btnDeliveryAddress;
@property (weak, nonatomic) IBOutlet UIButton *btnPayOnline;
@property (weak, nonatomic) IBOutlet UIButton *btnCOD;

- (IBAction)BackButtonDidSelect:(id)sender;

@end
