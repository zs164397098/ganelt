//
//  GaneltGoodsFormHeadCell.h
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RootCellDelegate <NSObject>
/**
 * 点击UICollectionViewCell的代理方法
 */
- (void)didSelectItemAtRow:(NSInteger)itemNum;
@end
@interface GaneltGoodsFormHeadCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) id<RootCellDelegate> delegate;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *imageAry;

@property (nonatomic, strong) NSArray *titleAry;

@property (nonatomic, strong) NSString * selectTitle;

@end
