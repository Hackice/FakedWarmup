//
//  HEMineController.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import "HEMineController.h"

//#import "ZDLoginRegistViewController.h"

@interface HEMineController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registButton;

@end

@implementation HEMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpButton:self.loginButton];
    [self setUpButton:self.registButton];
    
  }

//设置登录/注册按钮边框
- (void)setUpButton:(UIButton *)button
{
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
}

- (IBAction)loginButtonClick {
   
}

- (IBAction)registButtonClick {
}

//设置状态栏颜色为白色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//返回按钮
- (IBAction)backClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self.tabBarController presentViewController:self animated:YES completion:nil];
}

@end
