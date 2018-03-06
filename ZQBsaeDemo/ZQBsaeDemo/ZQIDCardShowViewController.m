//
//  ZQIDCardShowViewController.m
//  ZQBsaeDemo
//
//  Created by ZQQ on 2018/2/6.
//  Copyright © 2018年 SH. All rights reserved.
//

#import "ZQIDCardShowViewController.h"
#import "IDCardOCR.h"
#import "IDCardCameraViewController.h"
@interface ZQIDCardShowViewController ()

@end

@implementation ZQIDCardShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button setTitle:@"身份证识别" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick {
    IDCardCameraViewController *cameraVC = [[IDCardCameraViewController alloc] init];
    cameraVC.recogType = 2;
    cameraVC.typeName = @"二代身份证";
    cameraVC.cropType = 0;
    cameraVC.recogOrientation = 0;
    [self.navigationController pushViewController:cameraVC animated:YES];
}



@end
