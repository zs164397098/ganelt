//
//  GaneltAddressListViewController.h
//  Ganelt
//
//  Created by 北京善康科技有限公司 on 2018/2/28.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltParentsViewController.h"
@protocol selectAddress <NSObject>
- (void)getAddressStr:(NSString *)address;
@end
@interface GaneltAddressListViewController : GaneltParentsViewController
@property (nonatomic, assign) id <selectAddress> delgate;
@end
