//
//  HENavigationController.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "HENavigationController.h"

@interface HENavigationController () <UIGestureRecognizerDelegate>

@end

@implementation HENavigationController

+ (void)initialize {
    
    // set navigation bar backgroundImage
    UINavigationBar *navigationBar = [UINavigationBar appearance];
//    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    // set navigationBar title
    NSMutableDictionary *titleAttributes = [NSMutableDictionary dictionary];
    titleAttributes[NSFontAttributeName] = [UIFont fontWithName:@"FZLanTingkanHei-R-GBK" size:18];
    titleAttributes[NSForegroundColorAttributeName] = HEGlobalColor;
    [navigationBar setTitleTextAttributes:titleAttributes];
    
    // set navigationBar barButtonItem
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];

    // normal
    NSMutableDictionary *itemNormalAttributes = [NSMutableDictionary dictionary];
    itemNormalAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    itemNormalAttributes[NSForegroundColorAttributeName] = HEGlobalColor;
    [barButtonItem setTitleTextAttributes:itemNormalAttributes forState:UIControlStateNormal];

    // disable
    NSMutableDictionary *itemDisableAttributes = [NSMutableDictionary dictionary];
    itemDisableAttributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [barButtonItem setTitleTextAttributes:itemDisableAttributes forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.interactivePopGestureRecognizer.delegate = self;
}

/* 重写push方法拦截控制器, 全局设置返回按钮 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.childViewControllers.count > 0) {
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithCustomBackWithTarget:self action:@selector(back)];
        
        /* 设置隐藏tabBar */
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 在这里设置控制器的背景颜色会调用控制器的viewDidLoad, 或许会导致子控制器中的部分操作失效
//    if ([viewController isKindOfClass:[HETempViewController class]]) {
//    
//        HEMineController *mineC = [[HEMineController alloc] init];
//        
//        [self presentViewController:mineC animated:YES completion:nil];
//    }
    
    // super方法的调用必要性和优先性需要清楚
    [super pushViewController:viewController animated:animated];
}

/**
 *  pop控制器的方法
 */
- (void)back {

    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

    return self.childViewControllers.count > 1;
}

@end
