//
//  OrderHistoryListTableViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/9/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "OrderHistoryListTableViewController.h"

@interface OrderHistoryListTableViewController ()

@end

@implementation OrderHistoryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView setEstimatedRowHeight:125];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 4;
}

///*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    if (indexPath.row/2==0) {
        [cell.lblCustomerAddress setText:@"Address"];
        [cell.lblCustomerName setText:@" Nitin Kumar Raghuwanshi  "];
    }
    else
    {
        [cell.lblCustomerName setText:@" Nitin "];
        [cell.lblCustomerAddress setText:@"#5, 4th Cross Ayyappa Layout, Munnekolalu,\n Marathalli. Bangalore.\n Pin 560037"];
    }
    
    
    
    cell.contentView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    cell.contentView.layer.borderWidth = 10.0f;
    CALayer *TopBorder = [CALayer layer];
    TopBorder.frame = CGRectMake(10.0f, 0.0f, cell.frame.size.width-20, 10.0f);
    TopBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [cell.layer addSublayer:TopBorder];
    
    return cell;
}
//*/

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

@end
