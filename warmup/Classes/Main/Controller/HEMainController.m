//
//  HEMainController.m
//  warmup
//
//  Created by Hackice on 15/11/18.
//  Copyright © 2015年 Hackice. All rights reserved.
//

#import "HEMainController.h"
#import "HEMainCell.h"
#import "HEActiveModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "HECityBarButton.h"

@interface HEMainController ()

@property (weak, nonatomic) AFHTTPSessionManager *sessionManager;/**< AFN请求管理者 */
@property (strong, nonatomic) NSArray *activeModels;/**< 模型数组 */
//@property (weak, nonatomic) HECityBarButton *cityButton;/**< 城市按钮 */

@end

@implementation HEMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // register cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HEMainCell class]) bundle:nil] forCellReuseIdentifier:@"HEMainCell"];
    
    [self setupView];
    
    [self setupDataSource];
}

- (void)setupView {
    
    self.view.backgroundColor = HEGlobalBackgroundColor;
    
    // set title
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // set rowHeight
    self.tableView.rowHeight = 244;
    
    // show custom separate
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupLeftButtonItem];
}

- (void)setupLeftButtonItem {

    HECityBarButton *cityBarButton = [[HECityBarButton alloc] init];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cityBarButton];
}

#pragma mark - Networking Request
/**
 *  使用懒加载方式对AFNManager弱引用避免资源浪费
 */
- (AFHTTPSessionManager *)sessionManager {
    
    if (!_sessionManager) {
        
        _sessionManager = [AFHTTPSessionManager manager];
    }
    return _sessionManager;
}

/**
 *  从服务器获取数据源
 */
- (void)setupDataSource {

    NSMutableDictionary *parameterDictionary = [NSMutableDictionary dictionary];
    parameterDictionary[@"citycode"] = @400100;
    parameterDictionary[@"count"] = @10;
    parameterDictionary[@"page"] = @1;
    parameterDictionary[@"type"] = @1;
    
    HEWeakSelf;
    
    // HERequestURL
    // http://api2.warmup.cc/api/v3/classes
    
    [self.sessionManager GET:@"http://api2.warmup.cc/api/v3/classes?citycode=440100&count=10&page=1&type=1" parameters:nil success:^void(NSURLSessionDataTask * __nonnull task, id requestObject) {
        
//        HELog(@"%@", requestObject);
        
        /* just for debug */
//        [requestObject writeToFile:@"/Users/Hackice/Desktop/warmupData.plist" atomically:YES];
        
        // 如果未获取到服务器返回的数据, 则直接返回
        if (!requestObject) {
            
            HELog(@"请求出现错误");
            
            return;
        }
        /* json -> model */
        weakSelf.activeModels = [HEActiveModel mj_objectArrayWithKeyValuesArray:requestObject[@"result"][@"classes"]];
        
        [weakSelf.tableView reloadData];
        
        
    } failure:^void(NSURLSessionDataTask * __nonnull task, NSError * __nonnull error) {
        
        if (error.code == NSURLErrorCancelled) {
            
            return;
        }
        if (error.code == NSURLErrorTimedOut) {
            
            HELog(@"请求超时");
            
        } else {
            
            HELog(@"加载失败");
        }
    }];
}

- (void)dealloc {
    
    // cancel all tasks
    [self.sessionManager invalidateSessionCancelingTasks:YES];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.activeModels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HEMainCell *cell = (HEMainCell *)[tableView dequeueReusableCellWithIdentifier:@"HEMainCell"];
    
    cell.activeModel = self.activeModels[indexPath.row];
    
    return cell;
}

#pragma mark - Scroll view delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    //TabelView滚动的距离
//    CGFloat scrollDistance = self.tableView.contentOffset.y;
//    
//    //可动范围
//    CGFloat maxDistance = 20;
//    
//    //判断头视图移动的最大距离
//    if (scrollDistance >= maxDistance) {
//        
//        scrollDistance = maxDistance;
//    }
//    
//    //头视图移动
////    self.backgroundImage.constant = - scrollDistance;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
