//
//  GaneltCustomMKAnnotationView.m
//  Ganelt
//
//  Created by shenshen on 2018/2/4.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltCustomMKAnnotationView.h"
@interface GaneltCustomMKAnnotationView ()

@end
@implementation GaneltCustomMKAnnotationView
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self createUI];
//    }
//    return self;
//}
- (instancetype)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createUI];

    }
    return self;
    
}
- (void)createUI{
    self.frame = CGRectMake(0, 0, 100, 45);
    //背景
//    self.backgroundView=[[UIImageView alloc]initWithFrame:self.frame];
//    UIImage *img = [UIImage imageNamed:@"chat_receiver_bg"];
//    // 四个数值对应图片中距离上、左、下、右边界的不拉伸部分的范围宽度
//    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(5, 10, 10, 40) resizingMode:UIImageResizingModeTile];
//    self.backgroundView.image = img;
    
//    self.backgroundView.image = [[UIImage imageNamed:@"chat_receiver_bg" ]stretchableImageWithLeftCapWidth:15 topCapHeight:10];

    //左侧添加图标
    self.iconView=[[UIImageView alloc]initWithFrame:CGRectMake(35, 15, 30, 30)];
    [self.iconView setImage:[UIImage imageNamed:@"location"]];
    //上方详情
    self.detailLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width , 15)];
    self.detailLabel.lineBreakMode=NSLineBreakByWordWrapping;
    //[_text sizeToFit];
    self.detailLabel.font=[UIFont systemFontOfSize:12];
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:self.backgroundView];
//    [self.backgroundView addSubview:self.iconView];
//    [self.backgroundView addSubview:self.detailLabel];
    [self addSubview:self.iconView];
    [self addSubview:self.detailLabel];

    
}


@end
