//
//  ZNavigationController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/7/7.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZNavigationController.h"

@interface ZNavigationController ()

@end

@implementation ZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 如果滑动移除控制器的功能失效，清空代理（让导航控制器重新设置这个功能）
    self.interactivePopGestureRecognizer.delegate = nil;
    
    //导航栏不透明 导航栏不透明时
    //注意：frame从导航栏左下开始计算 导航栏透明时 从屏幕左上开始计算
    self.navigationBar.barStyle = 0;
    self.navigationBar.translucent = NO;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBj"] forBarMetrics:UIBarMetricsDefault];
}

//重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        
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
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }

    [super pushViewController:viewController animated:animated];
    //创建动画
    CATransition *animation = [CATransition animation];
    //设置运动轨迹的速度
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //设置动画类型
    animation.type = @"fade";
    //设置动画时长
    animation.duration = 0.5f;
    //设置运动的方向
    animation.subtype = kCATransitionFromRight;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];

}
-(void)back
{
    [self popViewControllerAnimated:NO];
    //创建动画
    CATransition *animation = [CATransition animation];
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.duration = 0.5f;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];

}
@end
