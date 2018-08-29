//
//  GaneltMailViewController.m
//  Ganelt
//
//  Created by shenshen on 2018/1/21.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMailViewController.h"
#import "GaneltMailThingCell.h"
#import "GaneltMailAddressCell.h"
#import "GaneltMailChargeCell.h"
#import "GaneltAddressListViewController.h"
#import "GaneltGoodsFormViewController.h"
#import "GaneltPayOrderViewController.h"
@interface GaneltMailViewController ()<UITableViewDelegate,UITableViewDataSource,selectAddress,goodsSelect>
{
    NSString * thingStyle;
    NSString * thingWeight;
    NSString * fetchTime;
    NSInteger addressflag; // 0 寄件地址 1 收件地址
    NSString * tipMoney; // 0 寄件地址 1 收件地址

}
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * thingArray;
@property (nonatomic, strong)NSMutableArray * addressArray;
@property (nonatomic, strong)NSArray * placeholderArray;

@end

@implementation GaneltMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"我要寄"];
    [self initData];
    [self.view addSubview:self.mainTableView];
    [self createHeader];
    [self createBottomView];
    // Do any additional setup after loading the view.
}

- (void)initData{
    self.titleArray = @[@"物品（请选择物品类型等信息）",@"地址（请输入寄收地址和时间等信息）",@"费用（请认真核对费用明细）"];
    self.thingArray = @[@"物品类型",@"物品重量"];
    NSArray * addArray = @[@"请输入寄件地址",@"请输入收件地址"];
    self.addressArray = [[NSMutableArray alloc]initWithArray:addArray];
}
- (void)createHeader{
    CGFloat adviceHeight = (float)160 / (float)375 * kScreenWidth;
    UIImageView * imgaeView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, adviceHeight)];
    imgaeView.image = [UIImage imageNamed:@"ganeltBanner.jpg"];
    self.mainTableView.tableHeaderView = imgaeView;
}

- (void)createBottomView{
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - TabbarHeight - 49, kScreenWidth, 49)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kPX1)];
    lineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [bottomView addSubview:lineLabel];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(13, 0, kScreenWidth - 26, 49)];
    label.font = [UIFont systemFontOfSize:14];
    label.text = [NSString stringWithFormat:@"￥%@  5.0公里，5公斤 ",@"123"];
    label.textColor = [UIColor colorWithHexString:@"#FF6406"];
    [bottomView addSubview:label];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kScreenWidth /2 + 50, 0, kScreenWidth /2 - 50, 49);
    button.backgroundColor = [UIColor colorWithHexString:@"#3ca9fd"];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(buyClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:button];
    
}
//点击提交
- (void)buyClick{
    NSString * mailaddstr = self.addressArray[0];
    NSString * receiveaddstr = self.addressArray[1];
    if (thingStyle.length == 0) {
        [[MBProgressHUDManager getInstance]showMessage:@"请选择物品类型" duration:1];
    }else if (thingWeight.length == 0){
        [[MBProgressHUDManager getInstance]showMessage:@"请选择物品重量" duration:1];
    }else if ([mailaddstr containsString:@"请输入寄件地址"]){
        [[MBProgressHUDManager getInstance]showMessage:@"请输入寄件地址" duration:1];
    }else if ([receiveaddstr containsString:@"请输入收件地址"]){
        [[MBProgressHUDManager getInstance]showMessage:@"请输入收件地址" duration:1];
    }else if (fetchTime.length == 0){
        [[MBProgressHUDManager getInstance]showMessage:@"请选择取件时间" duration:1];
    }else {
        GaneltPayOrderViewController * viewController = [[GaneltPayOrderViewController alloc]init];
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.thingWeight = thingWeight;
        viewController.goods = thingStyle;
        viewController.receiveAddress = receiveaddstr;
        viewController.mailAddress = mailaddstr;
        viewController.fetchTime = fetchTime;
        viewController.moneystr = @"10";
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavigaHeight,kScreenWidth ,kScreenHeight  - NavigaHeight - TabbarHeight - 49) style:UITableViewStyleGrouped];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor colorWithHexString:@"#efeff4"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltMailThingCell class] forCellReuseIdentifier:@"GaneltMailThingCell"];
        [_mainTableView registerClass:[GaneltMailAddressCell class] forCellReuseIdentifier:@"GaneltMailAddressCell"];
        [_mainTableView registerNib:[UINib nibWithNibName:@"GaneltMailChargeCell" bundle:nil] forCellReuseIdentifier:@"GaneltMailChargeCell"];
        
    }
    return _mainTableView;
}
//分组名 header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth -10, 40)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = UIColorFromRGB(0x333333);
    label.text = self.titleArray[section];
    [view addSubview:label];
    return view;
}
//分组高度header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
//返回的分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 3;
    }else{
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 40;
    }else if (indexPath.section == 1){
        return 40;
    }else{
        return 80;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        GaneltMailThingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltMailThingCell"];
        cell.titleLabel.text = self.thingArray[indexPath.row];
        if (indexPath.row == 0) {
            if (thingStyle.length == 0) {
                [cell.selectBtn setTitle:@"请选择物品类型" forState:UIControlStateNormal];
            }else{
                [cell.selectBtn setTitle:thingStyle forState:UIControlStateNormal];
            }
        }else {
            if (thingWeight.length == 0) {
                [cell.selectBtn setTitle:@"请选择物品重量" forState:UIControlStateNormal];
            }else{
                [cell.selectBtn setTitle:thingWeight forState:UIControlStateNormal];
            }
        }
        [cell.selectBtn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        if (indexPath.row <2) {
            GaneltMailAddressCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltMailAddressCell"];
            cell.contentLabel.text = self.addressArray[indexPath.row];
            if (indexPath.row == 0) {
                [cell.leftImg setImage:[UIImage imageNamed:@"mailAddress"]];
            }else {
                [cell.leftImg setImage:[UIImage imageNamed:@"receiveAddress"]];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else {
            GaneltMailThingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltMailThingCell"];
            cell.titleLabel.text = @"取件时间";
            if (fetchTime.length == 0) {
                [cell.selectBtn setTitle:@"选择取件时间" forState:UIControlStateNormal];
            }else{
                [cell.selectBtn setTitle:fetchTime forState:UIControlStateNormal];
            }
            [cell.selectBtn addTarget:self action:@selector(selectTimeClick) forControlEvents:UIControlEventTouchUpInside];

            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else {
        GaneltMailChargeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltMailChargeCell"];
        [cell.discountBtn addTarget:self action:@selector(discountClick) forControlEvents:UIControlEventTouchUpInside];
        [cell.tipBtn addTarget:self action:@selector(tipClick) forControlEvents:UIControlEventTouchUpInside];
        if (tipMoney.length != 0) {
            [cell.tipBtn setTitle:tipMoney forState:UIControlStateNormal];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self handleSingleTap:indexPath];
}

//优惠券
- (void)discountClick{
    [[MBProgressHUDManager getInstance]showMessage:@"暂无优惠券" duration:1];
}

//小费
- (void)tipClick{
    PickSelectview * picview = [[PickSelectview alloc] init];
    picview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    NSArray * array = @[@"5元",@"10元",@"15元",@"20元",@"25元",@"30元"];
    picview.Arry = array;
    
    UIView * view = picview;
    __weak typeof(self) weakself = self;
    picview.sureClick = ^(NSInteger index){
        tipMoney =array[index];
        [view removeFromSuperview];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
        [weakself.mainTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
    picview.cancleClick = ^{
        [view removeFromSuperview];
    };
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:picview];
}

//选取物件
- (void)selectClick:(UIButton *)btn{
    UIView *contentView = [btn superview];
    GaneltMailThingCell *cell = (GaneltMailThingCell *)[contentView superview];
    NSIndexPath *indexPath = [self.mainTableView indexPathForCell:cell];
    if (indexPath.row == 0) {
        GaneltGoodsFormViewController * viewController = [[GaneltGoodsFormViewController alloc]init];
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.delgate = self;
        viewController.goodsStr = thingStyle;
        [self.navigationController pushViewController:viewController animated:YES];
    }else {
        PickSelectview * picview = [[PickSelectview alloc] init];
        picview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        NSArray * array = @[@"0-5kg/5元",@"0-5kg/5元",@"0-5kg/5元",@"0-5kg/5元",@"0-5kg/5元",@"0-5kg/5元"];
        picview.Arry = array;
        
        UIView * view = picview;
        __weak typeof(self) weakself = self;
        picview.sureClick = ^(NSInteger index){
            thingWeight =array[index];
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
}

//取件日期
- (void)selectTimeClick{
    
    DatePickView *dateView = [[DatePickView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    UIView * view = dateView;
    __weak typeof(self) weakself = self;

    dateView.cancelClick = ^{
        [view removeFromSuperview];
    };
    //确认日期
    dateView.sureClick = ^(NSString * date){
        fetchTime = date;
        [view removeFromSuperview];
        [weakself selectTimeDate];
    };
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:dateView];
    
}
//取件时间
- (void)selectTimeDate{
    GaneltCustomTimeView * CustomTimeView = [[GaneltCustomTimeView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) selectDate:fetchTime];
    UIView * view = CustomTimeView;
    __weak typeof(self) weakself = self;
    CustomTimeView.sureClick = ^(NSString * timeStr) {
        fetchTime = [NSString stringWithFormat:@"%@ %@",fetchTime,timeStr];
        [view removeFromSuperview];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:1];
        [weakself.mainTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
    CustomTimeView.cancleClick = ^{
        fetchTime = @"";
        [view removeFromSuperview];
        
    };
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:CustomTimeView];

}
- (void)handleSingleTap:(NSIndexPath * )indexPath{
    switch (indexPath.section) {
        case 0:
            {
                
            }
            break;
        case 1:
        {
            if (indexPath.row <2) {
                //地址
                addressflag = indexPath.row;
                GaneltAddressListViewController * listViewController = [[GaneltAddressListViewController alloc]init];
                listViewController.hidesBottomBarWhenPushed = YES;
                listViewController.delgate = self;
                [self.navigationController pushViewController:listViewController animated:YES];
            }else {
                PickSelectview * picview = [[PickSelectview alloc] init];
                picview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
                NSArray * array = @[@"0-5kg/5元",@"0-5kg/5元",@"0-5kg/5元",@"0-5kg/5元",@"0-5kg/5元",@"0-5kg/5元"];
                picview.Arry = array;
                
                UIView * view = picview;
                __weak typeof(self) weakself = self;
                picview.sureClick = ^(NSInteger index){
                    thingWeight =array[index];
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

        }
            break;
        case 2:
        {
        }
            break;
            
        default:
            break;
    }
}
#pragma mark 选择收寄地址 delegate
- (void)getAddressStr:(NSString *)address{
    [self.addressArray replaceObjectAtIndex:addressflag withObject:address];
    [self.mainTableView reloadData];
}

#pragma mark 选择物品类型 delegate
- (void)getAddgoods:(NSString *)goodsType{
    thingStyle = goodsType;
    [self.mainTableView reloadData];
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
