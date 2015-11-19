//
//  HEExploreCell.m
//  warmup
//
//  Created by Hackice on 15/11/19.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import "HEExploreCell.h"

@implementation HEExploreCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *  重写该方法以拦截frame并进行修改, 达到修改行高的目的
 */
- (void)setFrame:(CGRect)frame {
    
    // 制造"缝隙"分割线
    frame.size.height -= 1;
    
    return [super setFrame:frame];
}

@end
