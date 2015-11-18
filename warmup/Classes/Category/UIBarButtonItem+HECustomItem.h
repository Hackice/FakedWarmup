//
//  UIBarButtonItem+HECustomItem.h
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HECustomItem)

/**
 *  创建自定义的导航栏Item
 *
 *  @param image          图片名称
 *  @param highlightImage 高亮图片名称
 *  @param target         监听者
 *  @param action         监听方法
 *
 *  @return UIBarButtonItem
 */
+ (instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

/**
 *  创建自定义样式的返回按钮
 *
 *  @param target 监听者
 *  @param action 监听方法
 *
 *  @return UIBarButtonItem
 */
+ (instancetype)itemWithCustomBackWithTarget:(id)target action:(SEL)action;

@end
