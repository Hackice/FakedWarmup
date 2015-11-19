//
//  HETabBar.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "HETabBar.h"
#import "HELoginViewController.h"

/*
 
 use Runtime to find the "UITabBarButton"
 
 */
@interface HETabBar ()

@property (weak, nonatomic) UIButton *loginButton;/**< 发布按钮 */

@end

@implementation HETabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    // remember the method to init object
    if (self = [super initWithFrame:frame]) {
        
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [loginButton setImage:[UIImage imageNamed:@"Mine_item"] forState:UIControlStateNormal];
        
        [loginButton sizeToFit];
        
        [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:loginButton];
        self.loginButton = loginButton;
    }
    return self;
}

- (void)layoutSubviews {
    
    // rememer super method
    [super layoutSubviews];

    
    // make a index
    int indexCount = 0;
    
    CGFloat buttonWidth = CGRectGetWidth(self.frame) / 4;
    
    CGFloat buttonY = 0;
    CGFloat buttonHeight = CGRectGetHeight(self.frame);
    
    for (UIView *tabBarButton in self.subviews) {
        
        CGFloat buttonX = buttonWidth * indexCount;
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {

            tabBarButton.frame = CGRectMake(buttonX, buttonY + 6, buttonWidth, buttonHeight);

            // index + 1
            indexCount++;
            
            if (indexCount == 2) {
                
                // set publish button frame
                self.loginButton.frame = CGRectMake(buttonWidth * 3, buttonY, buttonWidth, buttonHeight);
            }
        }
    }
}

- (void)loginButtonClick {
    
    HELoginViewController *loginVC = [[HELoginViewController alloc] init];
    
    [self.window.rootViewController presentViewController:loginVC animated:YES completion:nil];
}

@end
