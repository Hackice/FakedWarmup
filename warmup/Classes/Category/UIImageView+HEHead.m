//
//  UIImageView+HEHead.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright (c) 2015年 Hackice. All rights reserved.
//

#import "UIImageView+HEHead.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (HEHead)

- (void)setHeadWithURL:(NSURL *)url {

    [self setCircleHeadWithURL:url];
}

/**
 *  矩形头像
 */
- (void)setRectHeadWithURL:(NSURL *)url {
    
   [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

/**
 *  圆形头像
 */
- (void)setCircleHeadWithURL:(NSURL *)url {
    
    UIImage *placeholder = [UIImage imageCircledNamed:@"defaultUserIcon"];
    
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!image) {
            
            return;
        }
        
        self.image = [image circleImage];
    }];
}

@end
