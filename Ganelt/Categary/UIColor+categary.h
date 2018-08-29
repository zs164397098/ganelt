//
//  UIColor+categary.h
//  henoo
//
//  Created by ask on 2017/12/15.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (categary)
// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
