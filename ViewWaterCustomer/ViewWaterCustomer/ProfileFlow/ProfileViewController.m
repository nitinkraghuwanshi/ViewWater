//
//  ProfileViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
#pragma mark- API response parsing methods
-(void) parseResponseData:(NSDictionary*)responseData
{
    showAlertScreen(ALERT_TITTLE_APP_NAME, [NSString stringWithFormat:@"responseData == %@",responseData]);
}
#pragma mark- API methods
-(void) getUserProfileApi
{
    NSLog(@"main thread? ANS - %@",[NSThread isMainThread]? @"YES":@"NO");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //    NSString *cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"/nsurlsessiondemo.cache"];
    //    NSURLCache *myCache = [[NSURLCache alloc] initWithMemoryCapacity: 16384 diskCapacity: 268435456 diskPath: cachePath];
    //    defaultConfigObject.URLCache = myCache;
    //    defaultConfigObject.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    //    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject                                                      delegate: nil  delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration:defaultConfigObject];
    NSURL *dataURL = [NSURL URLWithString:@"http://www.aapkijugaad.com/api/login.php?uname=rahul&password=1234"];
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    [[delegateFreeSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response,
                                                NSError *error)
      {
          dispatch_async(dispatch_get_main_queue(), ^{
              if (!error) {
                  // Encodeing using ASCII as we getting some <br> tag which parser not able to parse.
                  //              NSString *asciiString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                  //              NSData*asciiData = [asciiString dataUsingEncoding:NSUTF8StringEncoding];
                  //              id response = [NSJSONSerialization JSONObjectWithData:asciiData options:NSJSONReadingMutableContainers error:nil];
                  id responseData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                  NSLog(@"Got Data %@.\n", responseData);
                  [self parseResponseData:responseData];
              }
              else
              {
                  Reachability *reachability = [Reachability reachabilityForInternetConnection];
                  NetworkStatus status = [reachability currentReachabilityStatus];
                  if (status == NotReachable) {
                      
                      NSLog(@"Got response %@ with error %@.\n", response, error);
                      showAlertScreen(ALERT_TITTLE_ERROR, ALERT_NETWORK_ERROR_MESSAGE);
                  }else{
                      
                      showAlertScreen(ALERT_TITTLE_ERROR, error.description);//ALERT_MAINSERVER_ERROR_MESSAGE
                      
                  }
              }
          });
          
          
      }
      ]resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getUserProfileApi];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.lblName.text=@"UserName";
    self.lblEmail.text=@"User Email";
    [self.btnMobile setTitle:@"" forState:UIControlStateNormal];
    self.txtViewAddress.text = @"Select Address on Map";
    if ([[AppDelegate sharedAppDelegate].loginUser.name length]>0) {
        [self.lblName setText:[AppDelegate sharedAppDelegate].loginUser.name];
    }
    if ([[AppDelegate sharedAppDelegate].loginUser.email length]>0) {
        [self.lblEmail setText:[AppDelegate sharedAppDelegate].loginUser.email];
    }
    if ([[AppDelegate sharedAppDelegate].loginUser.mobile length]>0) {
        [self.btnMobile setTitle:[AppDelegate sharedAppDelegate].loginUser.mobile forState:UIControlStateNormal];
    }
    if ([[AppDelegate sharedAppDelegate].loginUser.address length]>0) {
        [self.txtViewAddress setText:[AppDelegate sharedAppDelegate].loginUser.address];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)unwindToProfileViewController:(UIStoryboardSegue *)unwindSegue
{
}
- (IBAction)LogoutDidSelected:(id)sender {
    [[AppDelegate sharedAppDelegate] logoutSuccedded];
}
@end
