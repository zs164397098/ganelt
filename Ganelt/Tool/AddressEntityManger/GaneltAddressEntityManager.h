//
//  GaneltAddressEntityManager.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GaneltCoreDataManager.h"
#import "GaneltAddressFormationModel.h"
#import "AddressEntity+CoreDataClass.h"
@interface GaneltAddressEntityManager : NSObject
+ (GaneltAddressEntityManager *)sharedInstance;
/*
 *插入数据
 */
- (void)insterEntityData:(GaneltAddressFormationModel * )model;
/*
 *获取所有数据
 */
- (NSArray *)fetAllArray;

@end
