//
//  GaneltMyCenterViewController.m
//  Ganelt
//
//  Created by shenshen on 2018/1/21.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMyCenterViewController.h"
#import "GaneltMyCenterHeaderCell.h"
#import "GaneltMyCenterItemListCell.h"
#import "GaneltBasicInformationViewController.h"
#import "GaneltLoginViewController.h"
#import "GaneltMyOrderListViewController.h"
#import "GaneltMyWalletViewController.h"
#import "GaneltSetingViewController.h"
@interface GaneltMyCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * imageArray;

@end

@implementation GaneltMyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"我的"];
    if (@available(iOS 11.0, *)) {
        self.mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleArray = @[@"我的订单",@"我的钱包",@"介绍给朋友",@"设置中心"];
    self.imageArray = @[@"icon_mine_wodedingdan",@"icon_mine_qianbao",@"icon_mine_friend",@"icon_mine_setting"];
    [self.view addSubview:self.mainTableView];
    [self createheaderView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginFresh) name:@"loginFresh" object:nil];
    // Do any additional setup after loading the view.
}

- (void)loginFresh{
    [self.mainTableView reloadData];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [self.mainTableView removeSpringHeadView];
}

- (void)createheaderView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, IS_IPHONEX?88:64)];
    view.backgroundColor = UIColorFromRGB(0x3ca9fd);
    view.userInteractionEnabled = YES;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, StatusBarHeight, 44, 44);
    [button setImage:[UIImage imageNamed:@"icon_top_setting_white"] forState:UIControlStateNormal];
    button.contentMode = UIViewContentModeScaleAspectFit;
    [button addTarget:self action:@selector(setClick) forControlEvents:UIControlEventTouchUpInside];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
//    [view addSubview:button];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, StatusBarHeight, kScreenWidth, 44)];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:titleLabel];
    titleLabel.text = @"我的";
    
    self.mainTableView.tableHeaderView = view;
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth ,kScreenHeight - TabbarHeight) style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltMyCenterHeaderCell class] forCellReuseIdentifier:@"GaneltMyCenterHeaderCell"];
        [_mainTableView registerClass:[GaneltMyCenterItemListCell class] forCellReuseIdentifier:@"GaneltMyCenterItemListCell"];
        
        UIView *headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
        [headview setBackgroundColor:[UIColor colorWithHexString:@"#3ca9fd"]];
        [_mainTableView addSpringHeadView:headview];
    }
    return _mainTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1 + self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 80;
    }
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        GaneltMyCenterHeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltMyCenterHeaderCell"];
        GaneltUserFormation * user = [GaneltUserFormation getAccountInfo];
        if (user) {
            cell.titleLabel.text = user.ACCOUNT;
            cell.iconImg.image = [UIImage imageNamed:@"myDefault"];

        }else {
            cell.titleLabel.text = @"登录/注册";
            [cell.iconImg setImage:[UIImage imageNamed:@"icon_people"]];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        GaneltMyCenterItemListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltMyCenterItemListCell"];
        if (indexPath.row == 1 + self.titleArray.count) {
            cell.lineBottomLabel.hidden = NO;
        } else {
            cell.lineBottomLabel.hidden = YES;
        }
        cell.titleLabel.text = [self.titleArray objectAtIndex:indexPath.row - 1];
        [cell.iconImg setImage:[UIImage imageNamed:self.imageArray[indexPath.row - 1]]];
        cell.iconImg.contentMode = UIViewContentModeCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        //基本资料
        if ([GaneltPersonAccount checkLogin:YES withCurrentCtr:self]) {
            GaneltBasicInformationViewController * basicViewController = [[GaneltBasicInformationViewController alloc]init];
            basicViewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:basicViewController animated:YES];
        }
    }else if (indexPath.row == 1){
        //我的订单
        if ([GaneltPersonAccount checkLogin:YES withCurrentCtr:self]) {
            GaneltMyOrderListViewController * OrderViewController = [[GaneltMyOrderListViewController alloc]init];
            OrderViewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:OrderViewController animated:YES];
        }
    }else if (indexPath.row == 2){
        //我的钱包
        if ([GaneltPersonAccount checkLogin:YES withCurrentCtr:self]) {
            GaneltMyWalletViewController * MyWalletViewController = [[GaneltMyWalletViewController alloc]init];
            MyWalletViewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:MyWalletViewController animated:YES];
        }
    }else if (indexPath.row == 3){
        //介绍给朋友
        if ([GaneltPersonAccount checkLogin:YES withCurrentCtr:self]) {
        }
    }else if (indexPath.row == 4){
        //设置中心
        GaneltSetingViewController * SetingViewController = [[GaneltSetingViewController alloc]init];
        SetingViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:SetingViewController animated:YES];

    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
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
