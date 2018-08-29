//
//  PickSelectview.m
//  ZNKEGJ
//
//  Created by lhb on 2017/3/15.
//  Copyright © 2017年 yy. All rights reserved.
//

#import "PickSelectview.h"

@implementation PickSelectview
{
    NSString * selectStr;
    NSInteger index;
    UIView *_bgview;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self showSexAlertView];
    }
    return self;
}
#pragma mark - 性别弹框
/**
 *  gender  1:男  其它:女
 */
- (void)showSexAlertView {
    
    self.viewCover = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.viewCover.backgroundColor = [UIColor blackColor];
    [self.viewCover addTarget:self action:@selector(canCelBtn) forControlEvents:UIControlEventTouchUpInside];
    self.viewCover.alpha = 0.4;
    [self addSubview:self.viewCover];
    
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(canCelBtn)];
//    [self.viewCover addGestureRecognizer:singleTap];
    _bgview = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 210 - SystemSafeAreaBottom, kScreenWidth, 210 + SystemSafeAreaBottom)];
    [self addSubview:_bgview];
    
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, 150)];
    self.pickView.delegate = self;
    self.pickView.userInteractionEnabled = YES;
    self.pickView.dataSource = self;
    [_bgview addSubview:self.pickView];
    self.pickView.backgroundColor  = [UIColor whiteColor];
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.pickView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(15, 15)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.pickView.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.pickView.layer.mask = maskLayer;
    self.pickView.layer.cornerRadius = 12;
    self.pickView.layer.masksToBounds = YES;


    [self textFieldInputAccessoryView];
    
}

/**
 *  键盘上方InputAccessoryView
 *
 */
- (void)textFieldInputAccessoryView {
    self.inputview = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.pickView.frame) + 5, kScreenWidth - 20, 50)];
    self.inputview.backgroundColor = [UIColor whiteColor];
    self.inputview.layer.cornerRadius = 12;
    self.inputview.layer.masksToBounds = YES;
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancel addTarget:self action:@selector(canCelBtn) forControlEvents:UIControlEventTouchUpInside];
    cancel.frame = CGRectMake(0, 0, kScreenWidth/2 - 10, 50);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancel setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    [self.inputview addSubview:cancel];
    
    UIButton *save = [UIButton buttonWithType:UIButtonTypeCustom];
    [save addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
    save.frame = CGRectMake(kScreenWidth/2 - 10, 0, kScreenWidth/2 - 10, 50);
    [save setTitle:@"确认" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    [save setTitleColor:UIColorFromRGB(0x3aa9fd) forState:UIControlStateNormal];
    [self.inputview addSubview:save];
    
    UIView *centerline = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth/2 - 10, 0, kPX1, 50)];
    centerline.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.inputview addSubview:centerline];
    
    [_bgview addSubview:self.inputview];
}
// 取消按钮
-(void)canCelBtn{
    if (self.cancleClick) {
        self.cancleClick();
    }
}
// 确认按钮
-(void)saveBtn{
    
    if (self.sureClick) {
        if (selectStr.length == 0) {
            index = 0;
        }
        self.sureClick(index);
    }
}
#pragma mark - UIPickerViewDataSource
//共有几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.Arry.count;
}
//每行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * str = self.Arry[row];
    return str;
}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selectStr = self.Arry[row];
    index = row;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = UIColorFromRGB(0xf0f0f0);
        }
    }
    /*重新定义row 的UILabel*/
    UILabel *pickerLabel = (UILabel*)view;
    
    if (!pickerLabel){
        
        pickerLabel = [[UILabel alloc] init];
        [pickerLabel setTextColor:[UIColor blackColor]];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:18.0f]];
    }
    pickerLabel.text = self.Arry[row];
    return pickerLabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
