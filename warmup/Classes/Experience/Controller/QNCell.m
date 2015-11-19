//
//  QNCell.m
//  取暖
//
//  Created by 梁健 on 15/11/18.
//  Copyright © 2015年 梁健. All rights reserved.
//

#import "QNCell.h"
#import "QNModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+TimeString.h"

@interface QNCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeCountButton;

@end

@implementation QNCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setModel:(QNModel *)model{
    
    _model = model;
    // 设置图片
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
    
    self.titleLabel.text = model.titleText;
    self.contentLabel.text = model.contentText;
    self.dateLabel.text = [NSString stringWithTimeStamp:model.dateText];
    [self.likeCountButton setTitle:[NSString stringWithFormat:@"%ld",model.likeCount] forState:UIControlStateNormal];
    self.backgroundColor = HEGlobalBackgroundColor;
}

@end
