//
//  ZAutoresViewController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/16.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZAutoresViewController.h"
#import "ZautoresAddView.h"
@interface ZAutoresViewController ()
@property (nonatomic, strong) ZautoresAddView *subView;
@end

@implementation ZAutoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加subView
    //导航栏不透明 导航栏不透明时
    //注意：frame从导航栏左下开始计算 导航栏透明时 从屏幕左上开始计算
    self.navigationController.navigationBar.barStyle = 0;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.subView = [[ZautoresAddView alloc]initWithFrame:CGRectMake(10, 0, 200, 200)];
    self.subView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.subView];
    
    //添加两个按钮
    UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, kScreenHeight - 84 - 50, 55, 30)];
    [addBtn setTitle:@"放大" forState:UIControlStateNormal];
    addBtn.tag = 101;
    [addBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(changBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    addBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:addBtn];
    
    UIButton *subBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - 55 -10, kScreenHeight - 84 - 50, 55, 30)];
    [subBtn setTitle:@"缩小" forState:UIControlStateNormal];
    [subBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    subBtn.tag = 102;
    [subBtn addTarget:self action:@selector(changBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    subBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:subBtn];
}
- (void)changBtnClick:(UIButton *)btn{
    NSLog(@"点击按钮");
    if (btn.tag == 101) {
        //放大
        self.subView.frame = CGRectMake(10, 0, 350, 350);
    }else{
        //缩小
        self.subView.frame = CGRectMake(10, 0, 200, 200);

    }
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
