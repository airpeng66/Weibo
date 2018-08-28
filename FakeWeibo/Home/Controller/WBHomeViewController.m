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

@interface WBHomeViewController ()<WBCoverDelegate>

@property(nonatomic, weak) WBHomeTitle *titleButton;
@property(nonatomic, strong) WBMenuViewController *menu;

@end

@implementation WBHomeViewController

-(WBMenuViewController *)menu{
    if (_menu == nil) {
        _menu = [[WBMenuViewController alloc]init];
    }
    return _menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavigationBar];
    
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
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
