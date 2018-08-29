//
//  LabelFitTool.m
//  ZNKE
//
//  Created by lhb on 16/3/9.
//  Copyright © 2016年 lixiao. All rights reserved.
//

#import "LabelFitTool.h"

@implementation LabelFitTool

static LabelFitTool * labelFitTool;

//uilabel自适应工具单例
+ (LabelFitTool *)getLabelFit {
    
    if (!labelFitTool) {
         labelFitTool = [[LabelFitTool alloc]init];
    }
   
    return labelFitTool;
}

- (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize space:(NSInteger)space

{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
    if (space != 0) {
        [paragraphStyle setLineSpacing:5];
    }
    NSDictionary * attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading| NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    
    labelSize.height=ceil(labelSize.height);
    labelSize.width=ceil(labelSize.width);
    
    
    return labelSize;
}
@end
