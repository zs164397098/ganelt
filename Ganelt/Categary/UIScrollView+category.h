//
//  UIScrollView+category.h
//  henoo
//
//  Created by ask on 2017/12/19.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
//headView 的高度
#define SpringHeadViewHeight 200

@interface UIScrollView (category)
//在分类增加了属性，这个是利用runtime实现的
@property (nonatomic, weak) UIView *topView;
/**
 * 添加顶部滑动效果，delloc时必须调用removeSpringHeadView
 */
- (void)addSpringHeadView:(UIView *)view;
/**
 * delloc时必须调用此方法
 */
- (void)removeSpringHeadView;
@end
