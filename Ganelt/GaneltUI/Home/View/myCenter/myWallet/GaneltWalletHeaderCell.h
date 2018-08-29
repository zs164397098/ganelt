//
//  GaneltWalletHeaderCell.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/5.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaneltWalletHeaderCell : UITableViewCell
@property (nonatomic ,strong)UILabel * titleLabel;

@property (nonatomic ,strong)UILabel * priceLabel;

@property (nonatomic ,strong)UIButton * rechargeBtn;//充值

@property (nonatomic ,strong)UIButton * reflectBtn;//提现

@end
