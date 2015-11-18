//
//  UIImageView+HEHead.h
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HEHead)

/**
 *  自定义UIImageView的形状(预设:圆形)
 *
 *  @param url 图片的地址
 *
 *  @return 裁剪好的UIImageView
 */
- (void)setHeadWithURL:(NSURL *)url;

@end
