//
//  GaneltPersonAccount.h
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/14.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GaneltParentsViewController.h"
@interface GaneltPersonAccount : NSObject<NSCoding>
/**
 *  userId
 */
@property (nonatomic,copy) NSString *userId;

/**
 *  存储
 *
 *  @return 保存状态
 */
- (BOOL)save;
/**
 *  读取
 *
 *  @return 当前模型数据
 */
+ (instancetype)getAccountInfo;

/**
 * 清理用户信息
 */
+ (void)clearAccountInfo;

+(BOOL)checkLogin:(BOOL)isneedJump withCurrentCtr:(GaneltParentsViewController *)currentCtr;

+(void)againInvokingWithCurrentCtr:(GaneltParentsViewController *)currentCtr;
@end
