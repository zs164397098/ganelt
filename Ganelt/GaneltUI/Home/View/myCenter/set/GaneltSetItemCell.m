//
//  GaneltSetItemCell.m
//  Ganelt
//
//  Created by shenshen on 2018/3/17.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltSetItemCell.h"

@implementation GaneltSetItemCell

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
    
    self.nextImg = [[UIImageView alloc]init];
    [self.nextImg setImage:[UIImage imageNamed:@"icon_common_right"]];
    [self addSubview:self.nextImg];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
    [self addSubview:self.titleLabel];
    
    self.rightLabel = [[UILabel alloc] init];
    self.rightLabel.font = [UIFont systemFontOfSize:12];
    self.rightLabel.textColor = UIColorFromRGB(0x333333);
    [self addSubview:self.rightLabel];
    
    self.lineTopLabel = [[UILabel alloc]init];
    self.lineTopLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self addSubview:self.lineTopLabel];
    
    self.lineBottomLabel = [[UILabel alloc]init];
    self.lineBottomLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self addSubview:self.lineBottomLabel];
    
}

- (void)layoutSubviews{
    [self.lineTopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
        make.height.mas_equalTo(kPX1);
    }];
    
    [self.nextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.nextImg).with.offset(-13);
        make.height.mas_equalTo(20);
        make.width.mas_greaterThanOrEqualTo(0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(150, 20));
    }];
    
    [self.lineBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
        make.height.mas_equalTo(kPX1);
    }];
}
@end
