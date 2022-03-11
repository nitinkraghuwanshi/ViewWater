//
//  DistributorAddressViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/10/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "DistributorAddressViewController.h"

@interface DistributorAddressViewController ()

@end

@implementation DistributorAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadAddressOnMapWithLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadAddressOnMapWithLocation
{
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:12.95366
                                                            longitude:77.70292
                                                                 zoom:6];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(12.95366, 77.70292);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
