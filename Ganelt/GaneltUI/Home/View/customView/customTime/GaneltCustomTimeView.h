//
//  GaneltCustomTimeView.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/2.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaneltCustomTimeView : UIView
// 弹框UIPickerView
@property (nonatomic ,strong) UIPickerView *pickView;

// 弹框遮罩view
@property (nonatomic ,strong) UIButton *viewCover;
// 弹框 键盘取消确定view
@property (nonatomic ,strong) UIView *inputview;
//选择的日期
@property (nonatomic ,copy) NSString *selectDate;

-(instancetype)initWithFrame:(CGRect)frame selectDate:(NSString *)selectDate;

@property (nonatomic, strong)void (^cancleClick)(void);

@property (nonatomic, strong)void (^sureClick)(NSString * timeStr);
@end
