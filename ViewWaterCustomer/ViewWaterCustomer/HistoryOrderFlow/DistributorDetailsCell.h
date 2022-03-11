//
//  DistributorDetailsCell.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 4/8/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DistributorDetailsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDistributorName;
@property (weak, nonatomic) IBOutlet UILabel *lblDistributorConatct;
@property (weak, nonatomic) IBOutlet UIButton *btnTrackOrder;
@property (weak, nonatomic) IBOutlet UIImageView *imgDistributor;

@end
