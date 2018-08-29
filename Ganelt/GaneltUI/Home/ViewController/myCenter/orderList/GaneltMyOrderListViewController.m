//
//  GaneltMyOrderListViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/2.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMyOrderListViewController.h"
#import "GaneltOrderListItemViewController.h"
@interface GaneltMyOrderListViewController ()<UIScrollViewDelegate>
{
    UIScrollView    * _scroller;
    NSMutableArray  * subArray;
    UILabel         * readBottomLine;
    NSArray         *_itemsWidth;
}
@end

@implementation GaneltMyOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    subArray= [[NSMutableArray alloc]init];
    [self addTitleViewWithTitle:@"订单管理"];
    [self createUI];
    // Do any additional setup after loading the view.
}
- (void)createUI{
    [self createScroler];
    [self initDateAction];
    
}
- (void)createScroler{
    //    NSArray * array = @[@"全部",@"待支付",@"已支付",@"已取消",@"已退款"];
    NSArray * array = @[@"全部",@"待支付",@"已支付",@"已取消"];
    _itemsWidth = [self getButtonsWidthWithTitles:array];
    UIView * topBgView = [[UIView alloc]initWithFrame:CGRectMake(0, NavigaHeight, kScreenWidth, 50)];
    topBgView.userInteractionEnabled = YES;
    topBgView.tag = 9999;
    topBgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topBgView];
    
    for (int i = 0; i< array.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i  * (kScreenWidth / array.count), 0, kScreenWidth /array.count, 50);
        button.tag  = i + 100;
        [button addTarget:self action:@selector(chageClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGB(0x00aaf6) forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        if (i == 0) {
            button.selected = YES;
        } else {
            button.selected = NO;
        }
        [topBgView addSubview:button];
    }
    readBottomLine = [[UILabel alloc]initWithFrame:CGRectMake(((kScreenWidth / array.count)-[_itemsWidth[0] floatValue]) /2, 48, [_itemsWidth[0] floatValue], 2)];
    readBottomLine.backgroundColor = UIColorFromRGB(0x00aaf6);
    [topBgView addSubview:readBottomLine];
    
    UILabel * lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 49.5, kScreenWidth, kPX1)];
    lineLabel.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [topBgView addSubview:lineLabel];
    
    _scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavigaHeight + 50 , kScreenWidth, kScreenHeight - 50 - NavigaHeight - SystemSafeAreaBottom)];
    _scroller.showsVerticalScrollIndicator = YES;
    _scroller.showsHorizontalScrollIndicator = YES;
    _scroller.delegate = self;
    _scroller.pagingEnabled = YES;
    
    _scroller.contentSize = CGSizeMake(kScreenWidth * array.count, 0);
    [self.view addSubview:_scroller];
    
}

-(void)initDateAction {
    //全部
    GaneltOrderListItemViewController * allViewcontroller = [[GaneltOrderListItemViewController alloc]init];
    [subArray addObject:allViewcontroller];
    //待支付
    GaneltOrderListItemViewController * noPaymentViewcontrller = [[GaneltOrderListItemViewController alloc]init];
    [subArray addObject:noPaymentViewcontrller];
    //已支付
    GaneltOrderListItemViewController * paymentViewcontrller = [[GaneltOrderListItemViewController alloc]init];
    [subArray addObject:paymentViewcontrller];
    //已取消
    GaneltOrderListItemViewController * waitIssuingViewcontrller = [[GaneltOrderListItemViewController alloc]init];
    [subArray addObject:waitIssuingViewcontrller];
    
    [self addFirstView];
}

- (void)addFirstView {
    
    GaneltOrderListItemViewController * Viewcontroller = (GaneltOrderListItemViewController *)[subArray objectAtIndex:0];
    Viewcontroller.view.frame = CGRectMake(0 ,0, kScreenWidth, kScreenHeight - 50 - NavigaHeight - SystemSafeAreaBottom);
    [_scroller addSubview:Viewcontroller.view];
    [self addChildViewController:Viewcontroller];
    
}

- (void)chageClick:(UIButton *)btn{
    UIView * topBgView = (UIView *)[self.view viewWithTag:9999];
    for (UIView * view in topBgView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton * currentBtn = (UIButton *)view;
            if (currentBtn.tag == btn.tag) {
                currentBtn.selected = YES;
            } else {
                currentBtn.selected = NO;
            }
        }
    }
    NSInteger index = btn.tag - 100;
    [_scroller setContentOffset:CGPointMake(index * kScreenWidth, 0) animated:YES];
    
    [UIView animateWithDuration:0.1 animations:^{
        readBottomLine.frame = CGRectMake(index  * (kScreenWidth / subArray.count)+(( (kScreenWidth / subArray.count) - [_itemsWidth[index] floatValue]) / 2), 48, [_itemsWidth[index] floatValue], 2);
    }];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger currentIndex = scrollView.contentOffset.x / kScreenWidth ;
    UIViewController * viewController;
    viewController = (GaneltOrderListItemViewController *)[subArray objectAtIndex:currentIndex];
    
    viewController.view.frame = CGRectMake(currentIndex * kScreenWidth , 0, kScreenWidth, kScreenHeight - 50 - NavigaHeight - SystemSafeAreaBottom);
    
    [_scroller addSubview:viewController.view];
    [self addChildViewController:viewController];
    
    if (scrollView.contentOffset.x == currentIndex * kScreenWidth) {
        
        UIView * topBgView = (UIView *)[self.view viewWithTag:9999];
        UIButton * btn = [topBgView viewWithTag:currentIndex + 100];
        for (UIView * view in topBgView.subviews) {
            if ([view isKindOfClass:[UIButton class]]) {
                UIButton * currentBtn = (UIButton *)view;
                if (btn.tag == currentBtn.tag) {
                    currentBtn.selected = YES;
                } else {
                    currentBtn.selected = NO;
                }
            }
        }
        [UIView animateWithDuration:0.1 animations:^{
            readBottomLine.frame = CGRectMake(currentIndex  * (kScreenWidth / subArray.count)+(( (kScreenWidth / subArray.count) - [_itemsWidth[currentIndex] floatValue]) / 2), 48, [_itemsWidth[currentIndex] floatValue], 2);
        }];
        
    }
}

//计算数组内字体的宽度
- (NSArray *)getButtonsWidthWithTitles:(NSArray *)titles;
{
    NSMutableArray *widths = [@[] mutableCopy];
    
    for (NSString *title in titles)
    {
        CGSize textMaxSize = CGSizeMake(kScreenWidth, MAXFLOAT);
        //        CGSize textRealSize = [title sizeWithFont:[UIFont systemFontOfSize:16] maxSize:textMaxSize ];
        NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
        CGSize textRealSize = [title boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        NSNumber *width = [NSNumber numberWithFloat:textRealSize.width];
        [widths addObject:width];
    }
    
    return widths;
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
