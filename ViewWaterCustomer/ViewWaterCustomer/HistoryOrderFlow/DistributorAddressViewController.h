//
//  DistributorAddressViewController.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/10/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface DistributorAddressViewController :UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}
@end
