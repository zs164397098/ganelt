//
//  GaneltGoodsFormViewController.m
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltGoodsFormViewController.h"
#import "GaneltGoodsFormHeadCell.h"
#import "GaneltGoodsOtherFormationCell.h"

@interface GaneltGoodsFormViewController ()<UITableViewDelegate,UITableViewDataSource,RootCellDelegate,UITextFieldDelegate>
{
    BOOL keyBoardHiden;//判断键盘是否弹出来
    NSInteger keyBoardHeight;
}
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * imageArray;

@end

@implementation GaneltGoodsFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"选择物品类型"];
    self.titleArray = @[@"证件",@"文件",@"电子产品",@"生活用品",@"鲜花",@"蛋糕",@"食品",@"其他"];
    self.imageArray = @[@"zhengjian",@"wenjian",@"dianzichanpin",@"shenghuoyongpin",@"xianhua",@"dangao",@"shiwu",@"otherthing"];
    [self.view addSubview:self.mainTableView];
    keyBoardHiden = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

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
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavigaHeight,kScreenWidth ,kScreenHeight - NavigaHeight - SystemSafeAreaBottom) style:UITableViewStyleGrouped];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltGoodsFormHeadCell class] forCellReuseIdentifier:@"GaneltGoodsFormHeadCell"];
        [_mainTableView registerClass:[GaneltGoodsOtherFormationCell class] forCellReuseIdentifier:@"GaneltGoodsOtherFormationCell"];

    }
    return _mainTableView;
}
//分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//每组个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 40)];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = UIColorFromRGB(0x333333);
        if (section == 0) {
            label.text = @"物品类型";
        }else {
            label.text = @"备注信息";
        }
        [view addSubview:label];
        return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 1) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        view.backgroundColor = [UIColor whiteColor];

        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 10, kScreenWidth - 40, 40);
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:UIColorFromRGB(0x3ca9fd)];
        [button setTitle:@"确定" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.layer.cornerRadius  = 5 ;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        return view;
    }
    return nil;
}

- (void)sureClick{
    if (self.goodsStr.length == 0) {
        [[MBProgressHUDManager getInstance]showMessage:@"请选择物品类型" duration:1];
    }else {
        if (self.delgate && [self.delgate respondsToSelector:@selector(getAddgoods:)]){
            [self.delgate getAddgoods:self.goodsStr];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 60;
    }
    return 0.01;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGFloat weight = (float)(kScreenWidth - 30) / (float)4;
        return weight * 2;
    }
    return 100 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        GaneltGoodsFormHeadCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltGoodsFormHeadCell"];
        cell.delegate = self;
        cell.imageAry = self.imageArray;
        cell.titleAry = self.titleArray;
        cell.selectTitle = self.goodsStr;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        GaneltGoodsOtherFormationCell * cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"GaneltGoodsOtherFormationCell"];
        cell.formationTextView.tag = 8585;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)didSelectItemAtRow:(NSInteger)itemNum{
    self.goodsStr = self.titleArray[itemNum];
}

- (void)textFiledBegain{
    UITextField * numtextView = (UITextField *)[self.view viewWithTag:8585];
    CGFloat weight = (float)(kScreenWidth - 30) / (float)4;
    if ([numtextView isFirstResponder] ) {
        if (self.mainTableView.frame.size.height - (keyBoardHeight ) >  40 * 2 + weight * 2 || self.mainTableView.frame.size.height - (keyBoardHeight ) >   40 * 2 + weight * 2 - self.mainTableView.contentOffset.y) {
            
        } else {
            self.mainTableView.contentOffset = CGPointMake(0, 40 * 2 + weight * 2 - (self.mainTableView.frame.size.height - (keyBoardHeight )));
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self allresignFirstResponder];
}
//放弃第一响应者 收起键盘
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
