//
//  TabBarViewController.m
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/22.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "TabBarButton.h"
#import "GaneltSendViewController.h"
#import "GaneltMailViewController.h"
#import "GaneltMyCenterViewController.h"
#import "GaneltParentsViewController.h"

@interface TabBarViewController ()
@property (nonatomic, strong) UIView *tabbarView;
/**
 * tabar数组
 */
@property (nonatomic, strong) NSArray *tabBarArray;
/**
 * 标题数组
 */
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(changeItemIndex:)
                                                name:@"changeitemIndex"
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(changeitemStatus:)
                                                name:@"changeitemStatus"
                                              object:nil];


    [self createViewController];
    [self createSelfTabar];
   
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/**
 * 跳到指定tabbar控制器
 */
- (void)changeItemIndex:(NSNotification *)notification
{
    int  index = [notification.object intValue];
    UIButton *indexBtn = (UIButton *)[_tabbarView viewWithTag:index + 1000];
    [self selectTabbar:indexBtn];
}

-(void)changeitemStatus:(NSNotification *)notification
{
    int  index = [notification.object intValue];
    UIButton *button = (TabBarButton *)[_tabbarView viewWithTag:index + 1000];
    for (UIView *im in [self.tabbarView subviews]) {
        if ([im isKindOfClass:[UIButton class]]) {
            
            UIButton *bt=(UIButton *)im;
            
            if (bt.tag==button.tag) {
                bt.selected=YES;
                
            }else{
                
                bt.selected=NO;
                
            }
        }
    }
}

-(NSArray *)tabBarArray {
    if (!_tabBarArray) {
        _tabBarArray = [[NSArray alloc]initWithObjects:@"GaneltMailViewController",@"GaneltSendViewController",@"GaneltMyCenterViewController", nil];
    }
    return _tabBarArray;
}

-(NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray =  [NSArray arrayWithObjects:@"我要寄",@"我要送",@"我的",nil];
    }
    return _titleArray;
}

- (void)createViewController{
    NSArray *tabBarArray = self.tabBarArray;
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:tabBarArray.count];
    
    for (int i = 0; i < tabBarArray.count; i++) {
        NSString *str=[tabBarArray objectAtIndex:i];
        Class class=NSClassFromString(str);
        GaneltParentsViewController *fist=[[class alloc]init];
        
        BaseNavigationViewController *baseNav = [[BaseNavigationViewController alloc]initWithRootViewController:fist];
        [viewControllers addObject:baseNav];
    }
    self.viewControllers = viewControllers;
}

-(void)createSelfTabar{
    float itemWidth = kScreenWidth / self.viewControllers.count;
    self.tabbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 49 + SystemSafeAreaBottom)];
    self.tabbarView.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:self.tabbarView];
    NSArray *titleArr = self.titleArray;
    NSArray *imgArr = @[@"tab_mail", @"tab_send", @"tab_my"];
    NSArray *selArr = @[@"tab_mail_blue",@"tab_send_blue",@"tab_mysel",];
    
    for (int i = 0; i < imgArr.count; i++)
    {
        
        TabBarButton *btn = [[TabBarButton alloc]initWithFrame:CGRectMake(i * itemWidth, 0, itemWidth, 49)];
        [btn setShowsTouchWhenHighlighted:YES];
        btn.tag = i + 1000;
        btn.contentMode = UIViewContentModeTop;
        
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [btn setImage:[UIImage imageNamed:[imgArr objectAtIndex:i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[selArr objectAtIndex:i]] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:[selArr objectAtIndex:i]] forState:UIControlStateSelected | UIControlStateHighlighted];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:11]];
        [btn setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:ColorWithHexRGB(0x666666) forState:UIControlStateNormal];
        [btn setTitleColor:ColorWithHexRGB(0x3ca9fd) forState: UIControlStateSelected];
        [btn setTitleColor:ColorWithHexRGB(0x3ca9fd) forState: UIControlStateSelected|UIControlStateHighlighted];
        if (i == 0) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
        
        [btn addTarget:self action:@selector(selectTabbar:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabbarView addSubview:btn];
    }
}
/**
 *  选中tabbar
 *
 *  @param buttom 属性
 */

- (void)selectTabbar:(UIButton *)button
{
    
    for (UIView *im in [self.tabbarView subviews]) {
        if ([im isKindOfClass:[UIButton class]]) {
            
            UIButton *bt=(UIButton *)im;
            
            if (bt.tag==button.tag) {
                bt.selected=YES;
                
            }else{
                
                bt.selected=NO;
                
            }
        }
    }
    // 跳转的控制器
    self.selectedIndex = button.tag - 1000;//(800)
    // 跳转的控制器
    NSInteger index = button.tag - 1000;
    self.selectedIndex = index;
    
    // 纠错判断，避免内部navigationController设置子控制器导致点击tabar时root不对应
    BaseNavigationViewController *selectedCtr = self.selectedViewController;
    NSString *ctrStr = self.tabBarArray[index];
    if (![selectedCtr.topViewController isKindOfClass:NSClassFromString(ctrStr)]) {
        [selectedCtr setViewControllers:@[[[NSClassFromString(ctrStr) alloc]init]]];
        selectedCtr.navigationBarHidden = NO;
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
