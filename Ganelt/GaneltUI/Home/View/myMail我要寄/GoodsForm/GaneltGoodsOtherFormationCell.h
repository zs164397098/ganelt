//
//  GaneltGoodsOtherFormationCell.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/3/1.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaneltGoodsOtherFormationCell : UITableViewCell<UITextViewDelegate>
@property (nonatomic ,strong)UITextView * formationTextView;

@property (nonatomic ,strong)UILabel * placeLabel;

@property (nonatomic ,strong)UILabel * lineBottomLabel;

@end
