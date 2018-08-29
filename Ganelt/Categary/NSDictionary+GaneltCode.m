//
//  NSDictionary+GaneltCode.m
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "NSDictionary+GaneltCode.h"

@implementation NSDictionary (GaneltCode)
/**
 * 获取网络请求返回的code
 */
-(GaneltCode)getCode {
    NSString *code = [NSString stringWithFormat:@"%@",[self objectForKey:@"CODE"]];
    if ([code isEqualToString:@"10000"] ) {
        return GaneltCodeSuccess;
    }
    else if([code isEqualToString:@"10001"])
    {
        return  GaneltCodeError;
    }
    return GaneltCodeUnknown;
}
@end
