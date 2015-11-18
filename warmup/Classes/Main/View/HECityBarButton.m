//
//  HECityBarButton.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import "HECityBarButton.h"

@implementation HECityBarButton



- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // title color
        [self setTitleColor:HEGlobalColor forState:UIControlStateNormal];
//        [self setTitleColor:HEGlobalColor forState:UIControlStateSelected];
        
        [self setTitle:@"广州" forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"temparr"] forState:UIControlStateNormal];
        
        // font size
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self sizeToFit];
        
        [self addTarget:self action:@selector(cityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);

}

- (void)setHighlighted:(BOOL)highlighted {
    // 屏蔽高亮状态
}

- (void)setSelected:(BOOL)selected {

//    [UIView animateWithDuration:0.5 animations:^{
//        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
//    }];
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
}

- (void)cityButtonClick:(HECityBarButton *)cityBarButton {

    cityBarButton.selected = !cityBarButton.isSelected;
}

@end
