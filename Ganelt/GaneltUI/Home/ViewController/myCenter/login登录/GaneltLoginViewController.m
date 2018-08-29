//
//  GaneltLoginViewController.m
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltLoginViewController.h"

@interface GaneltLoginViewController ()

@end

@implementation GaneltLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"登录"];
    self.logInBtn.layer.borderWidth = 0.5;
    self.logInBtn.layer.borderColor = UIColorFromRGB(0xf0f0f0).CGColor;
    self.logInBtn.layer.cornerRadius = 5;
    [self.logInBtn setBackgroundColor: UIColorFromRGB(0x3ca9fd)];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginClick:(id)sender {
    if (self.phoneNumTextFiled.text.length == 0) {
        [[MBProgressHUDManager getInstance]showMessage:@"请输入手机号" duration:2];
    }else if (self.passwordTextFiled.text.length == 0){
        [[MBProgressHUDManager getInstance]showMessage:@"请输入密码" duration:2];
    }else if (![JudgeMobileNumber isMobile:self.phoneNumTextFiled.text]) {
        [[MBProgressHUDManager getInstance]showMessage:@"请输入正确手机号" duration:2];
    }else{
        [self requestLogin];
    }
}
//登录
- (void)requestLogin{
    GaneltPersonAccount * personAccount = [[GaneltPersonAccount alloc]init];
    personAccount.userId = [NSString stringWithFormat:@"%@",@"56534"];
    [personAccount save];
    [self information:[NSString stringWithFormat:@"%@",@"56534"]];

//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    parameters[@"USERNAME"] = @"15910588440";
//    parameters[@"PASSWORD"] = @"123456";
//    [[GaneltAFnetWorkManager getInstance]requestUrl:http_login HttpRequestType:POST parameters:parameters progress:^(NSProgress *uploadProgress) {
//
//    } success:^(NSDictionary *result) {
//        NSLog(@"%@",result);
//        NSDictionary * dic = result[@"DATA"];
//        GaneltPersonAccount * personAccount = [[GaneltPersonAccount alloc]init];
//        personAccount.userId = [NSString stringWithFormat:@"%@",dic[@"USERID"]];
//        [personAccount save];
//        [self information:[NSString stringWithFormat:@"%@",dic[@"USERID"]]];
//    } failure:^(NSError *error) {
//
//    }];
}
//查询用户信息
- (void)information:(NSString *)userId{
    GaneltUserFormation * userFormation = [[GaneltUserFormation alloc]init];
    userFormation.ACCOUNT = self.phoneNumTextFiled.text;
    userFormation.AUTHENTICATION = @"sfsdf";
    userFormation.AVATAR = @"";
    userFormation.GRADE = @"一级";
    userFormation.IDCARD = @"";
    userFormation.PHONE = self.phoneNumTextFiled.text;
    userFormation.SEX = @"男";
    userFormation.STARRATING = @"2";
    userFormation.NAME = @"小捷";
    [userFormation save];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"loginFresh" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    parameters[@"USERID"] = userId;
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
