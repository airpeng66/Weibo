//
//  WBOAuthViewController.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/8/28.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBOAuthViewController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"

#define WBAuthorizeBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define WBClient_id @"837419852"
#define WBRedirect_uri @"http://www.baidu.com"
#define WBClient_Secret @"b1bd879928928fc4a146625ed8892522"

@interface WBOAuthViewController ()<UIWebViewDelegate>


@end

@implementation WBOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建一个uiwebview
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    //url参数
    NSString *baseUrl = WBAuthorizeBaseUrl;
    NSString *client_id = WBClient_id;
    NSString *secret = WBClient_Secret;
    NSString *redirect_uri = WBRedirect_uri;
    
    //拼接字符创
    NSString *urlString = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",baseUrl,client_id,redirect_uri];
    NSLog(@"%@",urlString);
    //创建url
    NSURL *Url = [NSURL URLWithString:urlString];
    //创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:Url];
    
    [webView loadRequest:request];
    
    webView.delegate = self;
    
    
    
}

#pragma mark UIWebView代理

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showMessage:@"正在加载"];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUD];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *urlString = request.URL.absoluteString;
    NSRange range = [urlString rangeOfString:@"code="];
    if (range.length) {
        NSString *code = [urlString substringFromIndex:range.location + range.length];
        NSLog(@"code is %@",code);
        return NO;
    }
    return YES;
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
