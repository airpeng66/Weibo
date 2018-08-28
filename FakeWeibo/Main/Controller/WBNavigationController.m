//
//  WBNavigationController.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/3/15.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBNavigationController.h"
#import "UIBarButtonItem+Item.h"

@interface WBNavigationController ()<UINavigationControllerDelegate>
@property(nonatomic, strong)id popDelegate;
@end

@implementation WBNavigationController

+ (void)initialize{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
}
//导航控制器跳转

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
}

//移除系统tabbar
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UITabBarController *tabBarVC = (UITabBarController*)keyWindow.rootViewController;
    for (UIView *tabBarButton in tabBarVC.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighteds"] target:self action:@selector(backToPre) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighteds"] target:self action:@selector(backToRoot) forControlEvents:UIControlEventTouchUpInside];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backToPre{
    [self popViewControllerAnimated:YES];
}

- (void)backToRoot{
    [self popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
