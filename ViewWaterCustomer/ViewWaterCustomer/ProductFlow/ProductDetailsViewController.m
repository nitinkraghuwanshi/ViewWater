//
//  ProductDetailsViewController.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "ProductDetailsViewController.h"

@interface ProductDetailsViewController ()

@end

@implementation ProductDetailsViewController

#pragma mark-
#pragma mark- API response parsing methods
-(void) parseResponseData:(NSDictionary*)responseData
{
    
    
    [self presentViewController:showAlertScreen(ALERT_TITTLE_APP_NAME, [NSString stringWithFormat:@"responseData == %@",responseData]) animated:YES completion:nil];
    
}
#pragma mark- API methods
-(void) fetchProductDetailsData
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
   
    
    [self setUpVenueImages];
     [self fetchProductDetailsData];
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

-(void)setUpVenueImages
{
    if (1)
    {
        
        int maxX= self.view.frame.size.width-20;
        for (int i= 0; i<5; i++) {
            
            UIImageView * imgvw= [[UIImageView alloc]initWithFrame:CGRectMake(maxX*i, 0, maxX, self.scrollImageView.frame.size.height)];
            [imgvw setImage:[UIImage imageNamed:@"ProductImage"]];
            [self.scrollImageView addSubview:imgvw];
            
        }
        
        [self.scrollImageView  setContentSize:CGSizeMake(maxX*5, self.scrollImageView.frame.size.height)];
        self.scrollImageView.delegate=self;
        [self.scrollImageView setPagingEnabled:YES];
        
        
        //Page control
        self.customPageControl.hidden=NO;
        self.customPageControl.delegate=self;
        [self.customPageControl setNumberOfPages:5];
        
        
        self.contentHeightConstraint.constant = 800;
    }
    else
    {
        //self.customPageControl.hidden=YES;
      
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView_
{
    CGFloat pageWidth = scrollView_.frame.size.width;
    float fractionalPage = scrollView_.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    
    
    [self.customPageControl setCurrentPage:page];
    // if we are dragging, we want to update the page control directly during the drag
    if (self.scrollImageView.dragging)
    {
        [self.customPageControl updateCurrentPageDisplay];
    }
    
    
}
-(void)changeCurrentPageToIndex:(int)pageIndex
{
    CGFloat pageWidth = self.scrollImageView.frame.size.width;
    
    CGPoint contentOffset=CGPointMake(pageWidth*pageIndex, 0);
    
    [self.scrollImageView setContentOffset:contentOffset animated:NO];
    [self.customPageControl setCurrentPage:pageIndex];
    [self.customPageControl updateCurrentPageDisplay];
}

- (IBAction)unwindToProductDetailsViewController:(UIStoryboardSegue *)unwindSegue
{
}
@end
