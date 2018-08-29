//
//  GaneltOrderListItemViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/3.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltOrderListItemViewController.h"
#import "GaneltMyOrderListItemCell.h"
#import "GaneltMyOrderDetailViewController.h"
@interface GaneltOrderListItemViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * mainTableView;

@end

@implementation GaneltOrderListItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0 ,0, kScreenWidth, self.view.frame.size.height - 50 - (IS_IPHONEX?88:64) - SystemSafeAreaBottom) style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];

        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltMyOrderListItemCell class] forCellReuseIdentifier:@"GaneltMyOrderListItemCell"];
        
    }
    return _mainTableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        UILabel * monthLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, 0, kScreenWidth - 13, 40)];
        monthLabel.font = [UIFont systemFontOfSize:14];
        monthLabel.textColor = UIColorFromRGB(0x333333);
        [view addSubview:monthLabel];
        if (section == 0) {
            monthLabel.text = @"2018年3月";
        }else{
            monthLabel.text = @"2018年2月";
        }
        return view;
    return [[UIView alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GaneltMyOrderListItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltMyOrderListItemCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GaneltMyOrderDetailViewController * viewController = [[GaneltMyOrderDetailViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
