//
//  GaneltCoreLocationManager.h
//  Ganelt
//
//  Created by shenshen on 2018/2/4.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GaneltCoreLocationManager : NSObject
+ (GaneltCoreLocationManager *)getInstance;
//开启定位
- (void)starLocation;
//停止定位
- (void)stopLocation;

@property (nonatomic, strong) void (^fetLocatCLLocation) (CGFloat longitude,CGFloat latitude);
@end
