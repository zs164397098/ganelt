//
//  GaneltParentsViewController.h
//  Ganelt
//
//  Created by shenshen on 2018/1/21.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaneltParentsViewController : UIViewController

-(void)addTitleViewWithTitle:(NSString *)title;

/**
 * 创建导航条Item
 */
- (UIBarButtonItem *)createNavigationBarItem:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)color image:(UIImage *)image frame:(CGRect)frame target:(id)target selector:(SEL)selector;
/**
 * 设置返回按钮图片前置颜色
 */
- (void)setNavBackItemTintColor:(UIColor *)color;
/**
 * 返回事件
 */
- (void)BackButtonItemClick;
/**
 * 隐藏导航条时，在指定offsetY时显示导航条
 */
- (void)hiddenNavBarWhenScrollViewDidScroll:(UIScrollView *)scrollView showNavOffsetY:(CGFloat)showY;

/**
 * 登录成功重载数据
 */
- (void)againInvokingRequest:(BOOL)isLogin;
/**
 * 设置右侧导航按钮
 */
- (void)setRightNavigationBarItem:(NSString *)title image:(UIImage *)image target:(id)target selector:(SEL)selector;
@end
