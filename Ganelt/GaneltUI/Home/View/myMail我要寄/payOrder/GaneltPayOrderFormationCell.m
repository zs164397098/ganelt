//
//  GaneltPayOrderFormationCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/1.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltPayOrderFormationCell.h"

@implementation GaneltPayOrderFormationCell

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
    self.orderFormationLabel = [[UILabel alloc]init];
    self.orderFormationLabel.font = [UIFont systemFontOfSize:12];
    self.orderFormationLabel.textColor = UIColorFromRGB(0x333333);
    self.orderFormationLabel.numberOfLines = 0;
    self.orderFormationLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.contentView addSubview:self.orderFormationLabel];
}

- (void)layoutSubviews{
    [self.orderFormationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self).with.offset(-10);
    }];
}
@end
