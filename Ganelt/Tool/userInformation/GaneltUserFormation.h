//
//  GaneltUserFormation.h
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/14.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GaneltUserFormation : NSObject<NSCoding>

@property (nonatomic,copy) NSString *ACCOUNT;

@property (nonatomic,copy) NSString *PHONE;

@property (nonatomic,copy) NSString *IDCARD;

@property (nonatomic,copy) NSString *AUTHENTICATION;

@property (nonatomic,copy) NSString *GRADE;
//评星登记
@property (nonatomic,copy) NSString *STARRATING;

@property (nonatomic,copy) NSString *AVATAR;

@property (nonatomic,copy) NSString *SEX;

@property (nonatomic,copy) NSString *NAME;

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
@end
