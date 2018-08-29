/*****************************************************************
 文件名称：NSDictionary+extention.m
 作   者：王宾宾
 备   注：字典的分类.解决json串中的NSNull类型
 创建时间：2015-09-24
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import "NSDictionary+extention.h"

@implementation NSDictionary (extention)
+(NSDictionary *)nullDic:(NSDictionary *)myDic
{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++)
    {
        id obj = [myDic objectForKey:keyArr[i]];
        obj = [self changeType:obj];
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}


//将NSDictionary中的Null类型的项目转化成@""

+(NSArray *)nullArr:(NSArray *)myArr
{
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++)
    {
        id obj = myArr[i];
        obj = [self changeType:obj];
        [resArr addObject:obj];
    }
    return resArr;
}


//将NSString类型的原路返回

+(NSString *)stringToString:(NSString *)string
{
    return string;
}

//将Null类型的项目转化成@""

+(NSString *)nullToString
{
    return @"";
}


#pragma mark - 公有方法

//类型识别:将所有的NSNull类型转化成@""

+(id)changeType:(id)myObj
{
    if ([myObj isKindOfClass:[NSDictionary class]])
    {
        return [self nullDic:myObj];
    }
    else if([myObj isKindOfClass:[NSArray class]])
    {
        return [self nullArr:myObj];
    }
    else if([myObj isKindOfClass:[NSString class]])
    {
        return [self stringToString:myObj];
    }
    else if([myObj isKindOfClass:[NSNull class]])
    {
        return [self nullToString];
    }
    else
    {
        return myObj;
    }
}



- (void)nslogPropertyWithDic {
    
#if DEBUG
    
    NSDictionary *dic = [NSDictionary new];
    
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSDictionary *tempDic = [(NSDictionary *)self mutableCopy];
        dic = tempDic;
    } else {
        NSLog(@"无法解析为model属性，因为并非数组或字典");
        return;
    }
    
    if (dic.count == 0) {
        NSLog(@"无法解析为model属性，因为该字典为空");
        return;
    }
    
    
    NSMutableString *strM = [NSMutableString string];
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {

        [strM appendFormat:@"/**\n"];
        [strM appendFormat:@"* <#注释#>\n"];
        [strM appendFormat:@"*/\n"];
        NSString *className = NSStringFromClass([obj class]) ;
        if ([className isEqualToString:@"__NSCFString"] | [className isEqualToString:@"__NSCFConstantString"] | [className isEqualToString:@"NSTaggedPointerString"]) {
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFArray"] |
                  [className isEqualToString:@"__NSArray0"] |
                  [className isEqualToString:@"__NSArrayI"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSArray *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFDictionary"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSDictionary *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFNumber"]){
            [strM appendFormat:@"@property (nonatomic, assign) NSInteger %@;\n",key];
        }else if ([className isEqualToString:@"__NSCFBoolean"]){
            [strM appendFormat:@"@property (nonatomic, assign) BOOL   %@;\n",key];
        }else if ([className isEqualToString:@"NSDecimalNumber"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }
        else if ([className isEqualToString:@"NSNull"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }else if ([className isEqualToString:@"__NSArrayM"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSMutableArray *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }else{
             [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",key];
        }
        
    }];
    NSLog(@"\n%@\n",strM);
    
#endif
    
}

/**
 * json字符串转换成字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if(jsonString == nil){
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

/**
 * 字典转换成json字符串
 */
- (NSString *)dictToJsonStr{
    NSString *jsonString = nil;
    if([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        jsonString =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if(error) {
            NSLog(@"Error:%@", error);
        }
    }
    return jsonString;
}

/**
 * 安全取值，避免取出nil
 */
- (NSString *)safeObjectForKey:(id)key {
    NSString *value = [NSString stringWithFormat:@"%@",[self objectForKey:key]];
    if ([[self objectForKey:key] isKindOfClass:[NSNull class]] ||
        [self objectForKey:key] == nil ||
        [value isEqualToString:@"(null)"]||
        [value isEqualToString:@""] ||
        //        [value isEqualToString:@"null"] ||
        [value isEqualToString:@"<null>"]) {
        return @"";
    }
    return value;
}
@end
