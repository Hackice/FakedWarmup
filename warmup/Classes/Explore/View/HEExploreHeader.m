//
//  HEExploreHeader.m
//  warmup
//
//  Created by Hackice on 15/11/19.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import "HEExploreHeader.h"
#import "HEExploreButton.h"

@interface HEExploreHeader ()

@property (strong, nonatomic) NSMutableArray *buttons;/**< 按钮集合 */

@end

@implementation HEExploreHeader

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupButtons];
    }
    return self;
}

/**
 *  加载按钮组
 */
- (void)setupButtons {

    NSArray *buttonName = @[@"去野", @"玩艺", @"味道", @"音乐", @"姿体"];
    
    NSInteger count = buttonName.count;
    
    /** 每行button个数 */
    static NSInteger const colsCount = 3;
    
    // 声明按钮尺寸参数
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = HEScreenWidth / colsCount;
    CGFloat buttonH = 0.7 * buttonW;
    
    for (int i = 0; i < count; ++i) {
        
        HEExploreButton *button = [HEExploreButton buttonWithType:UIButtonTypeCustom];
        
        NSString *imageName = [NSString stringWithFormat:@"%d", i];
        // 更新按钮控件内容
        [button setTitle:buttonName[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        // 设置按钮尺寸, 因为按钮的UILabel控件在不设置尺寸的时候会在屏幕左上角显示小黑点
        buttonX = i % colsCount * buttonW;
        buttonY = i / colsCount * buttonH + 10;
        
//        CGRect fromRect = CGRectMake(buttonX, - HEScreenHeight, buttonW, buttonH);
        CGRect toRect = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        button.frame = toRect;
        
        [self addSubview:button];
        [self.buttons addObject:button];
//        
          // 创建动画
//        POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
//        
          // 设置动画参数
//        spring.fromValue = [NSValue valueWithCGRect:fromRect];
//        spring.toValue = [NSValue valueWithCGRect:toRect];
//        spring.springBounciness = 12;
//        spring.beginTime = CACurrentMediaTime() + [self.animationsDelay[i] doubleValue];// id to double
        
//        HEWeakSelf;
        
//        [spring setCompletionBlock:^(POPAnimation *spring, BOOL finished) {
//            
//            weakSelf.view.userInteractionEnabled = YES;
//        }];
        // 为对象添加动画
//        [button pop_addAnimation:spring forKey:nil];
    }
}
@end
