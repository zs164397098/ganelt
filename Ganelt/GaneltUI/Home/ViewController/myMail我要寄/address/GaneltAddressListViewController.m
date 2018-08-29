//
//  GaneltAddressListViewController.m
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltAddressListViewController.h"
#import "GaneltMailAddressListCell.h"
#import "GaneltAddNewAddressViewController.h"
#import "GaneltAddressEntityManager.h"
#import "AddressEntity+CoreDataClass.h"
@interface GaneltAddressListViewController ()<UITableViewDelegate,UITableViewDataSource,LYSideslipCellDelegate,newAddress>
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSMutableArray * addressArray;

@end

@implementation GaneltAddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"地址"];
    [self.view addSubview:self.mainTableView];
    [self createRightBtn];
    self.addressArray = [NSMutableArray array];
    [self initData];
    // Do any additional setup after loading the view.
}

- (void)initData{
    NSArray * array = [[GaneltAddressEntityManager sharedInstance]fetAllArray];
    if (array.count != 0) {
        [self.addressArray removeAllObjects];
        for (AddressEntity *entity in array) {
            GaneltAddressFormationModel *model = [[GaneltAddressFormationModel alloc]init];
            model.provinceCode = entity.provinceCode;
            model.cityCode = entity.cityCode;
            model.areaCode = entity.areaCode;
            model.provinceName = entity.provinceName;
            model.cityName = entity.cityName;
            model.areaName = entity.areaName;
            model.addressDetail = entity.addressDetail;
            model.phoneNum = entity.phoneNum;
            model.name = entity.name;
            model.sexStr = entity.sexStr;
            model.time = entity.time;
            [self.addressArray addObject:model];
        }
    }
    [self.mainTableView reloadData];
}
- (void)createRightBtn{
    [self setRightNavigationBarItem:@"添加" image:nil target:self selector:@selector(rightClick)];
}

- (void)newAddressStr{
    [self initData];
}
- (void)rightClick{
    GaneltAddNewAddressViewController * viewController = [[GaneltAddNewAddressViewController alloc]init];
    viewController.delgate = self;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavigaHeight,kScreenWidth ,kScreenHeight - NavigaHeight - SystemSafeAreaBottom) style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[GaneltMailAddressListCell class] forCellReuseIdentifier:@"GaneltMailAddressListCell"];
    }
    return _mainTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.addressArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GaneltMailAddressListCell * cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"GaneltMailAddressListCell"];
    GaneltAddressFormationModel *model = [self.addressArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = model.name;
    cell.addressLabel.text = [NSString stringWithFormat:@"%@%@%@%@",model.provinceName,model.cityName,model.areaName,model.addressDetail];
    cell.delegate = self;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GaneltAddressFormationModel *model = [self.addressArray objectAtIndex:indexPath.row];
    if (self.delgate && [self.delgate respondsToSelector:@selector(getAddressStr:)]){
        [self.delgate getAddressStr:[NSString stringWithFormat:@"%@%@%@%@",model.provinceName,model.cityName,model.areaName,model.addressDetail]];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.preservesSuperviewLayoutMargins = NO;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
}
#pragma mark - LYSideslipCellDelegate
- (NSArray<LYSideslipCellAction *> *)sideslipCell:(LYSideslipCell *)sideslipCell editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//    LYSideslipCellAction *action1 = [LYSideslipCellAction rowActionWithStyle:LYSideslipCellActionStyleNormal title:@"编辑" handler:^(LYSideslipCellAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSLog(@"编辑");
//        HenooConstacDetailViewController * detailContactsViewController= [[HenooConstacDetailViewController alloc]init];
//        detailContactsViewController.delegate = self;
//        detailContactsViewController.contactId = model.ID;
//        detailContactsViewController.relationName = model.RELATIONNAME;
//        detailContactsViewController.isEdit = YES;
//        detailContactsViewController.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:detailContactsViewController animated:YES];
//        [sideslipCell hiddenAllSideslip];
//    }];
    LYSideslipCellAction *action2 = [LYSideslipCellAction rowActionWithStyle:LYSideslipCellActionStyleDestructive title:@"删除" handler:^(LYSideslipCellAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
        
    }];
    
    NSArray *array = @[action2];
    return array;
}

- (BOOL)sideslipCell:(LYSideslipCell *)sideslipCell canSideslipRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
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
