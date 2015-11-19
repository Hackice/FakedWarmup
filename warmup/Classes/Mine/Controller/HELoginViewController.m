//
//  HELoginViewController.m
//  FakedBudejie
//
//  Created by Hackice on 15/9/2.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "HELoginViewController.h"
#import "HELoginRegisterTextFiled.h"

@interface HELoginViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewOffset;/**< 登录模块左边约束 */

@property (nonatomic, getter=isRegitsterView) BOOL registerView;/**< 是否为注册模块 */

@property (strong, nonatomic) IBOutletCollection(HELoginRegisterTextFiled) NSArray *textFileds;

@end

@implementation HELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /* is not register */
    self.registerView = NO;
}

// 当视图出现时修改状态栏样式为白色
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    // 白色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

// 当视图消失时修改状态栏样式回黑色
- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    
    // 黑色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

// set statusBar style : 因在Info.plist中取消控制器管理状态栏导致该方法失效，改用UIApplication实现
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    
//    return UIStatusBarStyleLightContent;
//}

/**
 *  点击关闭按钮
 */
- (IBAction)closeButtonClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  点击注册账号按钮
 */
- (IBAction)registerButtonClick:(UIButton *)sender {
    
    // stop editing
    [self.view endEditing:YES];
    
    // clear textFiled
    for (HELoginRegisterTextFiled *textFiled in self.textFileds) {
        
        textFiled.text = nil;
    }
    // login or register?
    self.registerView = !self.isRegitsterView;
    
    // change button
    sender.selected = !sender.isSelected;
    
    // change view
    [self changeLoginRegisterInSpringAnimation];
}

- (void)changeLoginRegisterInNormalAnimation {
    /* did removed login view trailing space constraints to view */
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    
    self.loginViewOffset.constant = self.registerView?(-width):0;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.view layoutIfNeeded];
    }];
}

- (void)changeLoginRegisterInSpringAnimation {
    /* custom animation */
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    
    self.loginViewOffset.constant = self.registerView?(-width):0;
    
    [UIView animateWithDuration:1.5f delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:12.0f options:UIViewAnimationOptionAllowUserInteraction animations:^{

        [self.view layoutIfNeeded];

    } completion:nil];
}

/**
 *  点击空白处收起键盘
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // remember this usage
    [self.view endEditing:YES];
}

@end
