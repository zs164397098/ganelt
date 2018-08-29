//
//  GaneltAFnetWorkManager.m
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltAFnetWorkManager.h"
@interface GaneltAFnetWorkManager()
/**
 * 请求地址
 */
@property (nonatomic, copy) NSString *url;
/**
 * 请求参数
 */
@property (nonatomic, copy) NSDictionary *parameters;
/**
 * 请求类型
 */
@property (nonatomic, assign) HttpRequestType requestType;
/**
 * 过程回调
 */
@property (nonatomic, copy)  void(^progressBlock)(NSProgress *uploadProgress);
/**
 * 网络成功回调
 */
@property (nonatomic, copy)  void(^successBlock)(NSDictionary *result);
/**
 * 网络失败回调
 */
@property (nonatomic, copy)  void(^failureBlock)(NSError *error);
/**
 * 重新调用接口
 */
@property (nonatomic, copy)  void(^aginInvokingBlock)(void);
@end

@implementation GaneltAFnetWorkManager
static GaneltAFnetWorkManager * afnetWorkManager;

//分享工具单例
+ (GaneltAFnetWorkManager *)getInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        afnetWorkManager = [[GaneltAFnetWorkManager alloc]init];
    });
    return afnetWorkManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        afnetWorkManager = [super allocWithZone:zone];
    });
    return afnetWorkManager;
}


- (id)copyWithZone:(NSZone *)zone {
    
    return afnetWorkManager;
}

- (void)requestUrl:(NSString *)URLString
   HttpRequestType:(HttpRequestType)type
        parameters:(NSDictionary *)parameters
          progress:(void (^)(NSProgress *uploadProgress))progress
           success:(void (^)(NSDictionary *result))success
           failure:(void (^)(NSError *error))failure{
    self.url = URLString;
    self.requestType = type;
    self.parameters = !parameters?[NSDictionary dictionary]:parameters;
    self.progressBlock = progress;
    self.successBlock = success;
    self.failureBlock =  failure;
    [self fetData];
}

- (void)fetData{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //默认超时为10秒
    manager.requestSerializer.timeoutInterval = 10.0f;
    
    if (self.requestType == GET) {
     [manager GET:[NSString stringWithFormat:@"%@%@",BASEURL,self.url] parameters:self.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            if(self.progressBlock)
            {
                self.progressBlock(downloadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          NSDictionary *responseDict1 = [NSDictionary changeType:[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil]];
            if ([responseDict1 getCode] == GaneltCodeSuccess) {
                if(self.successBlock)
                {
                    self.successBlock(responseDict1);
                }
            }else{
             [[MBProgressHUDManager getInstance]showMessage:responseDict1[@"message"] duration:1];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (self.failureBlock) {
                self.failureBlock(error);
            }
        }];
    }else{
        [manager POST:[NSString stringWithFormat:@"%@%@",BASEURL,self.url] parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            if(self.progressBlock)
            {
                self.progressBlock(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *responseDict1 = [NSDictionary changeType:[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil]];
            if ([responseDict1 getCode] == GaneltCodeSuccess) {
                if(self.successBlock)
                {
                    self.successBlock(responseDict1);
                }
            }else{
              [[MBProgressHUDManager getInstance]showMessage:responseDict1[@"MASSEGE"] duration:1];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (self.failureBlock) {
                self.failureBlock(error);
            }
        }];
    }
    
}

@end
