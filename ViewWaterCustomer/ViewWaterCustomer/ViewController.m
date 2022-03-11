//
//  ViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/27/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"


@interface ViewController ()

@end

@implementation ViewController
#pragma mark-
#pragma mark- API response parsing methods
-(void) parseResponseData:(NSDictionary*)responseData
{
    //success
    [[AppDelegate sharedAppDelegate] loginSucceddedForMobileNumber:self.txtMobile.text];
   
}

-(void) successOTPAPIResponse:(NSDictionary*)responseData
{
    
    
    //        [UIView animateWithDuration:0.3 animations:^{
    //            [self.txtOTP setHidden:![self.txtOTP isHidden]];
    //            [self.lblOTPmsg setHidden:![self.lblOTPmsg isHidden]];
    //
    //            [self.view layoutIfNeeded];
    //        }];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.btnSubmit setTitle:@"Verify OTP" forState:UIControlStateNormal];
        [self.txtOTP setHidden:![self.txtOTP isHidden]];
        [self.lblOTPmsg setHidden:![self.lblOTPmsg isHidden]];
    }];
    
}
#pragma mark- API methods
-(void) callForOTPApi
{
    [LoadingView showLoadingOnView:self.view];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration:defaultConfigObject];
    NSURL *dataURL = [NSURL URLWithString:@"http://www.aapkijugaad.com/api/login.php?uname=rahul&password=1234"];
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    [[delegateFreeSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response,
                                                NSError *error)
      {
            dispatch_async(dispatch_get_main_queue(), ^{
            
                
            [LoadingView hideLoadingFromView:self.view];
                
                
              if (!error) {
                 
                  id responseData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                  NSLog(@"Got Data %@.\n", responseData);
                  [self successOTPAPIResponse:responseData];
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
      }]resume];

}
-(void) loginOTPPostApi
{
    [LoadingView showLoadingOnView:self.view];
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
                
            [LoadingView hideLoadingFromView:self.view];
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


#pragma mark-
#pragma mark-View Controller Delegates
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 40)];
    self.txtMobile.leftView = paddingView;
    self.txtMobile.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 40)];
    self.txtOTP.leftView = paddingView1;
    self.txtOTP.leftViewMode = UITextFieldViewModeAlways;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
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

#pragma mark-keyboard nottification handlers
- (void)keyboardWillShow:(NSNotification *)notification {
    [UIView animateWithDuration:0.3f animations:^{
        
        CGRect rect=self.view.frame;
        rect.origin.y= -100;
        self.view.frame=rect;
    }];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView animateWithDuration:0.3f animations:^{
        
        CGRect rect=self.view.frame;
        rect.origin.y=0;
        self.view.frame=rect;
    }];
}
#pragma mark-Touch event
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if ([touches isKindOfClass:[NSSet class]]) {
        CGPoint locationPoint = [[touches anyObject] locationInView:self.view];
        CGRect frame=[self.txtMobile frame];
        CGRect frame2=[self.txtOTP frame];
    
        
        if(!(CGRectContainsPoint(frame,locationPoint)||CGRectContainsPoint(frame2,locationPoint)))
        {
            [self.view endEditing:YES];
        }
    }
}

#pragma mark-
#pragma mark-Text Field Delegate event

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.txtMobile)
    {
        [self.txtOTP becomeFirstResponder];
    }

    else
    {
        [textField resignFirstResponder];
    }
    return YES;
}
-(void)textFieldDidChange:(NSNotification *)notification
{
    UITextField *textField = (UITextField *) notification.object;
}


-(void)checkMobileValidation{
    [self callForOTPApi];
//    NSString *string = self.txtMobile.text;
//    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
//                               [NSCharacterSet whitespaceCharacterSet]];
//    
//    ([trimmedString length]>0)?[self callForOTPApi]:[self presentViewController:showAlertScreen(ALERT_TITTLE_APP_NAME, @"Please Enter Valid mobile number") animated:YES completion:nil];;
   
}
- (IBAction)submitDidSelect:(id)sender {
    
    
    [self.txtOTP isHidden]?[self checkMobileValidation]: [self loginOTPPostApi];

}




@end





















/*

- (void)loginOTPPostApi:(NSString*)url
{
    //    NSMutableDictionary *bodyDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
    //                                     @"rahul",@"uname",
    //                                     @"1234",@"password",nil];
    //
    //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:bodyDict options:NSJSONWritingPrettyPrinted error:nil];
    //    NSString *jsonString  = [[NSString alloc] initWithData:jsonData encoding:NSASCIIStringEncoding];
    //    jsonData = [jsonString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //    [request setHTTPMethod:@"POST"];
    //    [request setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        
        if (!error) {
            // Encodeing using ASCII as we getting some <br> tag which parser not able to parse.
            NSString *asciiString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSData*asciiData = [asciiString dataUsingEncoding:NSUTF8StringEncoding];
            id response = [NSJSONSerialization JSONObjectWithData:asciiData options:NSJSONReadingMutableContainers error:nil];
            
            [self requestDidFinish:response error:nil];
        }
        else
        {
            Reachability *reachability = [Reachability reachabilityForInternetConnection];
            NetworkStatus status = [reachability currentReachabilityStatus];
            if (status == NotReachable) {
                [self requestDidFinish:nil error:ALERT_NETWORK_ERROR_MESSAGE];
            }else{
                [self requestDidFinish:nil error:error.description ];//ALERT_MAINSERVER_ERROR_MESSAGE
            }
        }
    }];
}
-(void)requestDidFinish:(id)response error:(NSString*)errorStr
{
    if ([errorStr length]>0)
    {
        showAlertScreen(ALERT_TITTLE_ERROR, errorStr);
        [self.loadingView.indicatorView stopAnimating];
        [self.loadingView.indicatorView setHidden:YES];
    }
    else
    {
        //success
        [AppDelegate sharedAppDelegate].userMobile= self.txtMobile.text ;
        [[AppDelegate sharedAppDelegate] loginSuccedded];
        [self.loadingView.indicatorView stopAnimating];
        [self.loadingView.indicatorView setHidden:YES];
    }
    
}

 */
