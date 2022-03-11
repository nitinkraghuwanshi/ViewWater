//
//  ProfileViewController.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewWaterConstants.h"
#import "AppDelegate.h"
#import "Reachability.h"
@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnMobile;
@property (weak, nonatomic) IBOutlet UITextView *txtViewAddress;
- (IBAction)LogoutDidSelected:(id)sender;

@end
