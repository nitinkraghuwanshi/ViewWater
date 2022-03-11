//
//  CustomPageControl.h
//  NightGuru
//
//  Created by Nitin Raghuwanshi on 13/10/14.
//  Copyright (c) 2014 appster. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomPageControlDelegate;
@interface CustomPageControl : UIPageControl
{
    NSMutableArray *originalSubviews;
}
@property(nonatomic,assign)id<CustomPageControlDelegate> delegate;
- (NSInteger)currentPage;
- (void) setCurrentPage:(NSInteger) iPage;
- (void) setNumberOfPages:(NSInteger) iPages;
@end

@protocol CustomPageControlDelegate

-(void)changeCurrentPageToIndex:(int)pageIndex;
@end

