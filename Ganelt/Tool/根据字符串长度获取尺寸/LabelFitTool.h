/*****************************************************************
 文件名称：LabelFitTool.h
 作   者：zss
 备   注：分享
 创建时间：2016-03-09
 版权声明：Copyright (c) 2015 zss. All rights reserved.
 *****************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LabelFitTool : NSObject

+ (LabelFitTool *)getLabelFit;

- (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize space:(NSInteger)space;
@end
