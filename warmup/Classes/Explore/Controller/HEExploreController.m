//
//  HEExploreController.m
//  warmup
//
//  Created by Hackice on 15/11/19.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import "HEExploreController.h"
#import "HEExploreCell.h"
#import "HEExploreHeader.h"

@interface HEExploreController ()

@end

@implementation HEExploreController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
    [self setupNavigationBar];
    
    [self setupHeaderView];
}
- (void)setupHeaderView {
    
    // header view
    HEExploreHeader *headerView = [[HEExploreHeader alloc] init];
    headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    
    self.tableView.tableHeaderView = headerView;
}

- (void)setupNavigationBar {
    
    // set title view
    // 搜索栏
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.placeholder = @"搜索";
    self.navigationItem.titleView = searchBar;
   
}

- (void)setupView {
    
    // set backgroundColor
    self.view.backgroundColor = HEGlobalBackgroundColor;
    
    // set scroll disable
    //    self.tableView.scrollEnabled = NO;
    
    // section header height
//    self.tableView.sectionHeaderHeight = 20;
    
    // section footer height
//    self.tableView.sectionFooterHeight = 10;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // header offset
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"HEExploreCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        
        cell = [[HEExploreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"FZLanTingkanHei-R-GBK" size:14];
    
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"Tuijianlaoshi"];
            cell.textLabel.text = @"推荐老师";
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"Kechengzhuanti"];
            cell.textLabel.text = @"课程专题";
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"Remendidian"];
            cell.textLabel.text = @"热门地点";
            break;
            
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 15 ;
}

@end
