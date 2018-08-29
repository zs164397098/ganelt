//
//  GaneltMailAddNewAddressCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMailAddNewAddressCell.h"

@implementation GaneltMailAddNewAddressCell

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
    //    self.nextImg = [[UIImageView alloc]init];
    //    [self.nextImg setImage:[UIImage imageNamed:@"icon_common_right"]];
    //    [self addSubview:self.nextImg];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
    [self addSubview:self.titleLabel];
    
    self.contentTextFiled = [[UITextField alloc]init];
    self.contentTextFiled.font = [UIFont systemFontOfSize:14];
    self.contentTextFiled.textColor = UIColorFromRGB(0x333333);
    self.contentTextFiled.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.contentTextFiled];
    
    self.lineBottomLabel = [[UILabel alloc]init];
    self.lineBottomLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self addSubview:self.lineBottomLabel];
}

- (void)layoutSubviews{
    
    //    [self.nextImg mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self).with.offset(10);
    //        make.right.equalTo(self).with.offset(-13);
    //        make.size.mas_equalTo(CGSizeMake(20, 20));
    //    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [self.contentTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self.titleLabel.mas_left).with.offset(10);
        //        make.right.equalTo(self.nextImg.mas_left).with.offset(-10);
        make.right.equalTo(self).with.offset(-13);
        make.height.mas_equalTo(20);
    }];
    
    
    [self.lineBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-0);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-0);
        make.height.mas_equalTo(kPX1);
    }];
}
@end
