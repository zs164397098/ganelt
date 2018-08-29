//
//  CitySelectView.m
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/27.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import "CitySelectView.h"

#define FirstComponent 0
#define SubComponent 1
#define ThirdComponent 2
@interface CitySelectView ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSString * selectStr;
    Area *area;
    City *city;
    Province *province;
    UIView *_bgview;
}
@property(nonatomic,strong)NSArray* pickerArray;//一级数组
@property(nonatomic,strong)NSArray* subPickerArray;//二级数组
@property(nonatomic,strong)NSArray* thirdPickerArray;//三级数组
@property(nonatomic,strong)NSArray* selectArray;//选择数组

@end

@implementation CitySelectView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self showSexAlertView];
    }
    return self;
}
#pragma mark - 性别弹框
- (void)showSexAlertView {
    
    self.viewCover = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.viewCover.backgroundColor = [UIColor blackColor];
    [self.viewCover addTarget:self action:@selector(canCelBtn) forControlEvents:UIControlEventTouchUpInside];
    self.viewCover.alpha = 0.4;
    [self addSubview:self.viewCover];
    
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(canCelBtn)];
//    [self.viewCover addGestureRecognizer:singleTap];
    
    CGFloat adviceHeight = (float)250 / (float)375 * kScreenWidth;
    
    _bgview = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - adviceHeight - 60 - SystemSafeAreaBottom, kScreenWidth, adviceHeight + 60 + SystemSafeAreaBottom)];
    [self addSubview:_bgview];
    
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, adviceHeight)];
    self.pickView.delegate = self;
    self.pickView.userInteractionEnabled = YES;
    self.pickView.dataSource = self;
    [_bgview addSubview:self.pickView];
    self.pickView.backgroundColor  = [UIColor whiteColor];
    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.pickView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.pickView.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.pickView.layer.mask = maskLayer;
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
    [self parseAllCity];
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
        self.sureClick(province,city,area);
    }
}
/**
 *  解析选择地址数据
 */
- (void)parseAllCity {
    NSString *str = [[NSBundle mainBundle] pathForResource:@"allcity.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:str];
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"解析错误");
    }
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *di in array) {
        Province *p = [Province mj_objectWithKeyValues:di];
        [arr addObject:p];
    }
    self.pickerArray = arr;
    
    Province *p = self.pickerArray[0];
    province = p;
    self.selectArray = p.childeList;
    if ([self.selectArray count]>0) {
        self.subPickerArray= self.selectArray;
    }
    if ([self.subPickerArray count]>0) {
        City *c = self.subPickerArray[0];
        city = c;
        self.thirdPickerArray=c.childeList;
    }
    if (self.thirdPickerArray.count != 0) {
        Area *a = [self.thirdPickerArray objectAtIndex:0];
        area = a;
    }
    
}
#pragma mark - UIPickerViewDataSource
//共有几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component==FirstComponent) {
        return [self.pickerArray count];
    }
    if (component==SubComponent) {
        return [self.subPickerArray count];
    }
    if (component==ThirdComponent) {
        return [self.thirdPickerArray count];
    }
    return 0;
    
}
//每行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component==FirstComponent && self.pickerArray.count > 0) {
        Province *p = [self.pickerArray objectAtIndex:row];
        return p.cityName;
    }
    if (component==SubComponent && self.subPickerArray.count > 0) {
        City *c = [self.subPickerArray objectAtIndex:row];
        return c.cityName;
    }
    if (component==ThirdComponent && self.thirdPickerArray.count > 0) {
        
        Area *a = [self.thirdPickerArray objectAtIndex:row];
        return a.cityName;
    }
    return nil;
}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0) {
        province = self.pickerArray[row];
        self.selectArray = province.childeList;
        if (self.selectArray.count > 0) {
            self.subPickerArray = self.selectArray;
        }else {
            self.subPickerArray = nil;
        }
        
        if (self.subPickerArray.count > 0) {
            city = self.subPickerArray[0];
            self.thirdPickerArray = city.childeList;
        }else {
            self.thirdPickerArray = nil;
        }
        
        if (self.thirdPickerArray.count > 0) {
            area = self.thirdPickerArray[0];
        }
        selectStr = [NSString stringWithFormat:@"%@%@%@",province.cityName,city.cityName,area.cityName];
        
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        
    }
    if (component==1) {
        city = self.subPickerArray[row];
        if ([self.selectArray count]>0&&[self.subPickerArray count]>0) {
            self.thirdPickerArray = city.childeList;
        }else{
            self.thirdPickerArray=nil;
        }
        
        if (self.thirdPickerArray.count > 0) {
            area = self.thirdPickerArray[0];
        }
        selectStr = [NSString stringWithFormat:@"%@%@%@",province.cityName,city.cityName,area.cityName];
        
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        
    }
    if (component == 2) {
        if ([self.selectArray count]>0&&[self.thirdPickerArray count]>0) {
            area = self.thirdPickerArray[row];
            selectStr = [NSString stringWithFormat:@"%@%@%@",province.cityName,city.cityName,area.cityName];
        }
        if (province.cityName.length ==0 || city.cityName.length == 0) {
//            self.selectProvince_Code = @"110";
//            self.selectedCity_Code = @"110000";
            selectStr = [NSString stringWithFormat:@"%@%@%@",@"北京",@"北京市",area.cityName];
            
        }
        
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
