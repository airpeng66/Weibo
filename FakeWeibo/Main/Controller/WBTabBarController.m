//
//  WBTabBarController.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/1/20.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBTabBarController.h"
#import "UIImage+WBimage.h"
#import "WBTabBar.h"
#import "WBNavigationController.h"
#import "WBHomeViewController.h"
#import "WBMenuViewController.h"
#import "WBDiscoverViewController.h"
#import "WBMessageViewController.h"
#import "WBProfileViewController.h"
#import "WBUnreedTool.h"
#import "WBUnreadResult.h"

@interface WBTabBarController ()<WBTabbarDelegate>
@property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic, weak) WBHomeViewController *home;
@property (nonatomic, weak) WBMessageViewController *message;
@property (nonatomic, weak) WBDiscoverViewController *discover;
@property (nonatomic, weak) WBProfileViewController *profile;
@end



@implementation WBTabBarController

-(NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

/*+(void)initialize{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    [att setObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //WBTabBar *WBtabbar = [[WBTabBar alloc]initWithFrame:self.tabBar.frame];
    [self setUpAllChildViewController];
    
    [self setUpTabBar];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(requestUnreadMsgCount) userInfo:nil repeats:YES];
   
}

-(void)setUpTabBar{
    [self.tabBar removeFromSuperview];
    WBTabBar *tabbar = [[WBTabBar alloc]initWithFrame:self.tabBar.bounds];
    tabbar.backgroundColor = [UIColor clearColor];
    tabbar.delegate = self;
    
    tabbar.items = self.items;
    //[self setValue:tabbar forKeyPath:@"tabBar"];
    //[self.tabBar insertSubview:tabbar atIndex:0];
    [self.tabBar addSubview:tabbar];
    
}
-(void)tabBar:(WBTabBar *)tabBar didClickButton:(NSInteger)index{
    if (index == 0 && self.selectedIndex == index) {
        [_home refresh];
    }
    self.selectedIndex = index;
    
}

- (void)setUpAllChildViewController{
    
    //使用tabvc管理子控制器
    //首页
    WBHomeViewController *home = [[WBHomeViewController alloc]init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginName:@"tabbar_home_selected"] title:@"首页"];
    _home = home;
    //home.view.backgroundColor = [UIColor greenColor];
    //消息
    WBMessageViewController *message = [[WBMessageViewController alloc]init];
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginName:@"tabbar_message_center_selected"] title:@"消息"];
    message.view.backgroundColor = [UIColor blueColor];
    _message = message;
    //发现
    WBDiscoverViewController *discover = [[WBDiscoverViewController alloc]init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginName:@"tabbar_discover_selected"] title:@"发现"];
    discover.view.backgroundColor = [UIColor purpleColor];
    _discover = discover;
    //我的
    WBProfileViewController *profile = [[WBProfileViewController alloc]init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginName:@"tabbar_profile_selected"] title:@"我"];
    profile.view.backgroundColor = [UIColor whiteColor];
    _profile = profile;
}

- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    [self.items addObject:vc.tabBarItem];
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    WBNavigationController *nav = [[WBNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 请求未读消息数

- (void)requestUnreadMsgCount{
    [WBUnreedTool UnreadWithSuccess:^(WBUnreadResult *result) {
        _home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.status];
        _message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.messageCount];
        _profile.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.follower];
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.totalCount;
    } failure:^(NSError *error) {
        
    }];
}


/*-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for(UIView *tabBarButton in self.tabBar.subviews)
    {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }
  
}*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
