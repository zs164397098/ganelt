/*****************************************************************
 文件名称：DatePickView.m
 作   者：lixiao
 备   注：
 创建时间：2016-1-12
 版权声明：Copyright (c) 2015 李晓亮. All rights reserved.
 *****************************************************************/

#import "DatePickView.h"
@interface DatePickView()
{
    UIDatePicker *dataPicker;
    UIView *_bgview;
}

@end
@implementation DatePickView

-(NSString *)dateFormat {
    return @"yyyy-MM-dd";
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.viewCover = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.viewCover.backgroundColor = [UIColor blackColor];
        [self.viewCover addTarget:self action:@selector(cancelclick:) forControlEvents:UIControlEventTouchUpInside];
        self.viewCover.alpha = 0.4;
        [self addSubview:self.viewCover];

        CGFloat adviceHeight = (float)250 / (float)375 * kScreenWidth;

        _bgview = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - adviceHeight - 50 - SystemSafeAreaBottom - 10, kScreenWidth, adviceHeight + 60 + SystemSafeAreaBottom)];
        [self addSubview:_bgview];
        ///初始日期选择控件
        dataPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, adviceHeight)];
        dataPicker.backgroundColor  = [UIColor whiteColor];
        dataPicker.userInteractionEnabled = YES;
        //日期模式
        [dataPicker setDatePickerMode:UIDatePickerModeDate];
        [dataPicker addTarget:self action:@selector(dataValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_bgview addSubview:dataPicker];
        
        dataPicker.layer.cornerRadius = 12;
        dataPicker.layer.masksToBounds = YES;
        

     
        [self textFieldInputAccessoryView];
    }
    return self;
}

- (void)textFieldInputAccessoryView {
    UIView *inputview = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(dataPicker.frame) + 5, kScreenWidth - 20, 50)];
    inputview.backgroundColor = [UIColor whiteColor];
    inputview.layer.cornerRadius = 12;
    inputview.layer.masksToBounds = YES;
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancel addTarget:self action:@selector(cancelclick:) forControlEvents:UIControlEventTouchUpInside];
    cancel.frame = CGRectMake(0, 0, kScreenWidth/2 - 10, 50);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancel setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    [inputview addSubview:cancel];
    
    UIButton *save = [UIButton buttonWithType:UIButtonTypeCustom];
    [save addTarget:self action:@selector(sureclick:) forControlEvents:UIControlEventTouchUpInside];
    save.frame = CGRectMake(kScreenWidth/2 - 10, 0, kScreenWidth/2 - 10, 50);
    [save setTitle:@"确认" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    [save setTitleColor:UIColorFromRGB(0x3aa9fd) forState:UIControlStateNormal];
    [inputview addSubview:save];
    
    UIView *centerline = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth/2 - 10, 0, kPX1, 50)];
    centerline.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [inputview addSubview:centerline];
    
    [_bgview addSubview:inputview];
}

-(void)setMinDate:(NSDate *)minDate {
    [dataPicker setMinimumDate:minDate];
}

-(void)setMaxDate:(NSDate *)maxDate {
    [dataPicker setMaximumDate:maxDate];
}

//datapicker值攺变事件
- (void) dataValueChanged:(UIDatePicker *)sender
{
    UIDatePicker *dataPicker_one = (UIDatePicker *)sender;
    NSDate *date_one = dataPicker_one.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:self.dateFormat];
    NSString *string = [formatter stringFromDate:date_one];
    NSLog(@"string ----> %@",string);
    self.dateStr = string;
    formatter = nil;
  
}

- (void)cancelclick:(UIButton *)sender{
    if (self.cancelClick) {
        self.cancelClick();
    }
}

- (void)sureclick:(UIButton *)sender{
    if (self.sureClick) {
        NSDate *date_one = dataPicker.date;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:self.dateFormat];
        NSString *string = [formatter stringFromDate:date_one];
        NSLog(@"string ----> %@",string);
        self.dateStr = string;
        self.sureClick(self.dateStr);
    }
}


@end
