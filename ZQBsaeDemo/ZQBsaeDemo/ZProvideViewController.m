//
//  ZProvideViewController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/8/3.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZProvideViewController.h"
#import <RongIMKit/RongIMKit.h>
@interface ZProvideViewController ()

@end

@implementation ZProvideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    
    [[RCIM sharedRCIM] initWithAppKey:@"YourTestAppKey"];
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
