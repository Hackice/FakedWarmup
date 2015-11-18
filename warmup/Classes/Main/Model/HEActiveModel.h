//
//  HEActiveModel.h
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HEUserModel;
@interface HEActiveModel : NSObject

@property (copy, nonatomic) NSString *name;/**< 标题 */
@property (copy, nonatomic) NSString *images;/**< 背景图片 */
@property (strong, nonatomic) HEUserModel *user;/**< 用户 */
@property (assign, nonatomic) NSInteger times_required;/**< 课时 */
@property (copy, nonatomic) NSString *area;/**< 地区 */
@property (copy, nonatomic) NSString *starttime;/**< 活动开始时间 */
@property (copy, nonatomic) NSString *endtime;/**< 活动结束时间 */

/* 补充时间 */
@property (copy, nonatomic) NSString *showTime;/**< 显示的时间 */

@end
