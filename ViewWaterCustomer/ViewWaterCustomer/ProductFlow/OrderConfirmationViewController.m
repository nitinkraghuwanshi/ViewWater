//
//  OrderConfirmationViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "OrderConfirmationViewController.h"
#import "AddressViewController.h"
#import "AppDelegate.h"
@interface OrderConfirmationViewController ()

@end

@implementation OrderConfirmationViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.lbladdress setText:@"No address yet provided!"];
    if ([[AppDelegate sharedAppDelegate].loginUser.address length]>0) {
        [self.lbladdress setText:[AppDelegate sharedAppDelegate].loginUser.address];
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)CODDidSelect:(id)sender {
    
    //[self showSuccessAlert];
    [self performSelector:@selector(showSuccessAlert) withObject:nil afterDelay:0.2f];
    
}


- (IBAction)unwindToOrderConfirmationViewController:(UIStoryboardSegue *)unwindSegue
{
    
    [self makeOrderSummary];
}


-(void)makeOrderSummary
{
    self.title =@"Order Summary";
    [self.imgOrder setHighlighted:YES];
    [self.btnCOD setHidden:YES];
    [self.btnPayOnline setHidden:YES];
    [self.btnDeliveryAddress setHidden:YES];
    [self performSelector:@selector(showSuccessAlert) withObject:nil afterDelay:0.2f];

}

-(void)showSuccessAlert
{
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Order Success"
                                 message:@"Your order has been successfully placed. Product you selected will be delivered shortly."
                                 preferredStyle:UIAlertControllerStyleAlert];
    
   
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                   
                                }];
    
    [alert addAction:yesButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)BackButtonDidSelect:(id)sender
{
    [self poptoProductDetails];
}
-(void)poptoProductDetails
{
        
    ProductListViewController* product_List;
    for (UIViewController*p in [self.navigationController viewControllers]) {
        
        if ([p isKindOfClass:[ProductListViewController class]]) {
            product_List = (ProductListViewController*) p;
            break;
        }
    }
    [self.navigationController popToViewController:product_List animated:YES];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.navigationController popToViewController:product_List animated:YES];
//        
//    });
 
     // [self.navigationController popViewControllerAnimated:YES ];
}


#pragma mark- TableView Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 9;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"ProductCell";
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    int i=0;
    if (indexPath.row%3==0) {
        i= 0;
    }
    else if(indexPath.row%3==1) {
        i= 1;
    }
    else if(indexPath.row%3==2) {
        i= 2;
    }
    
    
    
    [cell.imgProduct setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bottle%d",i]]];
    cell.lblProductName.text= [NSString stringWithFormat:@"Product %ld",(long)indexPath.row];
    //    [cell setBackgroundColor:[UIColor whiteColor]];
    
    cell.contentView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    cell.contentView.layer.borderWidth = 5.0f;
    
    return cell;
}

@end
