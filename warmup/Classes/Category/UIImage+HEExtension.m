//
//  UIImage+HEExtension.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "UIImage+HEExtension.h"

@implementation UIImage (HEExtension)

- (instancetype)circleImage {

    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 获取尺寸
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // 绘制圆形
    CGContextAddEllipseInRect(ctx, rect);
    
    // 截取
    CGContextClip(ctx);
    
    // 绘制图片
    [self drawInRect:rect];
    
    // 获取截取好的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();

    return image;
}


+ (instancetype)imageCircledNamed:(NSString *)image {

    return [[self imageNamed:image] circleImage];
}

@end
