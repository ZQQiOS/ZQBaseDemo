
//
//  ZWebViewController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/7/17.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZWebViewController.h"
@interface ZWebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end 

@implementation ZWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENHHEIGHT)];
    self.webView = webView;
    webView.delegate = self;
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];

}
/**webview加载完成 要在此方法里获取title*/
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"self.title%@",self.title);
    

}
- (void)viewWillDisappear:(BOOL)animated{
    [self back];
    
}
- (void)back
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
        
    }else{
        [self.view resignFirstResponder];
        [self.navigationController popViewControllerAnimated:YES];
    }

}

@end
