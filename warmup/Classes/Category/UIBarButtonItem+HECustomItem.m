//
//  UIBarButtonItem+HECustomItem.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "UIBarButtonItem+HECustomItem.h"

@implementation UIBarButtonItem (HECustomItem)

+ (instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action {
    
    // set navigationItem
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [button sizeToFit];

    // add event
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)itemWithCustomBackWithTarget:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // button title
//    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    // button image
    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [button sizeToFit];
    
    // add event
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // set offset
    [button setContentEdgeInsets:UIEdgeInsetsMake(0, - 20, 0, 0)];

    return [[self alloc] initWithCustomView:button];
}

@end
