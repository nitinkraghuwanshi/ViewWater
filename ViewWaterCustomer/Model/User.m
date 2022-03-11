//
//  User.m
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//

#import "User.h"
#import "ViewWaterConstants.h"

@implementation User
@synthesize name,email,mobile,address;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if( self != nil )
    {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self.name copy] forKey:@"name"];
    [aCoder encodeObject:[self.email copy] forKey:@"email"];
    [aCoder encodeObject:[self.address copy] forKey:@"address"];
    [aCoder encodeObject:[self.mobile copy] forKey:@"mobile"];
    
}

- (void)saveUserInformation
{
    NSString *sPath = [DOCUMENTS_FOLDER stringByAppendingPathComponent:@"user_data.xml"];
    [NSKeyedArchiver archiveRootObject:self toFile:sPath];
}

@end
