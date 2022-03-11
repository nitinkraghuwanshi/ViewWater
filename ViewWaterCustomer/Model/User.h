//
//  User.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject


@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *address;
- (void)saveUserInformation;
@end
