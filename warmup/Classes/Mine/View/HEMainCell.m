//
//  HEMainCell.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import "HEMainCell.h"
#import "HEActiveModel.h"
#import "HEUserModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HEMainCell()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *userHeader;
@property (weak, nonatomic) IBOutlet UILabel *titleString;
@property (weak, nonatomic) IBOutlet UILabel *detailString;

@end

@implementation HEMainCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setActiveModel:(HEActiveModel *)activeModel {

    _activeModel = activeModel;
    
    [self.userHeader setHeadWithURL:[NSURL URLWithString:activeModel.user.avatar]];
    [self.backgroundImage sd_setImageWithURL:[NSURL URLWithString:activeModel.images]];
    self.titleString.text = activeModel.name;

    
    // 拼接时间、地点、课时
    self.detailString.text = [NSString stringWithFormat:@"%@ / %@ / 共%zd课时", activeModel.showTime, activeModel.area, activeModel.times_required];
}

@end
