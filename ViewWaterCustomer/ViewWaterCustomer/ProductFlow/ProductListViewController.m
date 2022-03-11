//
//  ProductListViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "ProductListViewController.h"
#import "LoadingView.h"

@interface ProductListViewController ()

@end

@implementation ProductListViewController
#pragma mark-
#pragma mark- API response parsing methods
-(void) parseResponseData:(NSDictionary*)responseData
{

        [self presentViewController:showAlertScreen(ALERT_TITTLE_APP_NAME, [NSString stringWithFormat:@"responseData == %@",responseData]) animated:YES completion:nil];
    [self.tableView reloadData];
}
#pragma mark- API methods
-(void) fetchProductListData
{
    NSLog(@"main thread? ANS - %@",[NSThread isMainThread]? @"YES":@"NO");
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
//     [LoadingView showLoadingOnView:self.view];
//    [self fetchProductListData];
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


- (IBAction)unwindToProductListViewController:(UIStoryboardSegue *)unwindSegue
{
}


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
