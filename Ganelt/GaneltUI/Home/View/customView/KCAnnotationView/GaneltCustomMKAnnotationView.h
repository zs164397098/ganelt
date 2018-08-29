//
//  GaneltCustomMKAnnotationView.h
//  Ganelt
//
//  Created by shenshen on 2018/2/4.
//  Copyright © 2018年 shenshen. All rights reserved.
//

#import "GaneltMKAnnotation.h"
#import <MapKit/MapKit.h>

@interface GaneltCustomMKAnnotationView : MKAnnotationView
@property (nonatomic, strong)UIImageView * backgroundView;
@property (nonatomic, strong)UIImageView * iconView;
@property (nonatomic, strong)UILabel * detailLabel;

@end
