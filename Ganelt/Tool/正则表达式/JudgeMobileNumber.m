/***************************************************
    文件名称：JudgeMobileNumber.h
    作   者：李晓亮
    备   注：正则判断手机号码地址格式实现文件
    创建时间：2013-1-12
    修改历史：
    版权声明：Copyright 2013 . All rights reserved.
 ***************************************************/

#import "JudgeMobileNumber.h"

@implementation JudgeMobileNumber


//+ (BOOL)isMobileNumber:(NSString *)mobileNum
//{
//    /**
//     * 手机号码
//     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//                     183,
//     * 联通：130,131,132,152,155,156,185,186
//     * 电信：133,1349,153,180,189
//     */
//    //NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-25-9])\\d{8}$";
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-9])\\d{8}$";
//    /**
//     10         * 中国移动：China Mobile
//     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//     12         */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
//    /**
//     15         * 中国联通：China Unicom
//     16         * 130,131,132,152,155,156,185,186
//     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//    /**
//     20         * 中国电信：China Telecom
//     21         * 133,1349,153,180,189
//     22         */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
//    /**
//     25         * 大陆地区固话及小灵通
//     26         * 区号：010,020,021,022,023,024,025,027,028,029
//     27         * 号码：七位或八位
//     28         */
//     NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
//    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    NSPredicate *regextestphs= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
//    
//    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
//        || ([regextestcm evaluateWithObject:mobileNum] == YES)
//        || ([regextestct evaluateWithObject:mobileNum] == YES)
//        || ([regextestcu evaluateWithObject:mobileNum] == YES)
//        ||([regextestphs evaluateWithObject:mobileNum] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//   
//}

+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


+ (BOOL)isValidateNameAndPassword:(NSString *)password{
    NSString *passwordRegex = @"[A-Z0-9a-z_]{6,20}";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [nameTest evaluateWithObject:password];
}

+ (BOOL)isValidateNameAndCode:(NSString *)code{
    NSString *codeRegex = @"[0-9]{6,6}";
    NSPredicate *codeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", codeRegex];
    return [codeTest evaluateWithObject:code];
}

/*******************************************
 函数名称：isMobileNumber:(NSString *)mobileNum
 函数功能：用正则判断手机号码和电话号码
 传入参数：N/Af
 返回 值： 返回值yes为正确
 ********************************************/

+ (BOOL)isMobile:(NSString *)mobile{
    if (mobile.length != 11)
    {
        return NO;
    }
    NSString * MOBILE = @"^0?(13|15|17|18|14)[0-9]{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    if (([regextestmobile evaluateWithObject:mobile] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
/*! 用户密码验证 */
+ (BOOL) validatePassword:(NSString *)passWord
{
    /*! 要求数字、字母、字符，至少包含两种，6-20位 */
    NSString *passWordRegex = @"^(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{6,20}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

+ (BOOL) isEmpty:(NSString *) str {
    if (!str) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

+ (BOOL)isValidateIDCard:(NSString *)idcardNum{
    idcardNum = [idcardNum stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([idcardNum length] != 18)
    {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:idcardNum])
    {
        return NO;
    }
    int summary = ([idcardNum substringWithRange:NSMakeRange(0,1)].intValue + [idcardNum substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([idcardNum substringWithRange:NSMakeRange(1,1)].intValue + [idcardNum substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([idcardNum substringWithRange:NSMakeRange(2,1)].intValue + [idcardNum substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([idcardNum substringWithRange:NSMakeRange(3,1)].intValue + [idcardNum substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([idcardNum substringWithRange:NSMakeRange(4,1)].intValue + [idcardNum substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([idcardNum substringWithRange:NSMakeRange(5,1)].intValue + [idcardNum substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([idcardNum substringWithRange:NSMakeRange(6,1)].intValue + [idcardNum substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [idcardNum substringWithRange:NSMakeRange(7,1)].intValue *1 + [idcardNum substringWithRange:NSMakeRange(8,1)].intValue *6
    + [idcardNum substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[idcardNum substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

/*******************************************
 函数功能：用正则判断是否为纯中文或英文与空格
 传入参数：N/A
 返回 值： 返回值yes为正确
 ********************************************/
+ (BOOL)isValidateCnEn:(NSString *)str{
    NSString *regex = @"([\u4e00-\u9fa5a-zA-Z][ ]?)+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if([pred evaluateWithObject: str])
    {
        return YES;
    }
    return NO;
}

@end
