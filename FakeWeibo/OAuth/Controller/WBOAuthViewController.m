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
#import "WBAccount.h"
#import "WBAccountTool.h"
#import "WBRootVcTool.h"

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
        [self accessTokenWithCode:code];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 获取access token

-(void)accessTokenWithCode:(NSString *)code{
    //创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = WBClient_id;
    params[@"client_secret"] = WBClient_Secret;
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = WBRedirect_uri;
    //发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
        //请求成功时调用
       
        //字典转模型
        WBAccount *account = [WBAccount accountWithDict:responseObject];
        //保存账号信息
        [WBAccountTool saveAccount:account];
        [WBRootVcTool chooseRootViewController:WBKeyWindow];
        NSLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        //请求失败时调用
        NSLog(@"%@", error);
    }];
    
}

@end
