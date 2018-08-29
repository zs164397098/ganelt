//
//  GaneltCoreLocationManager.m
//  Ganelt
//
//  Created by shenshen on 2018/2/4.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltCoreLocationManager.h"
#import <CoreLocation/CoreLocation.h>
#define UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface GaneltCoreLocationManager ()<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}
@end
@implementation GaneltCoreLocationManager
static GaneltCoreLocationManager * coreLocationManager;
//分享工具单例
+ (GaneltCoreLocationManager *)getInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        coreLocationManager = [[GaneltCoreLocationManager alloc]init];
    });
    return coreLocationManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        coreLocationManager = [super allocWithZone:zone];
    });
    return coreLocationManager;
}


- (id)copyWithZone:(NSZone *)zone {
    
    return coreLocationManager;
}

- (id)init{
    static id obj=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if((obj = [super init]) != nil)
        {
            // 实例化对象
            _locationManager = [[CLLocationManager alloc] init];
            
            _locationManager.delegate = self;
            
            if(UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
                //使用期间
                [_locationManager requestWhenInUseAuthorization];
            }
            
            // 请求授权，记得修改的infoplist，NSLocationAlwaysUsageDescription（描述）
            //            [_manager requestAlwaysAuthorization];
            
        }
    });
    self = obj;
    return self;

}

#pragma mark - CoreLocation 代理
#pragma mark - 代理方法，当授权改变时调用
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    
    // 获取授权后，通过
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        
        //开始定位(具体位置要通过代理获得)
        [_locationManager startUpdatingLocation];
        
        //设置精确度
        _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        
        //设置过滤距离
        _locationManager.distanceFilter = 1000;
        
        //开始定位方向
        [_locationManager startUpdatingHeading];
    }
    
    
}
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
//可以通过模拟器设置一个虚拟位置，否则在模拟器中无法调用此方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location=[locations firstObject];//取出第一个位置
    CLLocationCoordinate2D coordinate=location.coordinate;//位置坐标
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
    if (self.fetLocatCLLocation) {
        self.fetLocatCLLocation(coordinate.longitude, coordinate.latitude);
    }
}

- (void)starLocation{
    //启动跟踪定位
    [_locationManager startUpdatingLocation];
}

- (void)stopLocation{
    //如果不需要实时定位，使用完即使关闭定位服务
    [_locationManager stopUpdatingLocation];
}
@end
