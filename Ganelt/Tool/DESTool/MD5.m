//
//  MD5.m
//  ZNKE
//
//  Created by HT.CRY on 15/9/21.
//  Copyright (c) 2015年 lixiao. All rights reserved.
//

#import "MD5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation MD5

/**
 *  md5加密-32位
 *
 *  @param input 输入明文
 *
 *  @return 加密后的字符串
 */
+(NSString *)MD5Digest:(NSString *)input{
  
    const char* str = [input UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];

    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        
        [ret appendFormat:@"%02x",result[i]];
        
    }
    return ret;
    
}

/**
 *  转换成16位的
 *
 *  @param MD532 由32位转到16位
 *
 *  @return 16位MD5
 */
+(NSString *)trransFromMD532ToMD516:(NSString *)MD532{
    NSString  * string;
    for (int i=0; i<24; i++) {
        string=[MD532 substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

@end
