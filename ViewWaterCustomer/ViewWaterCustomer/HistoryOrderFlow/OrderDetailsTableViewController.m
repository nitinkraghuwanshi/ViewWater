//
//  OrderDetailsTableViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/8/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "OrderDetailsTableViewController.h"
#import <GoogleMaps/GoogleMaps.h>

//@import GoogleMaps;
@interface OrderDetailsTableViewController ()

@end

@implementation OrderDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView setEstimatedRowHeight:130];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    //    switch (indexPath.row) {
//    //        case 0:
//    //        {
//    //
//    //            return 130;
//    //        }
//    //        case 1:
//    //        {
//    //
//    //            return 130;
//    //        }
//    //
//    //            break;
//    //        case 2:
//    //        {
//    //
//    //            return 130;
//    //        }
//    //        case 3:
//    //        {
//    //
//    //            return 130;
//    //        }
//    //
//    //
//    //            break;
//    //
//    //        default:
//    //        {
//    //
//    //            return 130;
//    //
//    //        }
//    
//    return 130;
//    
//    
//}

-(NSString*)getSectionHeaderForSection:(NSInteger)section
{
    NSString *headerStr;
    switch (section) {
        case 0:
        {
            
            headerStr = @"Order";
            break;
        }
        case 1:
        {
            headerStr = @"Customer";
        }
            
            break;
        case 2:
        {
            headerStr = @"Distributor";
            break;
        }
        case 3:
        {
            headerStr = @"Product Ordered";
        }
            break;
            
        default:
        {
            headerStr = @"";
        }
            break;
    }
    return headerStr;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    NSString *cellIdentifier;
    cellIdentifier = @"cellHeader";
    SectionHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    [cell.lblSectionTitle setText:[self getSectionHeaderForSection:section]];

    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
        switch (section) {
            case 0:
            {
    
                return 1;
            }
                break;
            case 1:
            {
    
                return 1;
            }
    
                break;
            case 2:
            {
    
                return 1;
            }
                break;
            case 3:
            {
    
                return 4;
            }
    
                break;
    
            default:
            {
    
                return 1;
                break;
    
            }
    
        }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *cellIdentifier;
    switch (indexPath.section) {
        case 0:
        {
            cellIdentifier = @"cell1";
            OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            return cell;
        }
            break;
        case 1:
        {
            cellIdentifier = @"cell2";
            CustomerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            [cell.lblAddress setText:@"#5, 4th Cross Ayyappa Layout, Munnekolalu, \nMarathalli. Bangalore.\n Pin 560037"];
            return cell;
        }
            
            break;
        case 2:
        {
            cellIdentifier = @"cell3";
            DistributorDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            return cell;
        }
            break;
        case 3:
        {
            cellIdentifier = @"cell4";
            ProductOrderedCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            [cell.lblProductName setText: [NSString stringWithFormat:@"Product %ld",indexPath.row-3]];
            return cell;
        }
            break;
        default:
        {
            cellIdentifier = @"cell4";
            ProductOrderedCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            [cell.lblProductName setText: [NSString stringWithFormat:@"Product %ld",indexPath.row-3]];
            return cell;
        }
            break;
    }
    
    
    // Configure the cell...
    
    // return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (IBAction)trackOrderDidSelect:(id)sender {
    
//    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
//                                                            longitude:151.20
//                                                                 zoom:6];
//    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//    mapView.myLocationEnabled = YES;
//    self.view = mapView;
//    
//    // Creates a marker in the center of the map.
//    GMSMarker *marker = [[GMSMarker alloc] init];
//    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
//    marker.title = @"Sydney";
//    marker.snippet = @"Australia";
//    marker.map = mapView;

}
@end
