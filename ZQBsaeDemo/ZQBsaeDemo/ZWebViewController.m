
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
@property (nonatomic, strong) ZQProgressView *progressView;

@end 

@implementation ZWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setupWebView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNavBackClick];
}
- (void)setupWebView{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    self.webView = webView;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    ZQProgressView *progressView = [[ZQProgressView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 3)];
    self.progressView = progressView;
    progressView.progressColor = [UIColor purpleColor];
    [self.view addSubview:progressView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://wxlc.crfchina.com/crf_finance/jsp/problem-list.html"]]];
}
/**webview加载完成 要在此方法里获取title*/
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"self.title%@",self.title);
    [self.progressView endLoadingAnimation];


}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.progressView startLoadingAnimation];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.progressView endLoadingAnimation];
}

- (void)setupNavBackClick{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    
    [btn sizeToFit];
    // 让按钮内部的所有内容左对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    //设置内边距，让按钮靠近屏幕边缘
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

}
- (void)back
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
        
    }else{
        [self.view resignFirstResponder];
        [self.navigationController popViewControllerAnimated:NO];
    }

}

@end
