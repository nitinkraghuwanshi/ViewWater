//
//  CurrentAddressViewController.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>
@interface CurrentAddressViewController : UIViewController<CLLocationManagerDelegate,UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}
@property (weak, nonatomic) IBOutlet UIView *mapview;

- (IBAction)SelectTabDidSelect:(id)sender;

@end
