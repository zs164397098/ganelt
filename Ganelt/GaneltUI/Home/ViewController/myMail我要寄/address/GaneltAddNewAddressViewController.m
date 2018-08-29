//
//  GaneltAddNewAddressViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltAddNewAddressViewController.h"
#import "GaneltMailAddNewAddressCell.h"
#import "GaneltDetailAddressCell.h"
#import "GaneltAddressFormationModel.h"
@interface GaneltAddNewAddressViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate>{
    BOOL keyBoardHiden;//判断键盘是否弹出来
    NSInteger keyBoardHeight;
    Province * _provinceModel;
    City * _cityModel;
    Area * _areaModel;
    NSString * sexStr;//性别
    NSMutableArray * dataArray;

}
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * placeArray;

@end

@implementation GaneltAddNewAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"地址"];
    [self.view addSubview:self.mainTableView];
    [self createRightBtn];
    self.titleArray = @[@"姓名",@"性别",@"手机号",@"地址"];
    self.placeArray = @[@"请输入真实的姓名",@"请选择",@"请输入手机号",@"请选择"];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    keyBoardHiden = NO;

    // Do any additional setup after loading the view.
}
//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    keyBoardHeight = keyboardRect.size.height;
    [self textFiledBegain];
}
- (void)createRightBtn{
    [self setRightNavigationBarItem:@"保存" image:nil target:self selector:@selector(rightClick)];
}
//点击保存
- (void)rightClick{
    UITextField * numtextView = (UITextField *)[self.view viewWithTag:8585];
    UITextField * namenumFiled = (UITextField *)[self.view viewWithTag:10];
    UITextField * phonenumFiled = (UITextField *)[self.view viewWithTag:12];
    
    if (numtextView.text.length == 0 ||_areaModel.cityCode.length == 0 || _cityModel.cityCode.length == 0 || namenumFiled.text.length == 0 || phonenumFiled.text.length == 0 || _provinceModel.cityCode.length == 0 || sexStr.length == 0) {
        [[MBProgressHUDManager getInstance]showMessage:@"输入联系人信息" duration:1];
    }else {
        if (![JudgeMobileNumber isMobile:phonenumFiled.text]){
            [[MBProgressHUDManager getInstance]showMessage:@"手机号不正确" duration:1];
        }else if (numtextView.text.length < 2 || numtextView.text.length > 128){
            [[MBProgressHUDManager getInstance]showMessage:@"详细地址不和法" duration:1];
        }else {
            //保存
            GaneltAddressFormationModel * model = [[GaneltAddressFormationModel alloc]init];
            model.provinceCode = _provinceModel.cityCode;
            model.cityCode = _cityModel.cityCode;
            model.areaCode = _areaModel.cityCode;
            model.provinceName = _provinceModel.cityName;
            model.cityName = _cityModel.cityName;
            model.areaName = _areaModel.cityName;
            model.name = namenumFiled.text;
            model.phoneNum = phonenumFiled.text;
            model.sexStr = sexStr;
            model.addressDetail = numtextView.text;
            NSDate * date = [NSDate date];
            NSDateFormatter * matter = [[NSDateFormatter alloc]init];
            [matter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            model.time = [matter stringFromDate:date];
            [[GaneltAddressEntityManager sharedInstance]insterEntityData:model];
            [[MBProgressHUDManager getInstance]showMessage:@"保存成功" duration:1];
            [self.delgate newAddressStr];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavigaHeight,kScreenWidth ,kScreenHeight - NavigaHeight - SystemSafeAreaBottom) style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltMailAddNewAddressCell class] forCellReuseIdentifier:@"GaneltMailAddNewAddressCell"];
        [_mainTableView registerClass:[GaneltDetailAddressCell class] forCellReuseIdentifier:@"GaneltDetailAddressCell"];
    }
    return _mainTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.titleArray.count <= indexPath.row) {
        return 100;
    }
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.titleArray.count) {
        GaneltMailAddNewAddressCell * cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"GaneltMailAddNewAddressCell"];
        cell.titleLabel.text = [self.titleArray objectAtIndex:indexPath.row];
        cell.contentTextFiled.placeholder = [self.placeArray objectAtIndex:indexPath.row];
        cell.contentTextFiled.delegate = self;
        cell.contentTextFiled.tag = indexPath.row + 10;
        cell.nextImg.hidden = YES;
        if (indexPath.row == 1 | indexPath.row == 3 ){
            cell.nextImg.hidden = NO;
            cell.contentTextFiled.enabled = NO;
            if (indexPath.row == 1 && sexStr.length != 0) {
                cell.contentTextFiled.text = sexStr;
            }else if (indexPath.row ==3 && _provinceModel.cityName.length != 0){
                cell.contentTextFiled.text = [NSString stringWithFormat:@"%@%@%@",_provinceModel.cityName,_cityModel.cityName,_areaModel.cityName];
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }else {
        GaneltDetailAddressCell * cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"GaneltDetailAddressCell"];
        cell.detailAddressTextView.tag = 8585;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self handleSingleTap:indexPath.row+10];
}

//textfiled 是否可以编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField.tag == 11 || textField.tag == 13 ) {
        return NO;
    } else {
        return YES;
    }
}
- (void)textFiledBegain{
    
    for (int i = 0; i< self.titleArray.count; i++) {
        UITextField * numFiled = (UITextField *)[self.view viewWithTag:10 + i];
        if ([numFiled isFirstResponder] ) {
            if (self.mainTableView.frame.size.height - (keyBoardHeight ) >  40 * (i + 1) || self.mainTableView.frame.size.height - (keyBoardHeight ) >   40 * (i + 1) - self.mainTableView.contentOffset.y) {
                
            } else {
                self.mainTableView.contentOffset = CGPointMake(0, 40 * (i + 1)  - (self.mainTableView.frame.size.height - (keyBoardHeight )));
            }
        }
        
    }
    
    UITextField * numtextView = (UITextField *)[self.view viewWithTag:8585];
    if ([numtextView isFirstResponder] ) {
        if (self.mainTableView.frame.size.height - (keyBoardHeight ) >  40 * self.titleArray.count + 100 || self.mainTableView.frame.size.height - (keyBoardHeight ) >   40 * self.titleArray.count +100 - self.mainTableView.contentOffset.y) {
            
        } else {
            self.mainTableView.contentOffset = CGPointMake(0, 40 * self.titleArray.count + 100 - (self.mainTableView.frame.size.height - (keyBoardHeight )));
        }
    }
    //    keyBoardHiden = YES;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self allresignFirstResponder];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
- (void)handleSingleTap:(NSInteger)tag{
    [self allresignFirstResponder];
    switch (tag) {
        case 11:
        {
            //性别
            PickSelectview * picview = [[PickSelectview alloc] init];
            picview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
            NSArray * array = @[@"男",@"女"];
            picview.Arry = array;
            
            UIView * view = picview;
            __weak typeof(self) weakself = self;
            picview.sureClick = ^(NSInteger index){
                sexStr =array[index];
                [view removeFromSuperview];
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
                [weakself.mainTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            };
            picview.cancleClick = ^{
                [view removeFromSuperview];
            };
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            [window addSubview:picview];
        }
            break;
        case 13:
        {
            //地址
            CitySelectView * cityView = [[CitySelectView alloc] init];
            cityView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
            
            UIView * view = cityView;
            __weak typeof(self) weakself = self;
            cityView.sureClick = ^(Province *provinceModel, City *cityModel, Area *areaModel) {
                _provinceModel = provinceModel;
                _cityModel = cityModel;
                _areaModel = areaModel;
                //                addressLabel.text = [NSString stringWithFormat:@"%@%@%@",_provinceModel.cityName,_cityModel.cityName,_areaModel.cityName];
                
                [view removeFromSuperview];
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
                [weakself.mainTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            };
            cityView.cancleClick = ^{
                
                [view removeFromSuperview];
                
            };
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            
            [window addSubview:cityView];
        }
            break;
        default:
            break;
    }
}

- (void)allresignFirstResponder{
    [self.view endEditing:YES];
    [self.view endEditing:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
