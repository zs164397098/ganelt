//
//  GaneltSendViewController.m
//  Ganelt
//
//  Created by shenshen on 2018/1/21.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltSendViewController.h"
#import <MapKit/MapKit.h>
#import "GaneltMKAnnotation.h"
#import "GaneltCustomMKAnnotationView.h"
#import "GaneltMySendFormationView.h"
#import "GaneltMyOrderListViewController.h"
#import "GaneltMyCenterViewController.h"
@interface GaneltSendViewController ()<MKMapViewDelegate>
{
     MKMapView *_mapView;
}
@end

@implementation GaneltSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"我要送"];
    [self createMapView];
    // Do any additional setup after loading the view.
}

- (void)createMapView{
    [[GaneltCoreLocationManager getInstance]starLocation];
    _mapView=[[MKMapView alloc]initWithFrame:CGRectMake(0, NavigaHeight, kScreenWidth, kScreenHeight - TabbarHeight)];
    //设置代理
    _mapView.delegate=self;
    //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
    _mapView.userTrackingMode=MKUserTrackingModeFollow;
    //设置地图类型
    _mapView.mapType=MKMapTypeStandard;
    [self.view addSubview:_mapView];

    [[GaneltCoreLocationManager getInstance]setFetLocatCLLocation:^(CGFloat longitude, CGFloat latitude) {
        [self addAnnotationLongitude:longitude latitude:latitude];

    }];
}

- (void)addAnnotationLongitude:(CGFloat)longitude latitude:(CGFloat)latitude{
    NSArray * array = @[@"手机",@"笔记本",@"烤鸭",@"奶酪",@"红茶"];
    NSMutableArray * anArray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        int a = arc4random() % 100 / 10;
        CGFloat b = (float)(arc4random() % 10) / (float)1000;

        CLLocationCoordinate2D location2=CLLocationCoordinate2DMake(latitude + i * b * a, longitude + i * b * a );
        GaneltMKAnnotation *annotation2=[[GaneltMKAnnotation alloc]init];
        annotation2.title=array[i];
        annotation2.coordinate=location2;
//        annotation2.subtitle = @"ff";
        [anArray addObject:annotation2];
    }
    [_mapView removeOverlays:_mapView.overlays];
    [_mapView removeAnnotations:_mapView.annotations];
    [_mapView addAnnotations:anArray];

}

#pragma mark - 地图控件代理方法
#pragma mark 显示大头针时调用，注意方法中的annotation参数是即将显示的大头针对象
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[GaneltMKAnnotation class]]) {
        static NSString *key1=@"AnnotationKey1";
         GaneltCustomMKAnnotationView * annotationView = (GaneltCustomMKAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:key1];
        //如果缓存池中不存在则新建
        if (!annotationView) {
            annotationView=[[GaneltCustomMKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:key1];
//            annotationView.canShowCallout=true;//允许交互点击
            annotationView.calloutOffset=CGPointMake(0, 1);//定义详情视图偏移量
            annotationView.leftCalloutAccessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"location"]];//定义详情左侧视图
        }
        annotationView.detailLabel.text = annotation.title;
        //修改大头针视图
        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
        annotationView.annotation=annotation;
//        annotationView.image=((GaneltMKAnnotation *)annotation).image;//设置大头针视图的图片
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAnnotAtionClick:)];
        [annotationView addGestureRecognizer:tap];
        return annotationView;
    } else {
        return nil;
        
    }
}

- (void)tapAnnotAtionClick:(UITapGestureRecognizer *)tap{
//    GaneltCustomMKAnnotationView * view = (GaneltCustomMKAnnotationView *)tap.view;
//    [[MBProgressHUDManager getInstance]showMessage:view.detailLabel.text duration:1];
    GaneltMySendFormationView * formationView = [[GaneltMySendFormationView alloc] init];
    formationView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    UIView * fview = formationView;
    __weak typeof(self) weakself = self;
    formationView.sureClick = ^{
        //基本资料
        if ([GaneltPersonAccount checkLogin:YES withCurrentCtr:self]) {
            [weakself jumpOrder];
        }
        [fview removeFromSuperview];
    };
    formationView.cancleClick = ^{
        [fview removeFromSuperview];
    };
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:formationView];
}

//大头针显示在视图上时调用，在这里给大头针设置显示动画
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views{
    //    获得mapView的Frame
    CGRect visibleRect = [mapView annotationVisibleRect];
    
    for (MKAnnotationView *view in views) {
        
        CGRect endFrame = view.frame;
        CGRect startFrame = endFrame;
        startFrame.origin.y = visibleRect.origin.y - startFrame.size.height;
        view.frame = startFrame;
        [UIView beginAnimations:@"drop" context:NULL];
        [UIView setAnimationDuration:1];
        view.frame = endFrame;
        [UIView commitAnimations];
    }
}

- (void)jumpOrder{
    [_mapView removeFromSuperview];
    [[GaneltCoreLocationManager getInstance]stopLocation];

    NSMutableArray *keepArr =  [NSMutableArray array];
    [keepArr addObject:[[GaneltMyCenterViewController alloc]init]];
    GaneltMyOrderListViewController *myorder = [[GaneltMyOrderListViewController alloc]init];
    myorder.hidesBottomBarWhenPushed = YES;
    [keepArr addObject:myorder];
    [self.navigationController setViewControllers:keepArr animated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeitemStatus" object:@2];
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
