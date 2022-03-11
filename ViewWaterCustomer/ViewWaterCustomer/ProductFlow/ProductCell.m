//
//  ProductCell.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imgProduct.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.imgProduct.layer.borderWidth = 0.5f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
