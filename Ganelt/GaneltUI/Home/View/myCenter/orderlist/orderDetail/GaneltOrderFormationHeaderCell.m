//
//  GaneltOrderFormationHeaderCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/5.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltOrderFormationHeaderCell.h"

@implementation GaneltOrderFormationHeaderCell

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
    [self addSubview:self.titleLabel];
    self.titleLabel.text = @"JS5052541521";
    
    self.statusLabel = [[UILabel alloc]init];
    self.statusLabel.font = [UIFont systemFontOfSize:12];
    self.statusLabel.textColor = UIColorFromRGB(0x333333);
    self.statusLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.statusLabel];
    self.statusLabel.text = @"已完成";
}

- (void)layoutSubviews{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(13);
        make.width.mas_equalTo(150);
    }];
    
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(-0);
        make.right.equalTo(self).with.offset(-13);
        make.width.mas_equalTo(100);
    }];
}
@end
