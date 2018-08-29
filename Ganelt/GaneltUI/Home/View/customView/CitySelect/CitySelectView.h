//
//  CitySelectView.h
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/27.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Province.h"
#import "City.h"
#import "Area.h"

@interface CitySelectView : UIView
// 弹框UIPickerView
@property (nonatomic ,strong) UIPickerView *pickView;

// 弹框遮罩view
@property (nonatomic ,strong) UIButton *viewCover;
// 弹框 键盘取消确定view
@property (nonatomic ,strong) UIView *inputview;

@property (nonatomic, strong)void (^cancleClick)(void);

@property (nonatomic, strong)void (^sureClick)(Province * provinceModel,City * cityModel,Area * areaModel);
@end
