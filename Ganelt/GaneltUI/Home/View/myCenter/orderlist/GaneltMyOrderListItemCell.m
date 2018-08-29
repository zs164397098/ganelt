//
//  GaneltMyOrderListItemCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/3.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMyOrderListItemCell.h"

@implementation GaneltMyOrderListItemCell

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
    
    self.orderNumLabel = [[UILabel alloc]init];
    self.orderNumLabel.font = [UIFont systemFontOfSize:14];
    self.orderNumLabel.textColor = UIColorFromRGB(0x333333);
    [self.contentView addSubview:self.orderNumLabel];
    self.orderNumLabel.text = @"js050102102100";
    
    self.nextImg = [[UIImageView alloc]init];
    self.nextImg.image = [UIImage imageNamed:@"icon_jaintou_pull_right_white"];
    self.nextImg.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:self.nextImg];
    
    self.orderImg = [[UIImageView alloc]init];
    self.orderImg.image = [UIImage imageNamed:@"mailAddress"];
    self.orderImg.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:self.orderImg];

    
    self.lineOneLabel = [[UILabel alloc]init];
    self.lineOneLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.lineOneLabel];

    self.lineTwoLabel = [[UILabel alloc]init];
    self.lineTwoLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.lineTwoLabel];

    self.fromeAddressLabel = [[UILabel alloc]init];
    self.fromeAddressLabel.font = [UIFont systemFontOfSize:12];
    self.fromeAddressLabel.textColor = UIColorFromRGB(0x333333);
    [self.contentView addSubview:self.fromeAddressLabel];
    self.fromeAddressLabel.text = @"寄：中关村科技园区服务中心";
    
    self.toAddressLabel = [[UILabel alloc]init];
    self.toAddressLabel.font = [UIFont systemFontOfSize:12];
    self.toAddressLabel.textColor = UIColorFromRGB(0x333333);
    [self.contentView addSubview:self.toAddressLabel];
    self.toAddressLabel.text = @"收：中关村软件园互联创新中心";
    
    self.createTimeLabel = [[UILabel alloc]init];
    self.createTimeLabel.font = [UIFont systemFontOfSize:14];
    self.createTimeLabel.textColor = UIColorFromRGB(0x333333);
    [self.contentView addSubview:self.createTimeLabel];
    self.createTimeLabel.text = @"2015-01-25 14:33:44";
}

- (void)layoutSubviews{
    
    [self.nextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.orderImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];

    
    [self.orderNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(46);
        make.size.mas_equalTo(CGSizeMake(150, 40));
    }];
    
    [self.lineOneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderNumLabel.mas_bottom).with.offset(0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
    
    [self.fromeAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineOneLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];
    
    [self.toAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fromeAddressLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];
    
    [self.lineTwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.toAddressLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
    
    [self.createTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineTwoLabel.mas_bottom).with.offset(0);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
}
@end
