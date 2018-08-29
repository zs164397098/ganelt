//
//  GaneltCoreDataManager.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface GaneltCoreDataManager : NSObject
@property (nonatomic, strong, readonly)NSManagedObjectContext * managedObjectContext;

@property (nonatomic, strong, readonly) NSManagedObjectModel * managedObjectModel;

@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator * persistentStoreCoordinator;

+ (GaneltCoreDataManager *)sharedInstance;

- (void)saveContext;
@end
