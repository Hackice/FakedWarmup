//
//  QNModel.h
//  取暖
//
//  Created by 梁健 on 15/11/18.
//  Copyright © 2015年 梁健. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QNModel : NSObject

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *contentText;
@property (nonatomic, strong) NSNumber *dateText;
@property (nonatomic, assign) NSInteger likeCount;

@end
