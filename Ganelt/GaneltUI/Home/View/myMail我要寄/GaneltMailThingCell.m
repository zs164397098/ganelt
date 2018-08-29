//
//  GaneltMailThingCell.m
//  Ganelt
//
//  Created by shenshen on 2018/1/23.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMailThingCell.h"

@implementation GaneltMailThingCell

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
    [self.contentView addSubview:self.nextImg];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
    [self.contentView addSubview:self.titleLabel];
    
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectBtn setTitle:@"" forState:UIControlStateNormal];
    [self.selectBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    self.selectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.selectBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 1);
//    self.selectBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    self.selectBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.selectBtn];
    
    self.lineLabel = [[UILabel alloc]init];
    self.lineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self addSubview:self.lineLabel];

}

- (void)layoutSubviews{
    [self.nextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.right.equalTo(self.nextImg.mas_left).with.offset(-13);
        make.size.mas_equalTo(CGSizeMake(150, 40));
    }];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
    
}
@end
