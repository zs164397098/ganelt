//
//  GaneltMySendFormationView.m
//  Ganelt
//
//  Created by shenshen on 2018/3/21.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMySendFormationView.h"

@implementation GaneltMySendFormationView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUi];
    }
    return self;
}

- (void)createUi{
    self.viewCover = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.viewCover.backgroundColor = [UIColor blackColor];
    [self.viewCover addTarget:self action:@selector(canCelBtn) forControlEvents:UIControlEventTouchUpInside];
    self.viewCover.alpha = 0.4;
    [self addSubview:self.viewCover];
    NSString * content = [NSString stringWithFormat:@"创建时间：%@\n物品类型：%@\n物品重量：%@\n寄件地址：%@\n收件地址：%@\n取件时间：%@",@"2018-03-22 14:33:43",@"电子产品",@"5g",@"北京市丰台区万年花城",@"北京市海淀区育新",@"2018-03-23 14:33:43"];
    CGSize size = [[LabelFitTool getLabelFit]labelAutoCalculateRectWith:content FontSize:14 MaxSize:CGSizeMake(kScreenWidth -20, 500)space:5];

    self.whiteView = [[UIView alloc]initWithFrame:CGRectMake(15, (kScreenHeight - 40 - 40 - size.height) / 2, kScreenWidth - 30, size.height + 80)];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    self.whiteView.layer.cornerRadius = 5;
    self.whiteView.layer.masksToBounds = YES;
    [self addSubview:self.whiteView];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.whiteView.frame.size.width, 40)];
    titleLabel.text = @"订单信息";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = UIColorFromRGB(0x333333);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.whiteView addSubview:titleLabel];
    
    UILabel * topLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, self.whiteView.frame.size.width, kPX1)];
    topLineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.whiteView addSubview:topLineLabel];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:content];;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, content.length)];

    //内容
    UILabel * contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, self.whiteView.frame.size.width - 20, size.height)];
    contentLabel.text = content;
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = UIColorFromRGB(0x333333);
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.whiteView addSubview:contentLabel];

    UILabel * bottomLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(contentLabel.frame), self.whiteView.frame.size.width, kPX1)];
    bottomLineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.whiteView addSubview:bottomLineLabel];

    
    //取消
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancel addTarget:self action:@selector(canCelBtn) forControlEvents:UIControlEventTouchUpInside];
    cancel.frame = CGRectMake(0, self.whiteView.frame.size.height - 40, self.whiteView.frame.size.width/2, 40);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancel setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    [self.whiteView addSubview:cancel];
    
    UIButton *save = [UIButton buttonWithType:UIButtonTypeCustom];
    [save addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
    save.frame = CGRectMake(self.whiteView.frame.size.width/2, self.whiteView.frame.size.height - 40, self.whiteView.frame.size.width/2, 40);
    [save setTitle:@"接单" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    [save setTitleColor:UIColorFromRGB(0x3aa9fd) forState:UIControlStateNormal];
    [self.whiteView addSubview:save];

}

// 取消按钮
-(void)canCelBtn{
    if (self.cancleClick) {
        self.cancleClick();
    }
}

- (void)saveBtn{
    if (self.sureClick) {
        self.sureClick();
    }
}
@end
