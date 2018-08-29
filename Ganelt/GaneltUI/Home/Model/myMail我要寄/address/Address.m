/*****************************************************************
 文件名称：Address.m
 作   者：王宾宾
 备   注：地址模型
 创建时间：2015-8-7
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import "Address.h"
#import "MJExtension.h"
@implementation Address
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}
///**
// *  归档
// *
// */
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.address forKey:@"address"];
//    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
//    [aCoder encodeObject:self.selectedProvince forKey:@"selectedProvince"];
//    [aCoder encodeObject:self.selectedCity forKey:@"selectedCity"];
//    [aCoder encodeObject:self.selectedArea forKey:@"selectedArea"];
//    [aCoder encodeObject:self.detailedAdd forKey:@"detailedAdd"];
//    [aCoder encodeObject:self.post forKey:@"post"];
//}
//
///**
// *  解档
// *
// *  @param aDecoder aDecoder
// *
// */
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super init]) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.address = [aDecoder decodeObjectForKey:@"address"];
//        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
//        self.selectedProvince = [aDecoder decodeObjectForKey:@"selectedProvince"];
//        self.selectedCity = [aDecoder decodeObjectForKey:@"selectedCity"];
//        self.selectedArea = [aDecoder decodeObjectForKey:@"selectedArea"];
//        self.detailedAdd = [aDecoder decodeObjectForKey:@"detailedAdd"];
//        self.post = [aDecoder decodeObjectForKey:@"post"];
//    }
//    return self;
//}
@end
