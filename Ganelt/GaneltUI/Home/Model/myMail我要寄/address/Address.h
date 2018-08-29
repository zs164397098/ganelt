/*****************************************************************
 文件名称：Address.h
 作   者：王宾宾
 备   注：地址模型
 创建时间：2015-8-7
 版权声明：Copyright (c) 2015 王宾宾. All rights reserved.
 *****************************************************************/

#import <Foundation/Foundation.h>

@interface Address : NSObject
/**名字*/
@property (nonatomic ,strong) NSString *linkman;
/** 手机号码 */
@property (nonatomic ,strong) NSString *linkphone;
/** 城市地址 */
@property (nonatomic ,strong) NSString *cityName;
/** 城市code */
@property (nonatomic ,copy) NSString *city;
/** 县级地址 */
@property (nonatomic ,strong) NSString *countyName;
/** 县级code */
@property (nonatomic ,copy) NSString *county;
/** 省市地址 */
@property (nonatomic ,strong) NSString *provinceName;
/** 省市code */
@property (nonatomic ,copy) NSString *province;
/** 详细地址 */
@property (nonatomic ,strong) NSString *address;
/** 是否为默认收货地址 */
@property (nonatomic ,strong) NSString * receiptIsDefault;
/** 地址id */
@property (nonatomic ,copy) NSString *ID;
@end
