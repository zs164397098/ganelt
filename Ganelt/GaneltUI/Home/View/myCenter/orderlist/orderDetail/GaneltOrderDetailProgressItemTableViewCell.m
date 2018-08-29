//
//  GaneltOrderDetailProgressItemTableViewCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/3.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltOrderDetailProgressItemTableViewCell.h"

@implementation GaneltOrderDetailProgressItemTableViewCell

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
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
    [self addSubview:self.titleLabel];
    self.titleLabel.text = @"取件成功";
    
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = UIColorFromRGB(0x333333);
    [self addSubview:self.timeLabel];
    self.timeLabel.text = @"2018-03-01";
    
    self.circleLabel = [[UILabel alloc]init];
    self.circleLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    self.circleLabel.layer.cornerRadius = 5;
    self.circleLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:self.circleLabel];

    self.lineLabel = [[UILabel alloc]init];
    self.lineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.contentView addSubview:self.lineLabel];
}

- (void)initFrame:(hiddenType)type{
    self.timeLabel.frame = CGRectMake(10, 10, 90, 20);
    self.circleLabel.frame = CGRectMake(CGRectGetMaxX(self.timeLabel.frame), 15, 10, 10);
    if (type == defaultsHidden) {
        self.lineLabel.frame = CGRectMake(CGRectGetMaxX(self.timeLabel.frame) + 5, 0, kPX1, 40);
    }else if (type == topHidden){
        self.lineLabel.frame = CGRectMake(CGRectGetMaxX(self.timeLabel.frame) + 5, 15, kPX1, 25);
    }else{
        self.lineLabel.frame = CGRectMake(CGRectGetMaxX(self.timeLabel.frame) + 5, 0, kPX1, 15);
    }
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.circleLabel.frame) + 5, 10, 150, 20);
}
@end
