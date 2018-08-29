//
//  GaneltOrderDetailProgressHeaderCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/3.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltOrderDetailProgressHeaderCell.h"

@implementation GaneltOrderDetailProgressHeaderCell

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
    self.iconImg.layer.masksToBounds = YES;
    self.iconImg.layer.cornerRadius = 23;
    self.iconImg.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.iconImg.layer.borderWidth = 1;
    self.iconImg.image = [UIImage imageNamed:@"myDefault"];
    [self addSubview:self.iconImg];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
    [self addSubview:self.titleLabel];
    self.titleLabel.text = @"李师傅";
    
    self.serviceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.serviceBtn setTitle:@"评论服务" forState:UIControlStateNormal];
    [self.serviceBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    self.serviceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.serviceBtn.layer.cornerRadius = 5;
    self.serviceBtn.layer.borderColor = UIColorFromRGB(0xf0f0f0).CGColor;
    self.serviceBtn.layer.borderWidth = kPX1;
    self.serviceBtn.backgroundColor = UIColorFromRGB(0x3ca9df);
    [self.contentView addSubview:self.serviceBtn];

    self.lineLabel = [[UILabel alloc]init];
    self.lineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.lineLabel];

}

- (void)layoutSubviews{
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(46, 46));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(24);
        make.left.equalTo(self.iconImg.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [self.serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
}
@end
