//
//  GaneltBasicInformationViewController.m
//  Ganelt
//
//  Created by shenshen on 2018/1/24.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltBasicInformationViewController.h"
#import "GaneltAccountHeaderView.h"
@interface GaneltBasicInformationViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{
    UILabel * detailTextLabel;
}


@property (nonatomic,strong) UITableView *tableView;

// cell标题数组
@property (nonatomic,strong) NSArray *itemsArray;

// 头像image
@property (nonatomic, strong) UIImage *image;

// 性别弹框遮罩view
@property (nonatomic ,strong) UIView *viewCover;
// 性别弹框UIPickerView
@property (nonatomic ,strong) UIPickerView *pickView;
// 性别弹框 键盘取消确定view
@property (nonatomic ,strong) UIView *inputview;
// 选取性别的str
@property (nonatomic, strong) NSString *selectedGender;
// 盛放性别的数组
@property (nonatomic ,strong) NSArray *genderArr;

@property (nonatomic ,strong) UIImageView * navBg;

@property (nonatomic ,strong) GaneltAccountHeaderView *headerview;

@end

@implementation GaneltBasicInformationViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self addTitleViewWithTitle:@"账户管理"];
    // 获取用户信息
    //    GaneltUserFormation *personalInfo = [GaneltUserFormation getPersonalInfo];
    //    [self.headerview.iconImage sd_setImageWithURL:[NSURL URLWithString:personalInfo.agentPhoto]
    //                                 placeholderImage:[UIImage imageNamed:@"defaultIcon"]];
    
    // 获取会员用户信息
    [self lookPersonFormation];
    
}
- (void)clickBack:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0xf0f0f0);
    
    [self addUI];
    
    /**初始化,存储数据**/
    [self initDataArrayOrStrring];
    
}
/**
 * 初始化,存储数据
 */
- (void)initDataArrayOrStrring{
    // 性别数组
    self.genderArr = @[@"男",@"女"];
    self.itemsArray = @[@"昵称",@"姓名",@"性别",@"",@"推荐人"];
}

- (void)addUI {
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    _tableView.backgroundColor = UIColorFromRGB(0xf0f0f0);
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];// 去掉多余行及分割线
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorColor = UIColorFromRGB(0xf0f0f0);
    
    self.headerview = [[GaneltAccountHeaderView alloc] init];
    self.headerview.frame = CGRectMake(0, 0, kScreenWidth, 100);
    self.tableView.tableHeaderView = self.headerview;
    // 获取用户信息
    //    GaneltUserFormation *personalInfo = [GaneltUserFormation getPersonalInfo];
    //    [self.headerview.iconImage sd_setImageWithURL:[NSURL URLWithString:personalInfo.agentPhoto]
    //                                 placeholderImage:[UIImage imageNamed:@"defaultIcon"]];
    
    [self.headerview.backBtn addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickIconView:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.headerview addGestureRecognizer:tap];
    
    
    
    
    
    
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.itemsArray.count;
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reusedID = @"info";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reusedID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        detailTextLabel = [[UILabel alloc]init];
        detailTextLabel.frame = CGRectMake(kScreenWidth - 155 - 35, 0, 155, 50);
        detailTextLabel.tag = indexPath.row+10;
        detailTextLabel.textColor = UIColorFromRGB(0x999999);
        detailTextLabel.font = [UIFont systemFontOfSize:14.0f];
        detailTextLabel.textAlignment = 2;
        [cell.contentView addSubview:detailTextLabel];
    }
    
    cell.textLabel.textColor = UIColorFromRGB(0x333333);
    cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
    cell.textLabel.text = _itemsArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    detailTextLabel = (UILabel*)[cell.contentView viewWithTag:indexPath.row + 10];
    GaneltUserFormation * personalInfo = [GaneltUserFormation getAccountInfo];
    switch (indexPath.row + 10) {
            
        case 10:
            //昵称
            //            detailTextLabel.text = personalInfo.nickName;
            
            break;
        case 11:
            //姓名
            //            detailTextLabel.text = personalInfo.name;
            
            
            break;
            
        case 12:
            
            //性别
            //            if (personalInfo.agentSex.intValue == 0) {
            //                detailTextLabel.text = @"男";
            //            }else if (personalInfo.agentSex.intValue == 1){
            //                detailTextLabel.text = @"女";
            //            }
            break;
            
        case 13:
            cell.backgroundColor = UIColorFromRGB(0xf0f0f0);
            cell.accessoryType = UITableViewCellAccessoryNone;
            
            break;
            
        case 14:
            
            detailTextLabel.text = @"dddd";
            cell.accessoryType = UITableViewCellAccessoryNone;
            
            break;
        default:
            break;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        return 10;
    }else{
        return 50;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",(long)indexPath.row);
    
    switch (indexPath.row) {
        case 0:
            
            // 修改昵称
            [self showNickNameAlertView];
            break;
        case 1:
            
            // 修改姓名
            [self pushNameVC];
            
            break;
        case 2:
            
            // 修改性别
            [self showSexAlertView];
            
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 修改昵称
- (void)showNickNameAlertView {
    
}


#pragma mark - 修改姓名
- (void)pushNameVC {
    
}
#pragma mark - 修改邮箱
- (void)changeEmail {
    
}
#pragma mark - 账户安全
- (void)accountSecurity {
    
}

#pragma mark - 性别弹框
/**
 *  gender  1:男  其它:女
 */
- (void)showSexAlertView {
    
    self.viewCover = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.viewCover.backgroundColor = [UIColor blackColor];
    self.viewCover.alpha = 0.7;
    [self.view addSubview:self.viewCover];
    
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 200, kScreenWidth, 150)];
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    [self.view addSubview:self.pickView];
    self.pickView.backgroundColor  = [UIColor whiteColor];
    
    [self textFieldInputAccessoryView];
    
}
/**
 *  键盘上方InputAccessoryView
 *
 *  @return InputAccessoryView
 */
- (void)textFieldInputAccessoryView {
    self.inputview = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 60, kScreenWidth, 60)];
    self.inputview.backgroundColor = [UIColor whiteColor];
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancel addTarget:self action:@selector(canCelBtn) forControlEvents:UIControlEventTouchUpInside];
    cancel.frame = CGRectMake(50, 0, 50, 40);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.inputview addSubview:cancel];
    
    UIButton *save = [UIButton buttonWithType:UIButtonTypeCustom];
    [save addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
    save.frame = CGRectMake(kScreenWidth - 50 - 50, 0, 50, 40);
    [save setTitle:@"确认" forState:UIControlStateNormal];
    [save setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.inputview addSubview:save];
    
    [self.view addSubview:self.inputview];
}

// 隐藏view
-(void)hideView{
    self.viewCover.hidden = YES;
    self.pickView.hidden = YES;
    self.inputview.hidden = YES;
}
// 点击性别遮罩，隐藏遮罩和pickView
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self hideView];
}
// 性别-取消按钮
-(void)canCelBtn{
    [self hideView];
}
// 性别-确认按钮
-(void)saveBtn{
    
    GaneltUserFormation *personInfo = [GaneltUserFormation getAccountInfo];
    
    [personInfo save];
    
    if ([self.selectedGender isEqualToString:@"女"]){
        //        personInfo.agentSex = @"1";
    }else{
        //        personInfo.agentSex = @"0";
    }
    /**修改-保存性别*/
    //    [self updateUserInfo:personInfo.agentSex icon:nil];
    
    
    [self hideView];
    
}
#pragma mark - UIPickerViewDataSource
//共有几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.genderArr.count;
}
//每行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.genderArr[row];
}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedGender = self.genderArr[row];
}
/*******************************修改头像部分********************************************/
#pragma mark - 加载获取系统图片的方法

- (void)loadMyEditView{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"选择头像"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照",@"选择相册图片",nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    actionSheet.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    
    //修改action的颜色
    for (id actionSheetSubview in actionSheet.subviews) {
        // Change the font color if the sub view is a UIButton
        if ([actionSheetSubview isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)actionSheetSubview;
            [button setTitleColor:[UIColor colorWithRed:0.182 green:0.555 blue:0.901 alpha:1.000] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:0.182 green:0.555 blue:0.901 alpha:1.000] forState:UIControlStateSelected];
            [button setTitleColor:[UIColor colorWithRed:0.182 green:0.555 blue:0.901 alpha:1.000] forState:UIControlStateHighlighted];
        }
    }
    //显示弹出框
    [actionSheet showInView:self.view];
}
#pragma mark - actionSheet触发的代理回调
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self showCamera];
    }else if (buttonIndex == 1)
    {
        [self showPhoto];
    }
}
// 点击修改头像
- (void)clickIconView:(UIGestureRecognizer *)tap{
    
    [self loadMyEditView];
}
/**
 *  展示相机
 */
- (void)showCamera
{
    //    [GCDQueue executeInGlobalQueue:^{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    
    //        [GCDQueue executeInMainQueue:^{
    [self presentViewController:picker animated:YES completion:nil];//进入照相界面
    //        }];
    //    }];
}

/**
 *  展示照片
 */
- (void)showPhoto
{
    //    [GCDQueue executeInGlobalQueue:^{
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        pickerImage.allowsEditing = YES;
    }
    pickerImage.delegate = self;
    
    
    //        [GCDQueue executeInMainQueue:^{
    [self presentViewController:pickerImage animated:YES completion:^{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        pickerImage.allowsEditing = YES;
    }];
    //        }];
    //    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        //UIStatusBarStyleLightContent
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }];
}

/**
 *  选择照片的回调
 *
 *  @param picker UIImagePickerController对象
 *  @param info   返回信息
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }];
    // 获取相册中编辑后的图片
    UIImage * photo = [info objectForKey:UIImagePickerControllerEditedImage];
    
    CGSize size = photo.size;
    NSLog(@"size width = %f, height = %f",size.width,size.height);
    size.width = 300;
    size.height = 300;
    
    // 图片压缩 (三)
    UIImage *sizeImage = [self compressImageWith:photo scaledToSize:size];
    NSLog(@"sizeImage width = %f, height = %f",sizeImage.size.width,sizeImage.size.height);
    NSData *headImgData = UIImageJPEGRepresentation(sizeImage, 0.7);
    // data转换成字节流然后base64加密
    Byte *testByte = (Byte *)[headImgData bytes];
    NSString *str = [GTMBase64 stringByEncodingBytes:testByte length:[headImgData length]];
    // 把加密后的头像保存到本地
    NSUserDefaults *icon = [NSUserDefaults standardUserDefaults];
    [icon setObject:str forKey:@"userIcon"];
    self.image = sizeImage;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    UIImageWriteToSavedPhotosAlbum(sizeImage, nil, nil, nil);
    
    /**修改保存头像*/
    [self complete];
    
}
/**
 *  头像 点击完成按钮，上传服务器，完成修改个人资料
 */
- (void)complete {
    
    NSUserDefaults *userIcon = [NSUserDefaults standardUserDefaults];
    NSString *icon = [userIcon objectForKey:@"userIcon"];
    [self updateUserInfoicon:icon];
}
/**
 *  对图片尺寸进行压缩-- 第三种方法
 */
- (UIImage *)compressImageWith:(UIImage *)image scaledToSize:(CGSize)newSize
{
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    
    float widthScale = imageWidth /newSize.width;
    float heightScale = imageHeight /newSize.height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width, newSize.height));
    
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , newSize.height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, newSize.width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    return newImage;
}
//查询会员资料
- (void)lookPersonFormation{
//    GaneltPersonAccount * person = [GaneltPersonAccount getAccountInfo];
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    parameters[@"USERID"] = person.userId;
//    [[GaneltAFnetWorkManager getInstance]requestUrl:http_userInformation HttpRequestType:POST parameters:parameters progress:^(NSProgress *uploadProgress) {
//
//    } success:^(NSDictionary *result) {
//        NSLog(@"%@",result);
//        NSDictionary * dic = result[@"DATA"];
//        GaneltUserFormation * userFormation = [[GaneltUserFormation alloc]init];
//        userFormation.ACCOUNT = [NSString stringWithFormat:@"%@",dic[@"ACCOUNT"]];
//        userFormation.AUTHENTICATION = [NSString stringWithFormat:@"%@",dic[@"AUTHENTICATION"]];
//        userFormation.AVATAR = [NSString stringWithFormat:@"%@",dic[@"AVATAR"]];
//        userFormation.GRADE = [NSString stringWithFormat:@"%@",dic[@"GRADE"]];
//        userFormation.IDCARD = [NSString stringWithFormat:@"%@",dic[@"IDCARD"]];
//        userFormation.PHONE = [NSString stringWithFormat:@"%@",dic[@"PHONE"]];
//        userFormation.SEX = [NSString stringWithFormat:@"%@",dic[@"SEX"]];
//        userFormation.STARRATING = [NSString stringWithFormat:@"%@",dic[@"STARRATING"]];
//        userFormation.NAME = [NSString stringWithFormat:@"%@",dic[@"NAME"]];
//        [userFormation save];
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"loginFresh" object:nil];
//    } failure:^(NSError *error) {
//
//    }];
    
}

#pragma mark- 请求接口

/**
 *  修改个人资料
 *
 */
- (void)updateUserInfoicon:(NSString *)icon {
    GaneltPersonAccount * person = [GaneltPersonAccount getAccountInfo];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"USERID"] = person.userId;
    parameters[@"IMGDATA"] = icon;
    [[GaneltAFnetWorkManager getInstance]requestUrl:http_userAvatarupload HttpRequestType:POST parameters:parameters progress:^(NSProgress *uploadProgress) {
        
    } success:^(NSDictionary *result) {
        NSLog(@"%@",result);
        NSDictionary * dic = result[@"DATA"];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"loginFresh" object:nil];
    } failure:^(NSError *error) {
        
    }];
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
