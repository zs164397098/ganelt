//
//  GaneltWalletItemCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/5.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltWalletItemCell.h"

@implementation GaneltWalletItemCell

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
    self.iconImg.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.iconImg];
    
    
    self.nextImg = [[UIImageView alloc]init];
    [self.nextImg setImage:[UIImage imageNamed:@"icon_common_right"]];
    [self addSubview:self.nextImg];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = UIColorFromRGB(0x505050);
    [self addSubview:self.titleLabel];
    
    self.lineBottomLabel = [[UILabel alloc]init];
    self.lineBottomLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self addSubview:self.lineBottomLabel];
    
}

- (void)layoutSubviews{
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    
    [self.nextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self.iconImg.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [self.lineBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
        make.height.mas_equalTo(kPX1);
    }];
}
@end
