//
//  ProductDetailsViewController.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 2/28/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewWaterConstants.h"
#import "AppDelegate.h"
#import "Reachability.h"
#import "CustomPageControl.h"

@interface ProductDetailsViewController : UIViewController<CustomPageControlDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *pageScroll;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollImageView;
@property (weak, nonatomic) IBOutlet UIView *contentViewScroll;
@property (weak, nonatomic) IBOutlet UIView *vwProjectDescription;
@property (weak, nonatomic) IBOutlet UITextView *txtViewProductDescription;

@property (weak, nonatomic) IBOutlet CustomPageControl *customPageControl;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeightConstraint;


@end
