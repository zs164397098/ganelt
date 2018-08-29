//
//  GaneltPaySuccessViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/1.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltPaySuccessViewController.h"
#import "GaneltMyOrderListViewController.h"
#import "GaneltMyCenterViewController.h"
@interface GaneltPaySuccessViewController ()
@property (nonatomic ,strong)UIImageView * successImg;
@property (nonatomic ,strong)UILabel * descripLabel;

@end

@implementation GaneltPaySuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"支付成功"];
    [self createUi];
    
    UIImage *image = [UIImage imageNamed:@""];
    UIBarButtonItem *leftbuttonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    self.navigationItem.leftBarButtonItem = leftbuttonItem;
    // Do any additional setup after loading the view.
}

- (void)doNothing{}

- (void)createUi{
    self.successImg = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 60 ) / 2, 135, 60, 60)];
    self.successImg.image = [UIImage imageNamed:@"icon_pay_successful"];
    [self.view addSubview:self.successImg];
    
    self.descripLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.successImg.frame) + 20, kScreenWidth, 20)];
    self.descripLabel.text = @"支付成功";
    self.descripLabel.font = [UIFont systemFontOfSize:14];
    self.descripLabel.textColor = UIColorFromRGB(0x333333);
    self.descripLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.descripLabel];
    
    UIButton * leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame = CGRectMake(10, CGRectGetMaxY(self.descripLabel.frame) + 20, (kScreenWidth  - 40 )/2, 30);
    leftbutton.backgroundColor = [UIColor colorWithHexString:@"#3ca9fd"];
    [leftbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftbutton setTitle:@"返回" forState:UIControlStateNormal];
    leftbutton.titleLabel.font = [UIFont systemFontOfSize:14];
    [leftbutton addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftbutton];
    
    UIButton * rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton.frame = CGRectMake(kScreenWidth - ((kScreenWidth  - 40 )/2)- 10, CGRectGetMaxY(self.descripLabel.frame) + 20, (kScreenWidth  - 40 )/2, 30);
    rightbutton.backgroundColor = [UIColor colorWithHexString:@"#3ca9fd"];
    [rightbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightbutton setTitle:@"查看订单" forState:UIControlStateNormal];
    rightbutton.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightbutton addTarget:self action:@selector(lookOrderClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightbutton];
    
}

- (void)lookOrderClick{
    NSMutableArray *keepArr =  [NSMutableArray array];
    [keepArr addObject:[[GaneltMyCenterViewController alloc]init]];
    GaneltMyOrderListViewController *myorder = [[GaneltMyOrderListViewController alloc]init];
    myorder.hidesBottomBarWhenPushed = YES;
    [keepArr addObject:myorder];
    [self.navigationController setViewControllers:keepArr animated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeitemStatus" object:@2];

}

- (void)returnClick{
    
    NSInteger gotoIndex = self.navigationController.childViewControllers.count-3;
    [self.navigationController popToViewController:self.navigationController.childViewControllers[gotoIndex] animated:YES];
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
