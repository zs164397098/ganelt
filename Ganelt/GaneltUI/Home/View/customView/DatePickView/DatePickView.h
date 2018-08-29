/*****************************************************************
 文件名称：DatePickView.h
 作   者：lixiao
 备   注：
 创建时间：2016-1-12
 版权声明：Copyright (c) 2015 李晓亮. All rights reserved.
 *****************************************************************/

#import <UIKit/UIKit.h>

@interface DatePickView : UIView

//选择日期字符串
@property (nonatomic, copy) NSString *dateStr;
// 弹框遮罩view
@property (nonatomic ,strong) UIButton *viewCover;

@property (nonatomic, strong) void (^sureClick)(NSString *date);

@property (nonatomic, strong) void (^cancelClick)(void);
/**
 * 最小日期
 */
@property (nonatomic, strong) NSDate *minDate;
/**
 * 最大日期
 */
@property (nonatomic, strong) NSDate *maxDate;
/**
 * 日期格式化
 */
@property (nonatomic, strong,readonly) NSString *dateFormat;
@end
