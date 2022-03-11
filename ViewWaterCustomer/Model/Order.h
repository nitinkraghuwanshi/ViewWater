//
//  Order.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Product.h"
@interface Order : NSObject

@property (nonatomic,strong) NSString *order_id;
@property (nonatomic,strong) User *customer;

@property (nonatomic,strong) NSMutableArray<Product *> *arrOrderedProduct;
@end
