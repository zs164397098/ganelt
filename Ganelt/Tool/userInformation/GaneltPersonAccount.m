//
//  GaneltPersonAccount.m
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/14.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import "GaneltPersonAccount.h"
#import "GaneltLoginViewController.h"
@interface GaneltPersonAccount ()
@property (nonatomic,copy) NSLock * lock;

@end
@implementation GaneltPersonAccount
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userId forKey:@"USERID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userId =   [aDecoder decodeObjectForKey:@"USERID"];
    }
    return self;
}
- (BOOL)save
{
    NSString *path = [@"GaneltPersonAccount" documentPath];
    return [NSKeyedArchiver archiveRootObject:self toFile:path];
}

+ (instancetype)getAccountInfo
{
    NSString *path = [@"GaneltPersonAccount" documentPath];
    GaneltPersonAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return account;
}

/**
 * 清理用户信息
 */
+ (void)clearAccountInfo{
    // 账户信息
    NSString *accountPath = [ACCOUNTPATH documentPath];
    // 用户信息
    NSString *personalInfoPath = [EMPINFO documentPath];
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    NSError *error = nil;
    // 删除个人信息和账户
    [fileManager removeItemAtPath:accountPath error:&error];
    [fileManager removeItemAtPath:personalInfoPath error:&error];

    [[NSNotificationCenter defaultCenter]postNotificationName:@"outFresh" object:nil];
}

+(BOOL)checkLogin:(BOOL)isneedJump withCurrentCtr:(GaneltParentsViewController *)currentCtr{
    GaneltPersonAccount *person = [GaneltPersonAccount getAccountInfo];
    if (person.userId.length>0) {
        return YES;
    }
    if (isneedJump) {
        //跳转登录
        GaneltLoginViewController * loginViewController = [[GaneltLoginViewController alloc]initWithNibName:@"GaneltLoginViewController" bundle:nil];
        loginViewController.hidesBottomBarWhenPushed = YES;
        [currentCtr.navigationController pushViewController:loginViewController animated:YES];
    }
    return NO;
}

//+(void)againInvokingWithCurrentCtr:(GaneltParentsViewController *)currentCtr{
//    if ([currentCtr.navigationController.childViewControllers.lastObject isKindOfClass:[HenooLoginViewController class]]) {
//        return;
//    }
//
//}
@end
