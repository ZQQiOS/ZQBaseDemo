
//
//  ZPickerViewController.m
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/12/16.
//  Copyright © 2017年 SH. All rights reserved.
/**
 1.添加按钮 调出pickerview
 */

#import "ZPickerViewController.h"
#import "ZPickView.h"
@interface ZPickerViewController ()
@property (nonatomic, strong) ZPickView *pickView;
@property (nonatomic, assign) NSInteger index1;
@property (nonatomic, assign) NSInteger index2;
@property (nonatomic, assign) NSInteger index3;

@end

@implementation ZPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    //1.添加按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, kScreenWidth, 50)];
    [self.view addSubview:button];
    [button setTitle:@"点击弹出pickerView" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
  
    //添加pickView
    _pickView = [[ZPickView alloc]initWithFrame:CGRectMake(0, kScreenHeight , kScreenWidth, kPickViewHeight+44)];
    __weak ZPickerViewController *weakSelf = self;
    _pickView.cancelBtnClicktBlock = ^{
        //收起
        [weakSelf closePickView];
    };
    _pickView.doneBtnClicktBlock = ^(NSString *proNm, NSString *cityNm, NSString *countyNm) {
        //收起
        [weakSelf closePickView];
        NSLog(@"回调的值为%@%@%@",proNm,cityNm,countyNm);
    };
    [self.navigationController.view addSubview:_pickView];

}

- (void)buttonClick {
    NSLog(@"弹出pickview");
    
    [self showPickView];
}


- (void)closePickView{
    [UIView animateWithDuration:0.5 animations:^{
        _pickView.frame = CGRectMake(0, kScreenHeight , kScreenWidth, kPickViewHeight+44);
    }];
}
- (void)showPickView{
    [UIView animateWithDuration:0.5 animations:^{
        _pickView.frame = CGRectMake(0, kScreenHeight -kPickViewHeight -44, kScreenWidth, kPickViewHeight+44);
    }];
}
@end
