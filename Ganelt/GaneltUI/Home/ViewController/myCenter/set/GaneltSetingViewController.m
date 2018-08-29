//
//  GaneltSetingViewController.m
//  Ganelt
//
//  Created by shenshen on 2018/3/17.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltSetingViewController.h"
#import "GaneltSetItemCell.h"
@interface GaneltSetingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * mainTableView;

@end

@implementation GaneltSetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"设置"];
    [self.view addSubview:self.mainTableView];
    [self createTableViewFootView];

    // Do any additional setup after loading the view.
}
- (void)createTableViewFootView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.mainTableView.tableFooterView = view;
    
    if ([GaneltPersonAccount checkLogin:NO withCurrentCtr:nil]) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 10 + 35, kScreenWidth - 40, 40);
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [button setTitle:@"退出登录" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.layer.cornerRadius  = 5 ;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(outInClick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }
}

//退出登录
- (void)outInClick{
    
    // 删除个人信息和账户
    [GaneltPersonAccount clearAccountInfo];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavigaHeight,kScreenWidth ,kScreenHeight - NavigaHeight - SystemSafeAreaBottom) style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltSetItemCell class] forCellReuseIdentifier:@"GaneltSetItemCell"];
//        [_mainTableView registerClass:[GaneltWalletHeaderCell class] forCellReuseIdentifier:@"GaneltWalletHeaderCell"];
//        [_mainTableView registerClass:[GaneltWalletAllPriceCell class] forCellReuseIdentifier:@"GaneltWalletAllPriceCell"];
    }
    return _mainTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 | indexPath.row == 2 |indexPath.row == 4 |indexPath.row == 6) {
        return 10;
    }
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GaneltSetItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltSetItemCell"];
    if (indexPath.row == 0 | indexPath.row == 2 |indexPath.row == 4 |indexPath.row == 6 ) {
        cell.lineBottomLabel.hidden = YES;
        cell.lineTopLabel.hidden = YES;
        cell.titleLabel.hidden = YES;
        cell.nextImg.hidden = YES;
        cell.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    } else {
        cell.lineBottomLabel.hidden = NO;
        cell.lineTopLabel.hidden = NO;
        cell.titleLabel.hidden = NO;
        cell.nextImg.hidden = NO;
        if (indexPath.row == 1) {
           cell.nextImg.hidden = YES;
        }
        cell.contentView.backgroundColor = [UIColor whiteColor];
        switch (indexPath.row) {
            case 1:
            {
                cell.titleLabel.text = @"当前版本";
                cell.rightLabel.text = @"v1.0.0";

            }
                break;
            case 3:
            {
                cell.titleLabel.text = @"清除缓存";
                // 计算缓存
                NSUInteger cacheSize = [[SDImageCache sharedImageCache] getSize];
                CGFloat cacheM = cacheSize*1.0/(1024*1024);
                cell.rightLabel.text = [NSString stringWithFormat:@"%.2fM  ",cacheM];
            }
                break;
            case 5:
            {
                cell.titleLabel.text = @"关于我们";
            }
                break;
            default:
                break;
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 1:// 当前版本
        {
            if ([GaneltPersonAccount checkLogin:YES withCurrentCtr:self]) {

            }
            break;
        }
        case 3:// 清除缓存
        {
            [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
            [[SDImageCache sharedImageCache] clearMemory];
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
        }
        case 5:// 关于我们
        {
        }
        default:
            break;
    }
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
