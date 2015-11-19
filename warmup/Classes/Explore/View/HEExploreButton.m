//
//  HEExploreButton.m
//  warmup
//
//  Created by Hackice on 15/11/19.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import "HEExploreButton.h"

@implementation HEExploreButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // font
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont fontWithName:@"FZLanTingkanHei-R-GBK" size:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    // reset imageView frame
    CGRect imageViewFrame = self.imageView.frame;
    imageViewFrame.size.width = 0.4 * width;
    imageViewFrame.size.height = imageViewFrame.size.width;
    imageViewFrame.origin.x = 0.5 * (width - imageViewFrame.size.width);
    imageViewFrame.origin.y = 0;
    self.imageView.frame = imageViewFrame;
    
    // reset titleLabel frame
    CGRect titleLabelFrame = self.titleLabel.frame;
    titleLabelFrame.origin.x = 0;
    titleLabelFrame.origin.y = CGRectGetMaxY(self.imageView.frame);
    titleLabelFrame.size.width = width;
    titleLabelFrame.size.height = height - titleLabelFrame.origin.y; // be careful here!
    self.titleLabel.frame = titleLabelFrame;
}

@end
