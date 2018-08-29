//
//  GaneltPayOrderPayStyleCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/1.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltPayOrderPayStyleCell.h"

@implementation GaneltPayOrderPayStyleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    self.iconImg = [[UIImageView alloc]init];
    [self addSubview:self.iconImg];
    
    self.orderStyleLabel = [[UILabel alloc]init];
    self.orderStyleLabel.font = [UIFont systemFontOfSize:14];
    self.orderStyleLabel.textColor = UIColorFromRGB(0x333333);
    [self addSubview:self.orderStyleLabel];
    self.orderStyleLabel.text = @"支付宝支付";
    
    self.rightImg = [[UIImageView alloc]init];
    [self addSubview:self.rightImg];
    
}
- (void)layoutSubviews{
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.orderStyleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(20);
        make.left.equalTo(self.iconImg.mas_right).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
}
@end
