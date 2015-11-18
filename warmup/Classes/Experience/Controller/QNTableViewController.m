//
//  QNTableViewController.m
//  取暖
//
//  Created by 梁健 on 15/11/18.
//  Copyright © 2015年 梁健. All rights reserved.
//

#import "QNTableViewController.h"
#import "QNCell.h"
#import "QNModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface QNTableViewController ()

@property (nonatomic, weak) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSArray *models;
@property (nonatomic, copy) NSString *header;

@end

@implementation QNTableViewController

- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)setHeader:(NSString *)header{
    _header = header;
    
    UIView *view = [[UIView alloc] init];
    
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 270);
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 250)];
    
    [view addSubview:iv];
    
    [iv sd_setImageWithURL:[NSURL URLWithString:header]];
    
    iv.layer.cornerRadius = 5;
    iv.clipsToBounds = YES;
    
    self.tableView.tableHeaderView = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavAndTable];
    
    [self setupData];
}

- (void)setupNavAndTable{

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.view.backgroundColor = HEGlobalBackgroundColor;
    
    self.navigationItem.title = @"课程心得";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"qianbi"] forState:UIControlStateNormal];
    [btn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.tableView.rowHeight = 95;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QNCell class]) bundle:nil] forCellReuseIdentifier:ID];
}

- (void)setupData{
    NSString *requestURL = @"http://api2.warmup.cc/api/v3/learned?citycode=440100&count=10&page=1";
    
    __weak typeof(self) weakSelf = self;
    [self.manager GET:requestURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
       
        weakSelf.header = responseObject[@"result"][@"head"][@"image"];
//        NSLog(@"%@", weakSelf.header);
        weakSelf.models = [QNModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"][@"learned"]];
        [weakSelf.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (error.code == NSURLErrorCancelled) return;
        return;
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

static NSString *ID = @"QNCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QNCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    QNModel *model = self.models[indexPath.row];
    cell.model = model;
    return cell;
}

@end
