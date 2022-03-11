//
//  EditProfileViewController.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ViewWaterConstants.h"
#import "AppDelegate.h"
#import "Reachability.h"

@interface EditProfileViewController : UIViewController<CLLocationManagerDelegate,UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtMobile;
@property (weak, nonatomic) IBOutlet UITextView *txtViewAddress;

- (IBAction)pickerDidSelect:(id)sender;
- (IBAction)saveProfile:(id)sender;
@end
