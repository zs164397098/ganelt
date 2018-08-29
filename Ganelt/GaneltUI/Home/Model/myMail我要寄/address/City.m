/*****************************************************************
 文件名称：City.m
 作   者：王宾宾
 备   注：我的地址_picker_市
 创建时间：2015-9-11
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import "City.h"
#import "Area.h"
#import "MJExtension.h"
@implementation City
+(NSDictionary *)objectClassInArray {
    return @{@"childeList" : [Area class]};
}
@end
