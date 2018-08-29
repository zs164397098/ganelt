//
//  GaneltMyWalletViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/5.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMyWalletViewController.h"
#import "GaneltWalletItemCell.h"
#import "GaneltWalletHeaderCell.h"
#import "GaneltWalletAllPriceCell.h"
@interface GaneltMyWalletViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * imgArray;

@end

@implementation GaneltMyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"我的钱包"];
    self.titleArray = @[@"优惠券",@"申请发票",@"账单明细",@"价格说明"];
    self.imgArray = @[@"myWalletYouhuiquan",@"myWalletFapiao",@"myWalletZhangdan",@"myWalletShuoming"];
    [self.view addSubview:self.mainTableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavigaHeight,kScreenWidth ,kScreenHeight - NavigaHeight - SystemSafeAreaBottom) style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltWalletItemCell class] forCellReuseIdentifier:@"GaneltWalletItemCell"];
        [_mainTableView registerClass:[GaneltWalletHeaderCell class] forCellReuseIdentifier:@"GaneltWalletHeaderCell"];
        [_mainTableView registerClass:[GaneltWalletAllPriceCell class] forCellReuseIdentifier:@"GaneltWalletAllPriceCell"];
    }
    return _mainTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.titleArray.count + 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 70;
        
    }else if (indexPath.row == 1){
        return 70;
    }
        return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        GaneltWalletHeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltWalletHeaderCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1){
        GaneltWalletAllPriceCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltWalletAllPriceCell"];
        
        cell.leftLabel.attributedText = [self getText:@"总收入（元）\n199元"];
        cell.rightLabel.attributedText = [self getText:@"总支出（元）\n199元"];
        cell.leftLabel.textAlignment = NSTextAlignmentCenter;
        cell.rightLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else {
        GaneltWalletItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GaneltWalletItemCell"];
        cell.titleLabel.text = self.titleArray[indexPath.row - 2];
        [cell.iconImg setImage:[UIImage imageNamed:self.imgArray[indexPath.row - 2]]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(NSAttributedString *)getText:(NSString *)text{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text];;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];

    return attributedString;
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
