//
//  GaneltDetailAddressCell.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaneltDetailAddressCell : UITableViewCell<UITextViewDelegate>
@property (nonatomic ,strong)UITextView * detailAddressTextView;

@property (nonatomic ,strong)UILabel * placeLabel;

@property (nonatomic ,strong)UILabel * lineBottomLabel;

@end
