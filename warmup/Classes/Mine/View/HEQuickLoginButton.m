//
//  HEQuickLoginButton.m
//  FakedBudejie
//
//  Created by Hackice on 15/9/2.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "HEQuickLoginButton.h"

@implementation HEQuickLoginButton

- (void)awakeFromNib {

    // just do once
    
    // titleLabel alignment center
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

// reset subviews layout
- (void)layoutSubviews {

    // remember super layoutSubviews
    [super layoutSubviews];
    
    // reset imageView frame
    CGRect imageViewFrame = self.imageView.frame;
    imageViewFrame.origin.y = 0;
    self.imageView.frame = imageViewFrame;
    
    // reset titleLabel frame
    CGRect titleLabelFrame = self.titleLabel.frame;
    titleLabelFrame.origin.x = 0;
    titleLabelFrame.origin.y = CGRectGetMaxY(self.imageView.frame);
    titleLabelFrame.size.width = CGRectGetWidth(self.frame);
    titleLabelFrame.size.height = CGRectGetHeight(self.frame) - CGRectGetHeight(self.imageView.frame);
    self.titleLabel.frame = titleLabelFrame;
}

@end
