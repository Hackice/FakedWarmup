//
//  UITextField+HEExtension.m
//  FakedBudejie
//
//  Created by Hackice on 15/9/11.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "UITextField+HEExtension.h"

@implementation UITextField (HEExtension)

- (UIColor *)placeholderColor {

    return [self valueForKeyPath:@"placeholderLabel.textColor"];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {

    BOOL hasPlaceholder = NO;
    
    if (!self.placeholder) {
        
        self.placeholder = @" ";
        
        hasPlaceholder = YES;
    }
    
    // kvc private ivar
    [self setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
    
    if (hasPlaceholder) {
        
        self.placeholder = nil;
        
        hasPlaceholder = NO;
    }
}

@end
