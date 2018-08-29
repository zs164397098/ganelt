//
//  GaneltLoginViewController.h
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltParentsViewController.h"

@interface GaneltLoginViewController : GaneltParentsViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextFiled;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;

@property (weak, nonatomic) IBOutlet UIButton *logInBtn;
@end
