//
//  GaneltOrderFormationViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/3.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltOrderFormationViewController.h"
#import "GaneltOrderFormationItemCell.h"
#import "GaneltOrderFormationHeaderCell.h"
@interface GaneltOrderFormationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSArray * contentArray;
@property (nonatomic, strong)NSArray * heighArray;
@property (nonatomic, strong)NSArray * titleArray;
@end

@implementation GaneltOrderFormationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentArray = @[@"物品类型：文件\n物品重量：5公斤以下\n备注信息：无",@"寄\n中关村科技园区服务中心\n收\n中关村软件园互联网创新中心\n2018-03-05 10:33",@"里程费：10元\n优惠券：-5元\n小费：+5元\n订单总额：15元\n实际支付：10元",@"订单来源：APP\n支付方式：在线支付"];
    self.heighArray = @[@"80",@"120",@"120",@"50"];
    self.titleArray = @[@"物品",@"地址",@"费用",@"其他"];
    [self.view addSubview:self.mainTableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0 ,0, kScreenWidth, self.view.frame.size.height - 50 - (IS_IPHONEX?88:64) - SystemSafeAreaBottom) style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltOrderFormationItemCell class] forCellReuseIdentifier:@"GaneltOrderFormationItemCell"];
        [_mainTableView registerClass:[GaneltOrderFormationHeaderCell class] forCellReuseIdentifier:@"GaneltOrderFormationHeaderCell"];
    }
    return _mainTableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.titleArray.count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 40;
    }
    return  [self.heighArray[indexPath.row - 1] intValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        GaneltOrderFormationHeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltOrderFormationHeaderCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        GaneltOrderFormationItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltOrderFormationItemCell"];
        cell.contentLabel.text = self.contentArray[indexPath.row - 1];
        cell.titleLabel.text = self.titleArray[indexPath.row - 1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
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
