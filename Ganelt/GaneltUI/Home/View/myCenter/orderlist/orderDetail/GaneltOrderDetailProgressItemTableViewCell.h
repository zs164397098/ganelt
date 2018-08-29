//
//  GaneltOrderDetailProgressItemTableViewCell.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/3.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,hiddenType) {
    defaultsHidden = 1,
    topHidden      = 2,
    bottomHidden   = 3
};
@interface GaneltOrderDetailProgressItemTableViewCell : UITableViewCell
@property (nonatomic ,strong)UILabel * circleLabel;

@property (nonatomic ,strong)UILabel * timeLabel;

@property (nonatomic ,strong)UILabel * titleLabel;

@property (nonatomic ,strong)UILabel * lineLabel;
- (void)initFrame:(hiddenType)type;
@end
