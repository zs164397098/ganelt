//
//  GaneltPayOrderViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/1.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltPayOrderViewController.h"
#import "GaneltPayOrderPayStyleCell.h"
#import "GaneltPayOrderFormationCell.h"
#import "GaneltPaySuccessViewController.h"
@interface GaneltPayOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _payWay;//付款方式，0支付宝（默认），1微信 2 银联
    NSString * orderFormation;
    CGFloat formaitonHeight;

}
@property (nonatomic, strong)UITableView * mainTableView;

@end

@implementation GaneltPayOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"确认订单"];
    _payWay = 0;
    NSDate * date = [NSDate date];
    NSDateFormatter * matter = [[NSDateFormatter alloc]init];
    [matter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];

    orderFormation = [NSString stringWithFormat:@"创建时间：%@\n物品类型：%@\n物品重量：%@\n寄件地址：%@\n收件地址：%@\n取件时间：%@",[matter stringFromDate:date],self.goods,self.thingWeight,self.mailAddress,self.receiveAddress,self.fetchTime];
    CGSize size = [[LabelFitTool getLabelFit]labelAutoCalculateRectWith:orderFormation FontSize:14 MaxSize:CGSizeMake(kScreenWidth -20, 500)space:5];
    formaitonHeight = size.height + 20;
    [self.view addSubview:self.mainTableView];
    [self createBottomView];
    // Do any additional setup after loading the view.
}

- (void)createBottomView{
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - SystemSafeAreaBottom - 49, kScreenWidth, 49)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kPX1)];
    lineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [bottomView addSubview:lineLabel];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(13, 0, kScreenWidth - 26, 49)];
    label.font = [UIFont systemFontOfSize:14];
    label.text = [NSString stringWithFormat:@"￥%@",self.moneystr];
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
//立即支付
- (void)buyClick{
    
    GaneltPaySuccessViewController * viewController = [[GaneltPaySuccessViewController alloc]init];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];

}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavigaHeight,kScreenWidth ,kScreenHeight - NavigaHeight - TabbarHeight) style:UITableViewStyleGrouped];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltPayOrderFormationCell class] forCellReuseIdentifier:@"GaneltPayOrderFormationCell"];
        [_mainTableView registerClass:[GaneltPayOrderPayStyleCell class] forCellReuseIdentifier:@"GaneltPayOrderPayStyleCell"];

    }
    return _mainTableView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1 ) {
        return 40;
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1 ) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel * moneyStyleLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, 0, kScreenWidth - 13, 40)];
        moneyStyleLabel.font = [UIFont systemFontOfSize:14];
        moneyStyleLabel.textColor = UIColorFromRGB(0x333333);
        [view addSubview:moneyStyleLabel];
        moneyStyleLabel.text = @"选择付款方式";
        return view;
    }
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return  [[UIView alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
        return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return formaitonHeight;
    }
        return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        GaneltPayOrderFormationCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltPayOrderFormationCell"];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:orderFormation];;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:5];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, orderFormation.length)];
        cell.orderFormationLabel.attributedText = attributedString;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        GaneltPayOrderPayStyleCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltPayOrderPayStyleCell"];
        cell.tag = indexPath.row;
        if (indexPath.row == 0) {
            cell.orderStyleLabel.text = @"支付宝支付";
            cell.iconImg.image = [UIImage imageNamed:@"icon_pay_zhifubao"];
        }
        else if (indexPath.row == 1)
        {
            cell.orderStyleLabel.text = @"微信支付";
            cell.iconImg.image = [UIImage imageNamed:@"icon_pay_wechat"];
        }
       
        //设置选中样式
        if (_payWay == indexPath.row) {
            cell.rightImg.image =  [UIImage imageNamed:@"icon_choose_press"];
        }
        else
        {
            cell.rightImg.image = [UIImage imageNamed:@"icon_choose_normal"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 2){
        _payWay = indexPath.row;
    }
    [tableView reloadData];
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
