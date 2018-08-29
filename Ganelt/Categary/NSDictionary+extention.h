/*****************************************************************
 文件名称：NSDictionary+extention.h
 作   者：王宾宾
 备   注：字典的分类.解决json串中的NSNull类型
 创建时间：2015-09-24
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import <Foundation/Foundation.h>

@interface NSDictionary (extention)
+(id)changeType:(id)myObj;
/**
 * 自动打印属性Model
 */
- (void)nslogPropertyWithDic;

/**
 * json字符串转换成字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 * 字典转换成json字符串
 */
- (NSString *)dictToJsonStr;
/**
 * 安全取值，避免取出nil
 */
- (NSString *)safeObjectForKey:(id)key;
@end
