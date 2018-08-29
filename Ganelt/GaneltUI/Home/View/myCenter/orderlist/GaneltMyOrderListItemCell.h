//
//  GaneltMyOrderListItemCell.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/3.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaneltMyOrderListItemCell : UITableViewCell

@property (nonatomic ,strong)UIImageView * nextImg;

@property (nonatomic ,strong)UIImageView * orderImg;

@property (nonatomic ,strong)UILabel * orderNumLabel;

@property (nonatomic ,strong)UILabel * fromeAddressLabel;

@property (nonatomic ,strong)UILabel * toAddressLabel;

@property (nonatomic ,strong)UILabel * createTimeLabel;

@property (nonatomic ,strong)UILabel * statusLabel;

@property (nonatomic ,strong)UILabel * lineOneLabel;

@property (nonatomic ,strong)UILabel * lineTwoLabel;

@end
