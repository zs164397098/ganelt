//
//  GaneltGoodsFormViewController.h
//  Ganelt
//
//  Created by shenshen on 2018/1/27.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltParentsViewController.h"
@protocol goodsSelect <NSObject>
- (void)getAddgoods:(NSString *)goodsType;
@end
@interface GaneltGoodsFormViewController : GaneltParentsViewController
@property (nonatomic, assign) id <goodsSelect> delgate;

@property (nonatomic, copy) NSString * goodsStr;

@end

