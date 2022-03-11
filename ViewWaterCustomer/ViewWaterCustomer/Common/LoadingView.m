//
//  LoadingView.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "LoadingView.h"
@interface LoadingView()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@end

@implementation LoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // load view frame XIB
        [self loadFromXIB];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // load view frame XIB
        [self loadFromXIB];
    }
    return self;
}



- (void)loadFromXIB {
    
    [[NSBundle mainBundle] loadNibNamed:@"LoadingView"  owner:self options:nil];
    [self addSubview:self.contentView];

    self.contentView.frame = self.bounds;
   
    
}
- (id)initWithView:(UIView *)view {
    NSAssert(view, @"View must not be nil.");
    return [self initWithFrame:view.bounds];
}

- (id)initWithWindow:(UIWindow *)window {
    return [self initWithView:window];
}


#pragma mark - Instance Methods
+ (LS_INSTANCETYPE)showLoadingOnView:(UIView*)targetView{
    
    LoadingView *loadingView = [[self alloc] initWithView:targetView];
    [targetView addSubview:loadingView];
    [loadingView startAnimation];
    return loadingView;
}
+ (void)hideLoadingFromView:(UIView*)targetView
{
    LoadingView *lView = [self loadinViewForView:targetView];
    if (lView != nil) {
        [lView stopAnimation];
        [lView removeFromSuperview];
    }
}


+ (BOOL)isLoadingOnView:(UIView *)view
{
    if ([[LoadingView allLoadingViewForView:view] count]) {
        return YES;
    }
    return NO;
}
+ (NSArray *)allLoadingViewForView:(UIView *)view {
    NSMutableArray *loadingViews = [NSMutableArray array];
    NSArray *subviews = view.subviews;
    for (UIView *aView in subviews) {
        if ([aView isKindOfClass:self]) {
            [loadingViews addObject:aView];
        }
    }
    return [NSArray arrayWithArray:loadingViews];
}


+ (LS_INSTANCETYPE)loadinViewForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (LoadingView *)subview;
        }
    }
    return nil;
}


- (void)startAnimation{
       [self.indicatorView startAnimating];
    
}

- (void)stopAnimation
{
    [self.indicatorView stopAnimating];
}


@end
