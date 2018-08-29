//
//  GaneltMailAddressListCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMailAddressListCell.h"

@implementation GaneltMailAddressListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, 20)];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.text = @"小明 13554521542";
    
    self.lineLabel = [[UILabel alloc]init];
    self.lineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.lineLabel];
    
    self.addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame), kScreenWidth - 20, 20)];
    self.addressLabel.font = [UIFont systemFontOfSize:13];
    self.addressLabel.textColor = UIColorFromRGB(0x333333);
    [self.contentView addSubview:self.addressLabel];
    self.addressLabel.text = @"父母afdsfasddfd";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
