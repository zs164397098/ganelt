//
//  GaneltAFnetWorkManager.h
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    GET = 1,
    /**
     *  post请求
     */
    POST = 2
};
@interface GaneltAFnetWorkManager : NSObject
+ (GaneltAFnetWorkManager *)getInstance;

- (void)requestUrl:(NSString *)URLString
   HttpRequestType:(HttpRequestType)type
        parameters:(NSDictionary *)parameters
          progress:(void (^)(NSProgress *uploadProgress))progress
           success:(void (^)(NSDictionary *result))success
           failure:(void (^)(NSError *error))failure;
@end
