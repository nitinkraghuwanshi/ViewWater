//
//  AppDelegate.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/27/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
//#import <GoogleMaps/GoogleMaps.h>
@import GoogleMaps;
@import GooglePlaces;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    int selectedTab;
    
}
@property (assign,nonatomic) BOOL callTabNext;
@property (assign,nonatomic) int selectedTab;
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) User *loginUser;


+(AppDelegate *)sharedAppDelegate;

- (void)loginSucceddedForMobileNumber:(NSString*)userMobile;
- (void)logoutSuccedded;
@end

