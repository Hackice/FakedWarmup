//
//  HELoginRegisterTextFiled.m
//  FakedBudejie
//
//  Created by Hackice on 15/9/3.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "HELoginRegisterTextFiled.h"
#import <objc/runtime.h>

// 默认占位文字颜色
#define HEDefaultPlaceholderColor [UIColor whiteColor]

@implementation HELoginRegisterTextFiled

- (void)awakeFromNib {

    // set corsor color
    self.tintColor = [UIColor whiteColor];
    
    // setup placeholder textLabel color
    self.placeholderColor = HEDefaultPlaceholderColor;

    /******* search the placeHolder by using runtime ********/
//    unsigned int outCount = 0;
//    
//    Ivar *ivars = class_copyIvarList([UITextField class], &outCount);
//    
//    HELog(@"----------实例变量数量:%i", outCount);
//    
//    for (int i = 0; i < outCount; ++i) {
//        
//        Ivar ivar = ivars[i];
//        
//        HELog(@"第%i个实例变量:%s", i, ivar_getName(ivar));
//    }
//    
//    // remember to release
//    free(ivars);
    /************************ end ***************************/
}


- (BOOL)becomeFirstResponder {

    self.placeholderColor = self.tintColor;
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {

    self.placeholderColor = HEDefaultPlaceholderColor;
    return [super resignFirstResponder];
}

@end
