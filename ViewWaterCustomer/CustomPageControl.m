//
//  CustomPageControl.m
//  NightGuru
//
//  Created by Nitin Raghuwanshi on 13/10/14.
//  Copyright (c) 2014 appster. All rights reserved.
//

#import "CustomPageControl.h"

@implementation CustomPageControl
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // retain original subviews in case apple's implementation
        // relies on the retain count being maintained by the view's
        // presence in its superview.
       // originalSubviews = [[NSArray alloc] initWithArray: self.subviews];
        
//        for ( UIView *view in self.subviews ) [view removeFromSuperview];
        
        // make sure the view is redrawn not scaled when the device is rotated
        self.contentMode = UIViewContentModeRedraw;
        
        originalSubviews = [NSMutableArray new];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
//
//  RedGreyPageControl.m
//




// This assumes you're creating the control from a nib.  Depending on your
// usage you might do this step in initWithFrame:
- (void) awakeFromNib {
    // retain original subviews in case apple's implementation
    // relies on the retain count being maintained by the view's
    // presence in its superview.
//    originalSubviews = [[NSArray alloc] initWithArray: self.subviews];
//    
//    for ( UIView *view in self.subviews )
//    {
//        [view removeFromSuperview];
//    }
    originalSubviews = [NSMutableArray new];
    // make sure the view is redrawn not scaled when the device is rotated
    self.contentMode = UIViewContentModeRedraw;
}




- (void) drawRect:(CGRect) iRect {
    UIImage                 *grey, *image, *red;
    int                     i;
    CGRect                  rect;
    
    const CGFloat           kSpacing = 10.0;
    
    iRect = self.bounds;
    
    if ( self.opaque ) {
        [self.backgroundColor set];
        UIRectFill( iRect );
    }
    
    if ( self.hidesForSinglePage && self.numberOfPages == 1 ) return;
    
    red = [UIImage imageNamed: @"SliderCircularSelectedButton"];
    grey = [UIImage imageNamed: @"SliderCircularButton"];
    
    rect.size.height = red.size.height;
    rect.size.width = self.numberOfPages * red.size.width + ( self.numberOfPages - 1 ) * kSpacing;
    rect.origin.x = floorf( ( iRect.size.width - rect.size.width ) / 2.0 );
    rect.origin.y = floorf( ( iRect.size.height - rect.size.height ) / 2.0 );
    rect.size.width = red.size.width;
    
    for ( i = 0; i < self.numberOfPages; ++i ) {
        image = i == self.currentPage ? red : grey;
        
        [image drawInRect: rect];
        
        [originalSubviews addObject:NSStringFromCGRect(rect)];
        rect.origin.x += red.size.width + kSpacing;
    }
    
    for ( UIView *view in self.subviews ) [view removeFromSuperview];
}

- (NSInteger)currentPage{
    return [super currentPage];
}
// you must override the setCurrentPage: and setNumberOfPages:
// methods to ensure that your control is redrawn when its values change
- (void) setCurrentPage:(NSInteger) iPage {
    [super setCurrentPage: iPage];
    [self setNeedsDisplay];
}


- (void) setNumberOfPages:(NSInteger) iPages {
    [super setNumberOfPages: iPages];
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    for (int i = 0; i < [originalSubviews count]; i++)
    {
        NSString *rect = [originalSubviews objectAtIndex:i];
        if (CGRectContainsPoint(CGRectFromString(rect), point)) {
            NSLog(@" %s index == %d",__FUNCTION__,i);
            //[self setCurrentPage:i];
            if ([(NSObject*)self.delegate respondsToSelector:@selector(changeCurrentPageToIndex:)])
            {
                [self.delegate changeCurrentPageToIndex:i];
            }

            break;
        }
    }
}

@end
