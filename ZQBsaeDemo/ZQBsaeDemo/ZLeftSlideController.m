//
//  ZLeftSlideController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/8/17.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZLeftSlideController.h"

@interface ZLeftSlideController ()

@end

@implementation ZLeftSlideController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"主界面";
    
    //左上角菜单按钮
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(menuBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    //右上角菜单按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(0, 0, 50, 18);
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeBtn];
    
}

- (void)menuBtnClick{
    NSLog(@"点击菜单按钮");
}
- (void)closeBtnClick{
    NSLog(@"点击关闭按钮");
    [self.navigationController popViewControllerAnimated:NO];
    CATransition *animation = [CATransition animation];
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.duration = 0.5f;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];


}
@end
