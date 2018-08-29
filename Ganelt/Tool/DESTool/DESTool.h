/*****************************************************************
 文件名称：DESTool.h
 作   者：王宾宾
 备   注：DES加密\解密工具
 创建时间：2015-09-17
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import <Foundation/Foundation.h>
#import "GTMBase64.h"
#include <CommonCrypto/CommonCryptor.h>
@interface DESTool : NSObject

/**
 *  字符串加密
 *
 *  @param cipherText 加密明文
 *  @param key        密钥 64位
 *
 *  @return 加密后字符串
 */
+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key;

/**
 *  字符串解密
 *
 *  @param clearText 解密密码
 *  @param key       秘钥 64位
 *
 *  @return 解密完成字符串
 */
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key;

@end
