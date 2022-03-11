//
//  AddressViewController.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/1/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

- (IBAction)getCurrentPlace:(UIButton *)sender ;
- (IBAction)pickPlace:(UIButton *)sender;
@end
