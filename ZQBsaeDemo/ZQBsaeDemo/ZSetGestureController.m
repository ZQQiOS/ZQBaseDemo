//
//  ZSetGestureController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/30.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZSetGestureController.h"
#import "ZGestureLockView.h"
#define GESPWD @"GesturePassword"

@interface ZSetGestureController ()<ZGestureLockDelegate>
@property (nonatomic, strong) ZGestureLockView *gestureLockView;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIView *teacBottomView;
@property (nonatomic, copy) NSString *lastGesturePsw;
@end

@implementation ZSetGestureController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏不透明 导航栏不透明时
    //注意：frame从导航栏左下开始计算 导航栏透明时 从屏幕左上开始计算
    self.navigationController.navigationBar.barStyle = 0;
    self.navigationController.navigationBar.translucent = NO;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置手势密码";
    [self configUI];
}
- (void)configUI {
    [self configStatusLabel];
    [self configGestureLockView];
    [self configTeacBottomView];
}
#pragma mark 配置状态label
- (void)configStatusLabel {
    UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 40)];
    statusLabel.backgroundColor = [UIColor lightGrayColor];
    statusLabel.textColor = [UIColor redColor];
    statusLabel.textAlignment = NSTextAlignmentCenter;
    statusLabel.numberOfLines = 0;
    //    [statusLabel sizeToFit];
    [self.view addSubview:statusLabel];
    self.statusLabel = statusLabel;
}

- (void)configGestureLockView {
    ZGestureLockView *gestureLockView = [[ZGestureLockView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.width)];
    gestureLockView.isSetGesture = YES;
    gestureLockView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:gestureLockView];
    gestureLockView.delegate = self;
    self.gestureLockView = gestureLockView;
}

- (void)configTeacBottomView {
    UIView *teacBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.gestureLockView.frame) + 20, kScreenWidth, 100)];
    teacBottomView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:teacBottomView];
    self.teacBottomView = teacBottomView;
    
    UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    resetBtn.frame = CGRectMake(40, 20, kScreenWidth/2 - 60, 40);
    resetBtn.backgroundColor = [UIColor redColor];
    [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    [resetBtn addTarget:self action:@selector(resetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.teacBottomView addSubview:resetBtn];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(kScreenWidth/2+20, 20, kScreenWidth/2 - 60, 40);
    sureBtn.backgroundColor = [UIColor greenColor];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.teacBottomView addSubview:sureBtn];
}

#pragma mark gestureLockView代理事件
- (void)gestureLockView:(ZGestureLockView *)lockView drawRectFinished:(NSMutableString *)gesturePassword {
    [self createGesturesPassword:gesturePassword];
}

//创建手势密码
- (void)createGesturesPassword:(NSMutableString *)gesturePassword {
    if (self.lastGesturePsw.length == 0) {
        if (gesturePassword.length < 4) {
            self.lastGesturePsw = nil;
            [self.gestureLockView checkSetResult:SetGestureTypeNoEnough];
            self.statusLabel.text = @"至少连接4个点,重新输入";
            [self shakeAnimationForView:self.statusLabel];
            return;
        }
        self.lastGesturePsw = gesturePassword;
        [self.gestureLockView checkSetResult:SetGestureTypeTrue];
        NSLog(@"---%@", self.lastGesturePsw);
        self.statusLabel.text = [NSString stringWithFormat:@"密码是%@", gesturePassword];
    }
}

#pragma mark 按钮点击事件
//重置按钮
- (void)resetBtnClick:(UIButton *)btn {
    self.lastGesturePsw = nil;
    [ZSetGestureController addGesturePassword:@""];
    [self.gestureLockView checkSetResult:SetGestureTypeNoEnough];
    self.statusLabel.text = @"请绘制手势密码";
    NSLog(@"resetPwd == %@, resetUserDefaultsPwd == %@", self.lastGesturePsw, [ZSetGestureController gesturePassword]);
}
//确定按钮
- (void)sureBtnClick:(UIButton *)btn {
    if (!self.lastGesturePsw) {
        self.statusLabel.text = @"请绘制手势密码";
        return;
    }
    [ZSetGestureController addGesturePassword:self.lastGesturePsw];
    [self.gestureLockView checkSetResult:SetGestureTypeTrue];
    self.statusLabel.text = @"密码设置成功";
    NSLog(@"resetPwd == %@, resetUserDefaultsPwd == %@", self.lastGesturePsw, [ZSetGestureController gesturePassword]);
    //    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 抖动动画
- (void)shakeAnimationForView:(UIView *)view {
    
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    
    [viewLayer addAnimation:animation forKey:nil];
}

#pragma mark 本地存储模拟
+ (void)deleteGestuesPassword {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:GESPWD];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)addGesturePassword:(NSString *)gesturePassword {
    [[NSUserDefaults standardUserDefaults] setObject:gesturePassword forKey:GESPWD];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)gesturePassword {
    return [[NSUserDefaults standardUserDefaults] objectForKey:GESPWD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
