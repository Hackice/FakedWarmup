//
//  QNModel.m
//  取暖
//
//  Created by 梁健 on 15/11/18.
//  Copyright © 2015年 梁健. All rights reserved.
//

#import "QNModel.h"
#import <MJExtension.h>
@implementation QNModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"imageUrl" : @"headimg",
             @"titleText" : @"title",
             @"contentText" : @"intro",
             @"dateText" : @"ordertime",
             @"likeCount" : @"like_count"};
}



@end
