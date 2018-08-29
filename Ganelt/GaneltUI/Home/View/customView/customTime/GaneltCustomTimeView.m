//
//  GaneltCustomTimeView.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/2.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltCustomTimeView.h"

@interface GaneltCustomTimeView ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSString * selectStr;
    UIView *_bgview;
    
    BOOL isSame;//判断选择的时间和当前时间是否一样 一样的话做限制
    NSString * todayHHStr;
    NSString * todayMMStr;

    NSString * selectHHStr;
    NSString * selectMMStr;

}
@property(nonatomic,strong)NSArray* pickerArray;//一级数组
@property(nonatomic,strong)NSArray* subPickerArray;//二级数组

@end

@implementation GaneltCustomTimeView

-(instancetype)initWithFrame:(CGRect)frame selectDate:(NSString *)selectDate{
    self = [super initWithFrame:frame];
    if (self) {
        isSame = NO;
        self.selectDate = selectDate;
        [self showTimeAlertView];
    }
    return self;
}
#pragma mark - 性别弹框
- (void)showTimeAlertView {
    self.pickerArray = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24"];
    self.subPickerArray = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60"];
    
    self.viewCover = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.viewCover.backgroundColor = [UIColor blackColor];
    [self.viewCover addTarget:self action:@selector(canCelBtn) forControlEvents:UIControlEventTouchUpInside];
    self.viewCover.alpha = 0.4;
    [self addSubview:self.viewCover];
    
    CGFloat adviceHeight = (float)250 / (float)375 * kScreenWidth;
    
    _bgview = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - adviceHeight - 60 - SystemSafeAreaBottom, kScreenWidth, adviceHeight + 60 + SystemSafeAreaBottom)];
    [self addSubview:_bgview];
    
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, adviceHeight)];
    self.pickView.delegate = self;
    self.pickView.userInteractionEnabled = YES;
    self.pickView.dataSource = self;
    [_bgview addSubview:self.pickView];
    self.pickView.backgroundColor  = [UIColor whiteColor];
    
    self.pickView.layer.cornerRadius = 12;
    self.pickView.layer.masksToBounds = YES;
    
    for(UIView *singleLine in self.pickView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = UIColorFromRGB(0xf0f0f0);
        }
    }
    
    [self textFieldInputAccessoryView];
}
/**
 *  键盘上方InputAccessoryView
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
    
    [self initDate];
}

- (void)initDate{
    NSDate * date = [NSDate date];
    NSDateFormatter * matter = [[NSDateFormatter alloc]init];
    [matter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * currentDate = [matter stringFromDate:date];
    
    NSArray * array = [currentDate componentsSeparatedByString:@" "];
    NSString * array1Str = [array objectAtIndex:0];
    if ([array1Str containsString:self.selectDate]) {
        //判断选择的时间和当前时间是否一样 一样的话做限制
        NSArray * array1 = [[array objectAtIndex:1]componentsSeparatedByString:@":"];
        todayHHStr = array1[0];
        todayMMStr = array1[1];
        isSame = YES;
        if ([todayHHStr intValue] > [selectHHStr intValue] && todayHHStr.length != 0) {
            NSInteger indxe = [self.pickerArray indexOfObject:todayHHStr];
            [self.pickView selectRow:indxe inComponent:0 animated:YES];
            selectHHStr = self.pickerArray[indxe];
            
            NSInteger MMindxe = [self.subPickerArray indexOfObject:todayMMStr];
            [self.pickView selectRow:MMindxe inComponent:1 animated:YES];
            
            selectStr = [NSString stringWithFormat:@"%@:%@",selectHHStr,self.subPickerArray[MMindxe]];
        }
        
    }

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
        self.sureClick(selectStr);
    }
}
#pragma mark - UIPickerViewDataSource
//共有几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component==0) {
        return [self.pickerArray count];
    }
    if (component==1) {
        return [self.subPickerArray count];
    }
    
    return 0;
    
}
//每行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component==0 ) {
        NSString * str = self.pickerArray[row];
        return str;
    }
    if (component==1) {
        NSString * str = self.subPickerArray[row];
        return str;
    }
   
    return nil;
}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0) {
        if (isSame == YES) {
            selectHHStr = self.pickerArray[row];
            if ([todayHHStr intValue] > [selectHHStr intValue] && todayHHStr.length != 0) {
                NSInteger indxe = [self.pickerArray indexOfObject:todayHHStr];
                [self.pickView selectRow:indxe inComponent:0 animated:YES];
                selectHHStr = self.pickerArray[indxe];

                NSInteger MMindxe = [self.subPickerArray indexOfObject:todayMMStr];
                [self.pickView selectRow:MMindxe inComponent:1 animated:YES];
                
                selectStr = [NSString stringWithFormat:@"%@:%@",selectHHStr,self.subPickerArray[MMindxe]];
            }else{
                selectStr = selectHHStr;
            }
        }
        [pickerView reloadComponent:1];
    }
    if (component==1) {
        selectMMStr = self.subPickerArray[row];
        if ([todayMMStr intValue] > [selectMMStr intValue] && selectMMStr.length != 0) {
            NSInteger indxe = [self.subPickerArray indexOfObject:todayMMStr];
            [self.pickView selectRow:indxe inComponent:1 animated:YES];
            selectStr = [NSString stringWithFormat:@"%@:%@",selectHHStr,selectMMStr];
        }else{
            selectStr = selectMMStr;
        }
        [pickerView reloadComponent:1];
        
    }
   
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
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;
}
@end
