//
//  UIView+HEExtension.h
//  warmup
//
//  Created by Hackice on 15/9/11.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HEExtension)

/*
    在Category中的@propery不会创建_成员变量, 也不会生成getter / setter方法的实现
 */
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/**
 *  从xib加载控件
 */
+ (instancetype)viewFromXib;

@end
