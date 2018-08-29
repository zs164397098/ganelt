//
//  GaneltMKAnnotation.h
//  Ganelt
//
//  Created by shenshen on 2018/2/4.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface GaneltMKAnnotation : NSObject<MKAnnotation>
/**
 *  大头针的位置
 */
@property (nonatomic) CLLocationCoordinate2D coordinate;
/**
 *  大头针标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  大头针的子标题
 */
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic,strong) UIImage *image;
@end
