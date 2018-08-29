//
//  GaneltWalletAllPriceCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/5.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltWalletAllPriceCell.h"

@implementation GaneltWalletAllPriceCell

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
    self.blackView = [[UIView alloc]init];
    self.blackView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:self.blackView];
    
    self.leftLabel = [[UILabel alloc]init];
    self.leftLabel.font = [UIFont systemFontOfSize:12];
    self.leftLabel.textColor = UIColorFromRGB(0x666666);
    self.leftLabel.numberOfLines = 2;
    [self addSubview:self.leftLabel];
    self.leftLabel.text = @"我的余额（元）";
    
    self.rightLabel = [[UILabel alloc]init];
    self.rightLabel.font = [UIFont systemFontOfSize:12];
    self.rightLabel.textColor = UIColorFromRGB(0x666666);
    self.rightLabel.textAlignment = NSTextAlignmentCenter;
    self.rightLabel.numberOfLines = 2;
    [self addSubview:self.rightLabel];
    self.rightLabel.text = @"我的余额（元）";
    
    self.bottomLineLabel = [[UILabel alloc]init];
    self.bottomLineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.bottomLineLabel];
    
    self.centerLineLabel = [[UILabel alloc]init];
    self.centerLineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.centerLineLabel];
}

- (void)layoutSubviews{
    [self.blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(10);
    }];
    
    [self.bottomLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
    
    [self.centerLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(10);
        make.bottom.equalTo(self).with.offset(-0);
        make.width.mas_equalTo(kPX1);
    }];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self.centerLineLabel.mas_left).with.offset(-0);
        make.bottom.equalTo(self).with.offset(-0);
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self.centerLineLabel.mas_right).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.bottom.equalTo(self).with.offset(-0);
    }];
    
}

@end
