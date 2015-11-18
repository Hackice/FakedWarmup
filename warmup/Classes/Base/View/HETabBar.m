//
//  HETabBar.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "HETabBar.h"
/*
 
 use Runtime to find the "UITabBarButton"
 
 */
@interface HETabBar ()

@end

@implementation HETabBar

- (void)layoutSubviews {

    // rememer super method
    [super layoutSubviews];
    
    for (UIView *tabBarButton in self.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {

            tabBarButton.y += 6;
            
        }
    }
}


@end
