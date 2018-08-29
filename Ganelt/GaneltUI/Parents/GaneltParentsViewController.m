//
//  GaneltParentsViewController.m
//  Ganelt
//
//  Created by shenshen on 2018/1/21.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltParentsViewController.h"

@interface GaneltParentsViewController ()

@end

@implementation GaneltParentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)) {
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if (self.navigationController.childViewControllers.count != 1) {
        [self CreatLeftButtonItem];
    }

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
//设置titleView
-(void)addTitleViewWithTitle:(NSString *)title{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,30)];
    label.text=title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
    label.textColor = UIColorFromRGB(0x333333);
    //label.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    
}
- (UIBarButtonItem *)createNavigationBarItem:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)color image:(UIImage *)image frame:(CGRect)frame target:(id)target selector:(SEL)selector{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    [btn setFrame:frame];
    if (title.length>0) {
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitleColor:color forState:UIControlStateNormal];
        btn.titleLabel.font = font;
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
/**
 * 设置右侧导航按钮
 */
- (void)setRightNavigationBarItem:(NSString *)title image:(UIImage *)image target:(id)target selector:(SEL)selector{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    if (title.length>0) {
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentRight;
        btn.titleLabel.font =[UIFont systemFontOfSize:15];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -15)];
        [btn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    }
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}
/**
 * 设置返回按钮图片前置颜色
 */
- (void)setNavBackItemTintColor:(UIColor *)color{
    UIImage *image = [UIImage imageNamed:@"icon_top_back"];
    UIBarButtonItem *leftbuttonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(BackButtonItemClick)];
    [leftbuttonItem setTintColor:color];
    [leftbuttonItem setImageInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    self.navigationItem.leftBarButtonItem = leftbuttonItem;
}

//设置返回按钮
-(void)CreatLeftButtonItem{
    [self setNavBackItemTintColor:[UIColor colorWithHexString:@"#6b6b6b"]];
}

-(void)BackButtonItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 登录成功重载数据
 */
- (void)againInvokingRequest:(BOOL)isLogin{
    
}

/**
 * 隐藏导航条，在指定offsetY时显示导航条
 */
- (void)hiddenNavBarWhenScrollViewDidScroll:(UIScrollView *)scrollView showNavOffsetY:(CGFloat)showY
{
    __weak typeof(self) weakSelf = self;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > showY)
    {
        [UIView animateWithDuration:0.5 animations:^
         {
             __strong typeof(self) pThis = weakSelf;
             [pThis wr_setNavBarBackgroundAlpha:1.0];
         }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^
         {
             __strong typeof(self) pThis = weakSelf;
             [pThis wr_setNavBarBackgroundAlpha:0];
         }];
    }
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
