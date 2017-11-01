//
//  ZGestureController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/30.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZGestureController.h"
#import "ZSetGestureController.h"
#import "ZLockDownController.h"

@interface ZGestureController ()

@end

@implementation ZGestureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //添加按钮
    //添加两个按钮
    UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
    [addBtn setTitle:@"设置密码" forState:UIControlStateNormal];
    addBtn.tag = 101;
    [addBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(settingGesture) forControlEvents:UIControlEventTouchUpInside];
    addBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:addBtn];
    
    UIButton *subBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - 100 -10, 100, 100, 30)];
    [subBtn setTitle:@"解锁" forState:UIControlStateNormal];
    [subBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    subBtn.tag = 102;
    [subBtn addTarget:self action:@selector(gestureLockDown) forControlEvents:UIControlEventTouchUpInside];
    subBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:subBtn];
}

- (void)settingGesture{
    NSLog(@"设置手势密码");
    ZSetGestureController *vc = [[ZSetGestureController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)gestureLockDown{
    NSLog(@"解锁");
    ZLockDownController *vc = [[ZLockDownController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}
@end
