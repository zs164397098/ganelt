/***************************************************
    文件名称：JudgeMobileNumber.h
    作   者：李晓亮
    备   注：正则判断手机号码地址格式头文件
    创建时间：2013-1-12
    修改历史：
    版权声明：Copyright 2013 . All rights reserved.
 ***************************************************/
#import <Foundation/Foundation.h>

@interface JudgeMobileNumber : NSObject

/*******************************************
 函数名称：+(BOOL)isValidateEmail:(NSString *)email
 函数功能：用正则判断邮箱
 传入参数：N/A
 返回 值： 返回值yes为正确
 ********************************************/
+ (BOOL)isValidateEmail:(NSString *)email;

+ (BOOL)isValidateNameAndCode:(NSString *)code;

+ (BOOL)isValidateNameAndPassword:(NSString *)password;
/*******************************************
 函数名称：isMobileNumber:(NSString *)mobileNum
 函数功能：用正则判断手机号码和电话号码
 传入参数：N/A
 返回 值： 返回值yes为正确
 ********************************************/
+ (BOOL)isMobile:(NSString *)mobile;

+ (BOOL) validatePassword:(NSString *)passWord;
//判断是否都是空格
+ (BOOL) isEmpty:(NSString *) str;
/*******************************************
 函数功能：用正则判断身份证号是否正确
 传入参数：N/A
 返回 值： 返回值yes为正确
 ********************************************/
+ (BOOL)isValidateIDCard:(NSString *)idcard;
/*******************************************
 函数功能：用正则判断是否为纯中文或英文与空格
 传入参数：N/A
 返回 值： 返回值yes为正确
 ********************************************/
+ (BOOL)isValidateCnEn:(NSString *)str;
@end
