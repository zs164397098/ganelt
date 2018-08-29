//
//  PickSelectview.h
//  ZNKEGJ
//
//  Created by lhb on 2017/3/15.
//  Copyright © 2017年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PickSelectview : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
// 弹框UIPickerView
@property (nonatomic ,strong) UIPickerView *pickView;

// 弹框遮罩view
@property (nonatomic ,strong) UIButton *viewCover;
// 弹框 键盘取消确定view
@property (nonatomic ,strong) UIView *inputview;

// 盛放内容的数组
@property (nonatomic ,strong) NSArray *Arry;

@property (nonatomic, strong)void (^cancleClick)(void);

@property (nonatomic, strong)void (^sureClick)(NSInteger index);

@end
