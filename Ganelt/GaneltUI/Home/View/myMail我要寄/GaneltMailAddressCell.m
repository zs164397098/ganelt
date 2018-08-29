//
//  GaneltMailAddressCell.m
//  Ganelt
//
//  Created by shenshen on 2018/1/23.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMailAddressCell.h"

@implementation GaneltMailAddressCell

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
    self.leftImg = [[UIImageView alloc]init];
    [self.contentView addSubview:self.leftImg];
    
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    self.contentLabel.textColor = UIColorFromRGB(0x333333);
    [self.contentView addSubview:self.contentLabel];

    self.lineLabel = [[UILabel alloc]init];
    self.lineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self addSubview:self.lineLabel];

}

- (void)layoutSubviews{
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(13);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self.leftImg.mas_right).with.offset(13);
        make.right.equalTo(self).with.offset(13);

        make.height.mas_equalTo(40);
    }];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
}
@end
