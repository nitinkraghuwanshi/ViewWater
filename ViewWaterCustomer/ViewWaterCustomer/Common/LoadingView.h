//
//  LoadingView.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef LS_INSTANCETYPE
#if __has_feature(objc_instancetype)
#define LS_INSTANCETYPE instancetype
#else
#define LS_INSTANCETYPE id
#endif
#endif
@interface LoadingView : UIView

/*!!
 @method showLoadingOnView
 @abstract add loading on target view.
 */
+ (LS_INSTANCETYPE)showLoadingOnView:(UIView*)targetView;

/*!!
 @method hideLoadingFromView
 @abstract hide loading on target view.
 */
+ (void)hideLoadingFromView:(UIView*)targetView;

/*!!
 @method isLoadingOnView
 @abstract Find if any of loading subviews is  present on target view.
 @return A Bool value: YES if loading is present on target view else returns NO
 */
+ (BOOL)isLoadingOnView:(UIView *)view;


@end
