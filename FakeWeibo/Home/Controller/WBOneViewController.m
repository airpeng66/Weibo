//
//  WBOneViewController.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/3/15.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBOneViewController.h"
#import "WBTwoViewController.h"

@interface WBOneViewController ()

@end

@implementation WBOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)jumpToTwoViewController:(UIButton *)sender {
    WBTwoViewController *two = [[WBTwoViewController alloc]init];
    [self.navigationController pushViewController:two animated:YES];
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
