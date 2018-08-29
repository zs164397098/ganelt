//
//  NSDictionary+GaneltCode.h
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, GaneltCode) {
    GaneltCodeUnknown,// 未知错误
    GaneltCodeSuccess,// 请求成功
    GaneltCodeError, // 请求失败
    GaneltCodeLoginExpire, // 登录过期
    GaneltCodeTokenExpire // token过期
};

@interface NSDictionary (GaneltCode)
/**
 * 获取网络请求返回的code
 */
-(GaneltCode)getCode;
@end
