//
//  GaneltAddressEntityManager.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltAddressEntityManager.h"
#define managerObjectContext  [GaneltCoreDataManager sharedInstance].managedObjectContext

@implementation GaneltAddressEntityManager
+ (GaneltAddressEntityManager *)sharedInstance {
    
    static GaneltAddressEntityManager * _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _sharedInstance = [[GaneltAddressEntityManager alloc] init];
        
    });
    
    return _sharedInstance;
    
}
- (void)insterEntityData:(GaneltAddressFormationModel * )model{
    AddressEntity * push = [NSEntityDescription insertNewObjectForEntityForName:@"AddressEntity" inManagedObjectContext:managerObjectContext];
    push.provinceCode = model.provinceCode;
    push.cityCode = model.cityCode;
    push.areaCode = model.areaCode;
    push.provinceName = model.provinceName;
    push.cityName = model.cityName;
    push.areaName = model.areaName;
    push.addressDetail = model.addressDetail;
    push.phoneNum = model.phoneNum;
    push.name = model.name;
    push.sexStr = model.sexStr;
    push.time = model.time;

    [[GaneltCoreDataManager sharedInstance] saveContext];
}

- (NSArray *)fetAllArray{
    NSFetchRequest * request = [[NSFetchRequest alloc] init];//创建一个空语句
    NSEntityDescription * en = [NSEntityDescription entityForName:@"AddressEntity" inManagedObjectContext:managerObjectContext];//创建要查询的实体
    [request setEntity:en];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    NSArray * arry = [managerObjectContext executeFetchRequest:request error:nil];//执行查询语句，并且返
    return arry;

}
@end
