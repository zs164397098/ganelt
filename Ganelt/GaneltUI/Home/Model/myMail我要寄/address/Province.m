/*****************************************************************
 文件名称：Province.m
 作   者：王宾宾
 备   注：我的地址_picker_省市
 创建时间：2015-9-11
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import "Province.h"
#import "MJExtension.h"
#import "City.h"
@implementation Province
+(NSDictionary *)objectClassInArray {
    return @{@"childeList" : [City class]};
}
@end
