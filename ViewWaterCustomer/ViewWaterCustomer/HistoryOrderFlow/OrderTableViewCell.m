//
//  OrderTableViewCell.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/8/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView layoutIfNeeded];
    [self setPaddingToThreeSides:10.0f];
}
-(void)setPaddingToThreeSides:(float)paddingValue
{
    self.contentView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.contentView.layer.borderWidth = paddingValue;
    CALayer *TopBorder = [CALayer layer];
    TopBorder.frame = CGRectMake(paddingValue, 0.0f, self.bounds.size.width-paddingValue*2, paddingValue);
    TopBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:TopBorder];
}
@end
