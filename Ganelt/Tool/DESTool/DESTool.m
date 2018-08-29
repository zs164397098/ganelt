/*****************************************************************
 文件名称：DESTool.m
 作   者：王宾宾
 备   注：DES加密\解密工具
 创建时间：2015-09-17
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import "DESTool.h"

@implementation DESTool

/**
 *  字符串加密
 *
 *  @param cipherText 加密明文
 *  @param key        密钥 64位
 *
 *  @return 加密后字符串
 */
+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key {
    // 利用 GTMBase64 解碼 Base64 字串
    NSData* cipherData = [GTMBase64 decodeString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    
    // IV 偏移量不需使用
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,//解密
                                          kCCAlgorithmDES,//加密按照哪个标准
                                          kCCOptionPKCS7Padding| kCCOptionECBMode,//选项分组密码算法
                                          [key UTF8String],//秘钥
                                          kCCKeySizeDES,// DES秘钥大小
                                          nil,//可选的初始矢量
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}

/**
 *  字符串解密
 *
 *  @param clearText 解密密码
 *  @param key       秘钥 64位
 *
 *  @return 解密完成字符串
 */
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key
{
    NSData *data = [clearText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding| kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        plainText = [GTMBase64 stringByEncodingData:dataTemp];
    }else{
        NSLog(@"DES加密失败");
    }
    return plainText;
}
@end
