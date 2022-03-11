//
//  ViewController.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/27/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewWaterConstants.h"
#import "LoadingView.h"

@interface ViewController : UIViewController




@property (weak, nonatomic) IBOutlet UILabel *lblOTPmsg;
@property (weak, nonatomic) IBOutlet UITextField *txtMobile;
@property (weak, nonatomic) IBOutlet UITextField *txtOTP;

@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;

- (IBAction)submitDidSelect:(id)sender;
@end

