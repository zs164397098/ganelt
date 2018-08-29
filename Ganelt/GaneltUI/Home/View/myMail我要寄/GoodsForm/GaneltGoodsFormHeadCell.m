//
//  GaneltGoodsFormHeadCell.m
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltGoodsFormHeadCell.h"
#import "GaneltGoodsFormItemCollectionViewCell.h"
@implementation GaneltGoodsFormHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    CGFloat weight = (float)(kScreenWidth - 30) / (float)4;
    CGFloat height = weight;
    
    [self.contentView addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(10, 0, kScreenWidth - 20, height * 2 + 5);
    
}

#pragma mark ====== UICollectionViewDelegate ======
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.imageAry.count == 0) {
        return 0;
    } else {
        return self.imageAry.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GaneltGoodsFormItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GaneltGoodsFormItemCollectionViewCell" forIndexPath:indexPath];
    [cell.imgView setImage:[UIImage imageNamed:self.imageAry [indexPath.row]]];
    cell.titleLabel.text = self.titleAry[indexPath.row];
    if ([self.selectTitle isEqualToString:self.titleAry[indexPath.row]]) {
        cell.titleLabel.textColor = UIColorFromRGB(0x3ca9fd);
    }else{
        cell.titleLabel.textColor = UIColorFromRGB(0x333333);
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItemAtRow:)]) {
        [self.delegate didSelectItemAtRow:indexPath.row];
        self.selectTitle = self.titleAry[indexPath.row];
        [collectionView reloadData];
     }

}

#pragma mark ====== init ======
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        CGFloat weight = (float)(kScreenWidth - 50) / (float)4;
        CGFloat height = weight;
        layout.itemSize = CGSizeMake(weight, height);
        layout.minimumInteritemSpacing = 5;// 垂直方向的间距
        layout.minimumLineSpacing = 5; // 水平方向的间距
        //        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        [_collectionView registerClass:[GaneltGoodsFormItemCollectionViewCell class] forCellWithReuseIdentifier:@"GaneltGoodsFormItemCollectionViewCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
@end
