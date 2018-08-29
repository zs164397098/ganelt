//
//  GaneltDetailAddressCell.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltDetailAddressCell.h"

@implementation GaneltDetailAddressCell

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
    self.detailAddressTextView = [[UITextView alloc] initWithFrame:CGRectMake(5, 0, kScreenWidth -10, 100)];
    //设置是否可以编辑
    self.detailAddressTextView.editable = YES;
    self.detailAddressTextView.delegate = self;
    self.detailAddressTextView.textColor = UIColorFromRGB(0x828282);
    self.detailAddressTextView.font = [UIFont systemFontOfSize:14];
    self.detailAddressTextView.scrollEnabled = NO;
    [self addSubview:self.detailAddressTextView];
    
    self.placeLabel = [[UILabel alloc]init];
    self.placeLabel.frame = CGRectMake(5, 6, kScreenWidth-10, 20);
    self.placeLabel.backgroundColor = [UIColor whiteColor];
    self.placeLabel.numberOfLines = 0;
    self.placeLabel.textColor = UIColorFromRGB(0x999999);
    self.placeLabel.font = [UIFont systemFontOfSize:14.0f];
    self.placeLabel.text = @"请填写详细地址，不少于5个字。";
    [self.detailAddressTextView addSubview:self.placeLabel];
    
    self.lineBottomLabel = [[UILabel alloc]init];
    self.lineBottomLabel.frame = CGRectMake(0, 100, kScreenHeight, kPX1);
    self.lineBottomLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self addSubview:self.lineBottomLabel];
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length != 0) {
        self.placeLabel.hidden = YES;
    }else {
        self.placeLabel.hidden = NO;
    }
}
@end
