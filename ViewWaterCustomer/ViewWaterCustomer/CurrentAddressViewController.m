//
//  CurrentAddressViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "CurrentAddressViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "AppDelegate.h"
@import GoogleMaps;
@import GooglePlaces;
@import GooglePlacePicker;
@interface CurrentAddressViewController ()

@end

@implementation CurrentAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   locationManager = [self initialiseLocationManager];
    [self loadAddressOnMapWithLocation];
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
-(void)loadAddressOnMapWithLocation
{
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];// CLLocationCoordinate2DMake(12.95366, 77.70292);;//

    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:coordinate.latitude
                                                            longitude:coordinate.longitude
                                                                 zoom:15];
    
    GMSMapView *mapView1 = [GMSMapView mapWithFrame:self.mapview.bounds camera:camera];
    
    mapView1.myLocationEnabled = YES;
    mapView1.settings.myLocationButton = true;
    [self.mapview addSubview: mapView1];
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position =CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView1;
    
}
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SelectTabDidSelect:(id)sender {
    UIButton *btn = (UIButton*)sender;
    [AppDelegate sharedAppDelegate].selectedTab = btn.tag;
    
    [[AppDelegate sharedAppDelegate] loginSucceddedForMobileNumber:@""];
}


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
        CGPoint locationPoint = [[touches anyObject] locationInView:self.mapview];
//        CGRect frame=[self.txtMobile frame];
//        CGRect frame2=[self.txtOTP frame];
        
        [self.view endEditing:YES];
        
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
      [textField resignFirstResponder];
        return YES;
}

@end
