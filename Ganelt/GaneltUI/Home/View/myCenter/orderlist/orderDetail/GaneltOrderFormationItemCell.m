//
//  GaneltOrderFormationItemCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/5.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltOrderFormationItemCell.h"

@implementation GaneltOrderFormationItemCell

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
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    self.titleLabel.text = @"物品";
    
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel.textColor = UIColorFromRGB(0x333333);
    self.contentLabel.numberOfLines = 0;
    [self addSubview:self.contentLabel];
    self.contentLabel.text = @"内容";

    self.topLineLabel = [[UILabel alloc]init];
    self.topLineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.topLineLabel];
    
    self.bottomLineLabel = [[UILabel alloc]init];
    self.bottomLineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.bottomLineLabel];
    
    self.rightLineLabel = [[UILabel alloc]init];
    self.rightLineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.rightLineLabel];
    
    
}

- (void)layoutSubviews{
    [self.topLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
    
    [self.bottomLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
    
    [self.rightLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(100);
        make.width.mas_equalTo(kPX1);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self.rightLineLabel.mas_left).with.offset(-0);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self.rightLineLabel.mas_right).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
    }];
}
@end
