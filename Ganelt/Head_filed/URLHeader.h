//
//  URLHeader.h
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/6.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#ifndef URLHeader_h
#define URLHeader_h
/**
 *  账户沙盒路径
 */
#define ACCOUNTPATH @"GaneltPersonAccount"
/**
 *  员工个人信息
 */
#define EMPINFO @"GaneltUserFormation"
/**
 *  接口版本号
 */
#define INTERFACEVERSION @"1.0.0"
///**
// * 苹果商店应用ID ！！！！！！上线前检查！！！！！！！
// */
//#define AppStoreID @""
///**
// * 企业版bundle ID前缀 ！！！！！！上线前检查！！！！！！！
// */
//#define kEnterprisePrefix @"com.henoo."
//
//// 网络环境设置：1>内网开发 2>测试环境 3>正式上线 ！！！！！！上线前检查！！！！！！！
#define InterfaceType 1

// 内网开发
#if InterfaceType == 1
#define BASEURL  @"http://192.168.0.106:7777"
// 测试环境
#elif InterfaceType == 2
#define BASEURL  @""

// 正式上线
#elif InterfaceType == 3
#define BASEURL  @""

#endif
//我的
//登录
#define http_login @"/users/user-login"
//获取个人信息
#define http_userInformation @"/users/user-information"
//上传头像
#define http_userAvatarupload @"/users/user-avatarupload"


#endif /* URLHeader_h */
