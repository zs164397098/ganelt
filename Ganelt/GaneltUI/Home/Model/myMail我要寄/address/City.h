/*****************************************************************
 文件名称：City.h
 作   者：王宾宾
 备   注：我的地址_picker_市
 创建时间：2015-9-11
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import <Foundation/Foundation.h>

@interface City : NSObject
@property (nonatomic ,copy) NSString *cityCode;
@property (nonatomic ,copy) NSString *cityName;
@property (nonatomic ,strong) NSArray *childeList;
@end
