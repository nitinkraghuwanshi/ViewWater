//
//  AppDelegate.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/27/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewWaterConstants.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize loginUser;
+(AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - User Defined  Methods
- (void)showMainRootController
{
    if (!self.callTabNext) {
        self.callTabNext=true;
        UIViewController *loginNav=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]  instantiateViewControllerWithIdentifier:@"CurrentAddressView"];
        [AppDelegate sharedAppDelegate].window.rootViewController = loginNav;
    }
   else
   {
       [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
       UITabBarController *homeTabBar=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeTab"];
       homeTabBar.selectedIndex=self.selectedTab;//?self.selectedTab:0;
       [AppDelegate sharedAppDelegate].window.rootViewController = homeTabBar;
   }
   
}
- (void)loadLoginViewController
{
    UINavigationController *loginNav=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]  instantiateViewControllerWithIdentifier:@"MobileOTP"];
    [AppDelegate sharedAppDelegate].window.rootViewController = loginNav;
}
- (void)loadRootController
{
    //[self showMainRootController];
    
    NSString *sPath = [DOCUMENTS_FOLDER stringByAppendingPathComponent:@"user_data.xml"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:sPath])
    {
        self.loginUser = [NSKeyedUnarchiver unarchiveObjectWithFile:sPath];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.loginUser.mobile forKey:@"userMobile"];
        [self showMainRootController];
    }
    else
    {
        [self loadLoginViewController];
        
    }
}
- (void)loginSucceddedForMobileNumber:(NSString*)userMobile
{
    if (self.loginUser==nil) {
        self.loginUser = [[User alloc]init];
    }

    self.loginUser.mobile = userMobile;
    [self.loginUser saveUserInformation];
    [self loadRootController];//showMainRootController
    
}
- (void)logoutSuccedded
{
   self.callTabNext=false;
    NSString *sPath = [DOCUMENTS_FOLDER stringByAppendingPathComponent:@"user_data.xml"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:sPath])
    {
        [fileManager removeItemAtPath:sPath error:NULL];
    }

    self.loginUser= nil;
    [self loadLoginViewController];
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [GMSServices provideAPIKey:@"AIzaSyDG3iEnvPCX-nUAkWxjV8QJfmUK7lpmHf0"];
//    [GMSPlacesClient provideAPIKey:@"AIzaSyDG3iEnvPCX-nUAkWxjV8QJfmUK7lpmHf0"];
    [GMSServices provideAPIKey:@"AIzaSyDptD58nsMppVcHNDGcJoez2t8Xz7gzhqo"];
    [GMSPlacesClient provideAPIKey:@"AIzaSyDptD58nsMppVcHNDGcJoez2t8Xz7gzhqo"];
    
   
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
