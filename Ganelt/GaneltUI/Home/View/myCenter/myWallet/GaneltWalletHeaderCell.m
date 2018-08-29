//
//  GaneltWalletHeaderCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/5.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltWalletHeaderCell.h"

@implementation GaneltWalletHeaderCell

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
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textColor = UIColorFromRGB(0x666666);
    [self addSubview:self.titleLabel];
    self.titleLabel.text = @"我的余额（元）";
    
    self.priceLabel = [[UILabel alloc]init];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    self.priceLabel.textColor = UIColorFromRGB(0x333333);
    [self addSubview:self.priceLabel];
    self.priceLabel.text = @"900元";
    
    self.rechargeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rechargeBtn setTitle:@"充值" forState:UIControlStateNormal];
    [self.rechargeBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    self.rechargeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.rechargeBtn.layer.cornerRadius = 5;
    self.rechargeBtn.layer.borderColor = UIColorFromRGB(0xf0f0f0).CGColor;
    self.rechargeBtn.layer.borderWidth = kPX1;
    self.rechargeBtn.backgroundColor = UIColorFromRGB(0x3ca9fd);
    [self.contentView addSubview:self.rechargeBtn];
    
    self.reflectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.reflectBtn setTitle:@"提现" forState:UIControlStateNormal];
    [self.reflectBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    self.reflectBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.reflectBtn.layer.cornerRadius = 5;
    self.reflectBtn.layer.borderColor = UIColorFromRGB(0xf0f0f0).CGColor;
    self.reflectBtn.layer.borderWidth = kPX1;
    self.reflectBtn.backgroundColor = UIColorFromRGB(0x3ca9fd);
    [self.contentView addSubview:self.reflectBtn];
}

- (void)layoutSubviews{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];

    [self.rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(30);
        make.right.equalTo(self).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [self.reflectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(30);
        make.right.equalTo(self.rechargeBtn.mas_left).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
}
@end
