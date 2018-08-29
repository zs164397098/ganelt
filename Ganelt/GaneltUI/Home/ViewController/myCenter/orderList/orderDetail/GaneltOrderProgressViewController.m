//
//  GaneltOrderProgressViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/3.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltOrderProgressViewController.h"
#import "GaneltOrderDetailProgressHeaderCell.h"
#import "GaneltOrderDetailProgressItemTableViewCell.h"
@interface GaneltOrderProgressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * mainTableView;

@end

@implementation GaneltOrderProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0 ,0, kScreenWidth, self.view.frame.size.height - 50 - (IS_IPHONEX?88:64) - SystemSafeAreaBottom) style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltOrderDetailProgressHeaderCell class] forCellReuseIdentifier:@"GaneltOrderDetailProgressHeaderCell"];
        [_mainTableView registerClass:[GaneltOrderDetailProgressItemTableViewCell class] forCellReuseIdentifier:@"GaneltOrderDetailProgressItemTableViewCell"];

    }
    return _mainTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 66;
    }
    return 40 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        GaneltOrderDetailProgressHeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltOrderDetailProgressHeaderCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        GaneltOrderDetailProgressItemTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltOrderDetailProgressItemTableViewCell"];
        if (indexPath.row == 1) {
            [cell initFrame:topHidden];
        }else if (indexPath.row == 3){
            [cell initFrame:bottomHidden];
        }else {
            [cell initFrame:defaultsHidden];
        }
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
