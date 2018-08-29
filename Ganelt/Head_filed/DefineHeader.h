//
//  DefineHeader.h
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/6.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#ifndef DefineHeader_h
#define DefineHeader_h

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

//使用rgb色值
#define RGB(r, g, b)   [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(1.0)]

#define RGBAlpha(r, g, b, a)   [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

//使用16进制色值
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define ColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define ColorWithRGB(r,g,b) ColorWithRGBA(r,g,b,1)
#define ColorWithHexRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]
#define ColorWithHexRGB(rgbValue) ColorWithHexRGBA(rgbValue,1.0)
#define UIColorWhite [UIColor whiteColor]
#define UIColorClear [UIColor clearColor]


#define WeakSelf(x) __weak typeof(self) x = self
#define isIOS11 [[UIDevice currentDevice].systemVersion floatValue]>=11.0
#define NavigaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.frame.size.height)

#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height - 812) ? NO : YES) //判断是否iPhoneX
#define SystemSafeAreaBottom ((IS_IPHONEX) ? 34 : 0) //底部的安全高度

#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define NavitionHiddenHeight ((IS_IPHONEX) ? [[UIApplication sharedApplication] statusBarFrame].size.height : 0) //隐藏导航栏 iphonex status下计算 其余的在顶部计算

#define TabbarHeight ((IS_IPHONEX) ? (49 + 34) : 49)

// 1像素线（不考虑位置偏移）
#define kPX1 ([[UIScreen mainScreen] scale] > 0.0 ? 1.0 / [[UIScreen mainScreen] scale] : 1.0)

#endif /* DefineHeader_h */
