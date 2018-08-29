//
//  GaneltMySendFormationView.h
//  Ganelt
//
//  Created by shenshen on 2018/3/21.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaneltMySendFormationView : UIView
// 弹框遮罩view
@property (nonatomic ,strong) UIButton *viewCover;

@property (nonatomic ,strong) UIView *whiteView;

@property (nonatomic, strong)void (^cancleClick)(void);

@property (nonatomic, strong)void (^sureClick)(void);

@end
