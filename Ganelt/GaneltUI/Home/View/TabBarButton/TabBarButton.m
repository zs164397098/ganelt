//
//  TabBarButton.m
//  Created by apple on 15/10/22.
//  Copyright © 2015年 grx. All rights reserved.
//

#import "TabBarButton.h"
@implementation TabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((self.frame.size.width - 25)/2.0, 6, 25, 25);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
   return CGRectMake(0, 30, self.frame.size.width, 19);
    
}



@end
