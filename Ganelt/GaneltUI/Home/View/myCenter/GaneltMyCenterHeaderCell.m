//
//  GaneltMyCenterHeaderCell.m
//  Ganelt
//
//  Created by shenshen on 2018/1/24.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMyCenterHeaderCell.h"

@implementation GaneltMyCenterHeaderCell

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
        self.backgroundColor = UIColorFromRGB(0x3ca9fd);
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
    [self addSubview:self.iconImg];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    self.titleLabel.text = @"登录/注册";
    
    self.nextImg = [[UIImageView alloc]init];
    self.nextImg.image = [UIImage imageNamed:@"icon_jaintou_pull_right_white"];
    self.nextImg.contentMode = UIViewContentModeCenter;
    [self addSubview:self.nextImg];
    
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
    
    [self.nextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(24);
        make.right.equalTo(self).with.offset(-11);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
}
@end
