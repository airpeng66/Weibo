//
//  WBHomeViewController.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/3/15.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBHomeViewController.h"
#import "UIBarButtonItem+Item.h"
#import "WBHomeTitle.h"
#import "WBCover.h"
#import "WBMenuViewController.h"
#import "UIView+Frame.h"
#import "WBPopMenu.h"
#import "WBOneViewController.h"
#import "AFNetworking.h"
#import "WBStatus.h"
#import "WBAccount.h"
#import "WBAccountTool.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface WBHomeViewController ()<WBCoverDelegate>

@property(nonatomic, weak) WBHomeTitle *titleButton;
@property(nonatomic, strong) WBMenuViewController *menu;
@property(nonatomic, strong) NSMutableArray *status;

@end

@implementation WBHomeViewController

-(NSMutableArray *)status{
    if (_status == nil) {
        _status = [NSMutableArray array];
    }
    return _status;
}

-(WBMenuViewController *)menu{
    if (_menu == nil) {
        _menu = [[WBMenuViewController alloc]init];
    }
    return _menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavigationBar];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewStatus)];
    [self.tableView.mj_header beginRefreshing];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setUpNavigationBar{
    
    //navigationBar左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendSearch) forControlEvents:UIControlEventTouchUpInside];
    
    //navigationBar右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    WBHomeTitle *titleButton = [WBHomeTitle buttonWithType:UIButtonTypeCustom];
    self.titleButton = titleButton;
    
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setTitle:@"首页" forState:UIControlStateSelected];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    
    titleButton.adjustsImageWhenHighlighted=NO;
    [titleButton addTarget:self action:@selector(menuTitleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -请求最新微博
- (void)loadNewStatus{
    //创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //创建参数字典
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (self.status.count) {
        //params[@"since_id"] = self.status[0];
    }
    params[@"access_token"] = [WBAccountTool account].access_token;
    
    [mgr GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
        [self.tableView.mj_header endRefreshing];
        NSLog(@"%@",responseObject);
        
        NSArray *dictArr = responseObject[@"statuses"];
        NSArray *statuses = (NSMutableArray *)[WBStatus  mj_objectArrayWithKeyValuesArray:dictArr];
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        
        [self.status insertObjects:statuses atIndexes:indexSet];
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        
    }];
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.status.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    WBStatus *status = self.status[indexPath.row];
    cell.textLabel.text = status.user.name;
    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    cell.detailTextLabel.text = status.text;
    return cell;
}



- (void)friendSearch{
    NSLog(@"点击了导航栏左边按钮");
   
    
}

- (void)pop{
    NSLog(@"点击了导航栏右边按钮");
    WBOneViewController *one = [[WBOneViewController alloc]init];
    //隐藏tabbar
    one.hidesBottomBarWhenPushed = YES;
    //跳转到新的控制器
    [self.navigationController pushViewController:one animated:YES];
}

- (void)menuTitleClick:(UIButton *)button{
    button.selected = !button.selected;
    
    WBCover *cover = [WBCover show];
    cover.delegate = self;
    
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - 200)*0.5;
    CGFloat popH = popW;
    CGFloat popY = 55;
    
    WBPopMenu *menu = [WBPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    menu.contentView = self.menu.view;
    
    
}

- (void)coverDidClick:(WBCover *)cover{
    [WBPopMenu hide];
    _titleButton.selected = NO;
}


@end
