//
//  Product.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic,strong) NSString *product_id;
@property (nonatomic,strong) NSArray  *arrProductImage;
@property (nonatomic,strong) NSString *product_name;
@property (nonatomic,strong) NSString *product_price;
@property (nonatomic,strong) NSString *product_Category;
@property (nonatomic,strong) NSString *product_QuantityAvailable;
@property (nonatomic,strong) NSString *product_QuantityOrder;
@property (nonatomic,strong) NSString *product_Description;
@end
