//
//  EditProfileViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "EditProfileViewController.h"
#import "AppDelegate.h"
@import GoogleMaps;
@import GooglePlaces;
@import GooglePlacePicker;

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController
{
    GMSPlacesClient *_placesClient;
    GMSPlacePicker *_placePicker;
}

#pragma mark- API response parsing methods
-(void) parseResponseData:(NSDictionary*)responseData
{
    //showAlertScreen(ALERT_TITTLE_APP_NAME, [NSString stringWithFormat:@"responseData == %@",responseData]);
    
//    [AppDelegate sharedAppDelegate].userName= self.txtName.text ;
//    [AppDelegate sharedAppDelegate].userEmail= self.txtEmail.text ;
//    [AppDelegate sharedAppDelegate].userMobile= self.txtMobile.text ;
//    [AppDelegate sharedAppDelegate].userAddress= self.txtViewAddress.text ;
    
   
    [AppDelegate sharedAppDelegate].loginUser.name= self.txtName.text ;
    [AppDelegate sharedAppDelegate].loginUser.email= self.txtEmail.text ;
    [AppDelegate sharedAppDelegate].loginUser.mobile= self.txtMobile.text ;
    [AppDelegate sharedAppDelegate].loginUser.address= self.txtViewAddress.text ;
    
    

    
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark- API methods
-(void) saveProfileApi
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
    _placesClient = [GMSPlacesClient sharedClient];
    
    locationManager = [self initialiseLocationManager];
}
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    if ([[AppDelegate sharedAppDelegate].userAddress length]>0) {
//        [self.txtViewAddress setText:[AppDelegate sharedAppDelegate].userAddress];
//    }
//    
//}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.txtName.text=@"";
    self.txtEmail.text=@"";
    self.txtMobile.text=@"";
    self.txtViewAddress.text = @"Select Address on Map";
    
    if ([[AppDelegate sharedAppDelegate].loginUser.name length]>0) {
        [self.txtName setText:[AppDelegate sharedAppDelegate].loginUser.name];
    }
    if ([[AppDelegate sharedAppDelegate].loginUser.email length]>0) {
        [self.txtEmail setText:[AppDelegate sharedAppDelegate].loginUser.email];
    }
    if ([[AppDelegate sharedAppDelegate].loginUser.mobile length]>0) {
        [self.txtMobile setText:[AppDelegate sharedAppDelegate].loginUser.mobile];
    }
    if ([[AppDelegate sharedAppDelegate].loginUser.address length]>0) {
        [self.txtViewAddress setText:[AppDelegate sharedAppDelegate].loginUser.address];
    }
    

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

#pragma mark- CLLocationManager Method
-(CLLocationManager*)initialiseLocationManager{
    CLLocationManager *locManager = [[CLLocationManager alloc]init];
    locManager.delegate = self;
    locManager.distanceFilter = kCLDistanceFilterNone;
    locManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locManager startUpdatingLocation];
    //[self->locManager startUpdatingLocation];
   // [locationManager startMonitoringSignificantLocationChanges];
    
    return locManager;
}
#pragma mark- CLLocationManagerDelegate Method
// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager

     didUpdateLocations:(NSArray *)locations {
    
    // If it's a relatively recent event, turn off updates to save power.
    [locationManager stopUpdatingLocation];
    CLLocation* location = [locations lastObject];
    
    NSDate* eventDate = location.timestamp;
    
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          
          location.coordinate.latitude,
          
          location.coordinate.longitude);
//    if (fabs(howRecent) < 15.0) {
//        
//        // If the event is recent, do something with it.
//        
//        NSLog(@"latitude %+.6f, longitude %+.6f\n",
//              
//              location.coordinate.latitude,
//              
//              location.coordinate.longitude);
//        
//    }
    
}


- (IBAction)unwindToEditProfileViewController:(UIStoryboardSegue *)unwindSegue
{
}
-(void)showPlacePicker
{
    
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
//    NSString *latitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
//    NSString *longitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
//    NSLog(@"dLatitude : %@", latitude);
//    NSLog(@"dLongitude : %@",longitude);

    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(center.latitude + 0.001,
                                                                  center.longitude + 0.001);
    CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(center.latitude - 0.001,
                                                                  center.longitude - 0.001);
    GMSCoordinateBounds *viewport = [[GMSCoordinateBounds alloc] initWithCoordinate:northEast
                                                                         coordinate:southWest];
    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:viewport];
     _placePicker = [[GMSPlacePicker alloc] initWithConfig:config];
    
    [_placePicker pickPlaceWithCallback:^(GMSPlace *place, NSError *error) {
        if (error != nil) {
            NSLog(@"Pick Place error: %@", [error localizedDescription]);
            return;
        }
        
        if (place != nil) {
//            self.nameLabel.text = place.name;
            GMSCoordinateBounds *viewport1= place.viewport;
            CLLocationCoordinate2D northEast = viewport1.northEast;
            CLLocationCoordinate2D southWest = viewport1.southWest;
            
            [self.txtViewAddress setText:[[place.formattedAddress
                                           componentsSeparatedByString:@", "] componentsJoinedByString:@"\n"] ];
        } else {
//            self.nameLabel.text = @"No place selected";
            [self.txtViewAddress setText:@"No place selected"];
        }
    }];
}

// Add a UIButton in Interface Builder, and connect the action to this function.
- (IBAction)getCurrentPlace:(UIButton *)sender {
    [_placesClient currentPlaceWithCallback:^(GMSPlaceLikelihoodList *placeLikelihoodList, NSError *error){
        if (error != nil) {
            NSLog(@"Pick Place error %@", [error localizedDescription]);
            [self.txtViewAddress setText:[[[error localizedDescription]
                                           componentsSeparatedByString:@", "] componentsJoinedByString:@"\n"] ];
            return;
        }
        
        self.txtViewAddress.text = @"";
        
        if (placeLikelihoodList != nil) {
            GMSPlace *place = [[[placeLikelihoodList likelihoods] firstObject] place];
            if (place != nil) {
                [self.txtViewAddress setText:[[place.formattedAddress
                                               componentsSeparatedByString:@", "] componentsJoinedByString:@"\n"] ];
            } else {
                [self.txtViewAddress setText:@"No place selected"];
            }
        }
    }];
}

- (IBAction)pickerDidSelect:(id)sender {
    [self showPlacePicker];
    //[self getCurrentPlace:nil];
}

- (IBAction)saveProfile:(id)sender
{
    
    [self saveProfileApi];
//    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark-keyboard nottification handlers
- (void)keyboardWillShow:(NSNotification *)notification {
    [UIView animateWithDuration:0.3f animations:^{
        
//        CGRect rect=self.view.frame;
//        rect.origin.y=rect.origin.y-100;
//        self.view.frame=rect;
    }];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView animateWithDuration:0.3f animations:^{
        
//        CGRect rect=self.view.frame;
//        rect.origin.y= 0 ;//rect.origin.y+100;
//        self.view.frame=rect;
    }];
}
#pragma mark-Touch event
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if ([touches isKindOfClass:[NSSet class]]) {
        CGPoint locationPoint = [[touches anyObject] locationInView:self.view];
        CGRect frame=[self.txtMobile frame];
        CGRect frame2=[self.txtName frame];
        CGRect frame3=[self.txtEmail frame];
        
        if(!(CGRectContainsPoint(frame,locationPoint)||CGRectContainsPoint(frame2,locationPoint)|CGRectContainsPoint(frame3,locationPoint)))
        {
            [self.view endEditing:YES];
        }
    }
}

#pragma mark-
#pragma mark-Text Field Delegate event
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
       return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.txtName)
    {
        [self.txtEmail becomeFirstResponder];
    }
    else if (textField == self.txtEmail)
    {
        [self.txtMobile becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
        // [self btnSubmitSelect:nil];
    }
    return YES;
}


@end
