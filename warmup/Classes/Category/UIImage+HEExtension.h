//
//  UIImage+HEExtension.h
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HEExtension)

/**
 *  创建一个圆形图片
 */
- (instancetype)circleImage;

/**
 *  创建一个圆形图片
 *
 *  @param image 图片
 */
+ (instancetype)imageCircledNamed:(NSString *)image;

@end
