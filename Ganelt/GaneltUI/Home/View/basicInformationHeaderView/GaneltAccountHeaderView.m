//
//  GaneltAccountHeaderView.m
//  Ganelt
//
//  Created by shenshen on 2018/1/24.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltAccountHeaderView.h"

@implementation GaneltAccountHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf0f0f0);
        
        UIImageView * bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth,80)];
        self.bgView = bgView;
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.userInteractionEnabled = YES;
        [self addSubview:bgView];
        
        
        UILabel * label = [[UILabel alloc]init];
        label.frame = CGRectMake(13.5, 25, 100, 30);
        label.text = @"我的头像";
        label.textColor = UIColorFromRGB(0x333333);
        label.font = [UIFont systemFontOfSize:16.0f];
        label.textAlignment = 0;
        [bgView addSubview:label];
        
        
        self.iconImage = [[UIImageView alloc]init];
        self.iconImage.frame = CGRectMake(bgView.frame.size.width - 60 - 10, 10, 60, 60);
        [bgView addSubview:self.iconImage];
    }
    return self;
}

@end
