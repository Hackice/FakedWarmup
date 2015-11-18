//
//  HETabBarController.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

/*
 
 TabBars:
 
 1.主页推送 Main
 2.课程心得 Experience
 3.搜索频道 Explore
 4.个人详情 Mine
 
 */
#import "HETabBarController.h"
#import "HENavigationController.h"
#import "HETabBar.h"
#import "HEMainController.h"
#import "HEExperienceController.h"
#import "HEExploreController.h"
#import "HEMineController.h"

@interface HETabBarController ()

@end

@implementation HETabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupChildViewControllers];
    
    [self replaceTabBar];
}

/**
 *  替换系统默认tabBar
 */
- (void)replaceTabBar {

    [self setValue:[[HETabBar alloc] init] forKeyPath:@"tabBar"];
}

/**
 *  加载子控制器
 */
- (void)setupChildViewControllers {
    
    [self addChildViewControllerWith:[[HEMainController alloc] init] image:@"Main_item" selectedImage:@"Main_item_selected"];
    
    [self addChildViewControllerWith:[[HEExperienceController alloc] init] image:@"Experience_item" selectedImage:@"Experience_item_selected"];
   
    [self addChildViewControllerWith:[[HEExploreController alloc] initWithStyle:UITableViewStyleGrouped] image:@"Explore_item" selectedImage:@"Explore_item_selected"];
    
    [self addChildViewControllerWith:[[HEMineController alloc] initWithStyle:UITableViewStyleGrouped] image:@"Mine_item" selectedImage:@"Mine_item_selected"];
}

/**
 *  为HETabBarController添加子控制器
 *
 *  @param controller     控制器
 *  @param title          按钮标题
 *  @param image          按钮图片
 *  @param selectedImage 按钮选中图片
 */
- (void)addChildViewControllerWith:(UIViewController *)controller image:(NSString *)image selectedImage:(NSString *)selectedImage {

    HENavigationController *navi = [[HENavigationController alloc] initWithRootViewController:controller];
    
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self addChildViewController:navi];
    
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
}

@end
