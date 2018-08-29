//
//  GaneltGoodsFormItemCollectionViewCell.m
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltGoodsFormItemCollectionViewCell.h"

@implementation GaneltGoodsFormItemCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.imgView  = [[UIImageView alloc]init];
    self.imgView.frame = CGRectMake(10, CGRectGetMaxY(self.imgView.frame), self.bounds.size.width- 20, self.frame.size.height - 20);
    [self.contentView addSubview:self.imgView];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imgView.frame), self.frame.size.width, 20);
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
}
@end
