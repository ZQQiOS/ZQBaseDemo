//
//  ZBaseController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/8/28.
//  Copyright © 2017年 SH. All rights reserved.
/**
 1.指纹识别
 2.钥匙串密码加密 钥匙串使用 AES 256加密算法
 3.md5
 */

#import "ZBaseController.h"
#import "ZQMD5.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface ZBaseController ()
@property (nonatomic, strong) UILabel *labelView;
@property (nonatomic, strong) UIButton *buttonlView;
@property (nonatomic, strong) UITextField *passwordTF;
@property (nonatomic, strong) NSString *md5_str;
@end

@implementation ZBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self zhiwenshibie];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLabel];
    [self addUIButton];
    [self addPasswordTF];
    [self addLoginButton];
    UIView *view = self.view.subviews[1];
    if (view == self.buttonlView) {
        NSLog(@"%@",@"相等");

    }
//    self.md5_str = [ZQMD5 md5HeXDigest:@"Crf123"];
    self.md5_str = @"Crf123";
    NSString *bundleId = [NSBundle mainBundle].bundleIdentifier;

    [YYKeychain setPassword:self.md5_str forService:bundleId account:@"username"];
}

//指纹识别
- (void)zhiwenshibie{
    
    // 1> 实例化指纹识别对象
    LAContext *laCtx = [[LAContext alloc] init];
    
    // 2> 判断当前设备是否支持指纹识别功能.
    if (![laCtx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL]) {
        
        // 如果设备不支持指纹识别功能
        NSLog(@"该设备不支持指纹识别功能");
        
        return;
    };
    
    
    [laCtx evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹登陆" reply:^(BOOL success, NSError *error) {
        // 如果成功,表示指纹输入正确.
        if (success) {
            NSLog(@"指纹识别成功!");
            
        } else {
            NSLog(@"指纹识别错误,请再次尝试");
        }
    }];
    

}
/**
 添加label
 */
- (void)addLabel{
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 70, kSCREENWIDTH-20, 100);
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    
    label.text = @"label\n这是一个label,这是一个label,这是一个label,这是一个label,这是一个label,这是一个label,这是一个label,这是一个label";
    label.numberOfLines = 0;
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.shadowColor = [UIColor grayColor];
    label.shadowOffset = CGSizeMake(3, 3);
    
    self.labelView = label;
}
/**
 添加button
 */
- (void)addUIButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 180, kSCREENWIDTH-20, 50);
    [self.view addSubview:button];
    [button setTitle:@"这是一个按钮" forState:UIControlStateNormal];
    [button setTitle:@"点击了这个按钮" forState:UIControlStateHighlighted];
    
    [button setBackgroundColor:[UIColor yellowColor]];
    
    [button.titleLabel.font fontWithSize:18];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    self.buttonlView = button;
}
/**
 添加textField，输入密码
 */
- (void)addPasswordTF{
    UITextField *passwordTF = [[UITextField alloc]init];
    passwordTF.frame = CGRectMake(10, 250, kSCREENWIDTH-20, 45);
    [self.view addSubview:passwordTF];
    passwordTF.backgroundColor = [UIColor lightGrayColor];
    passwordTF.placeholder = @"请输入密码";
    self.passwordTF = passwordTF;
}
/**
 添加登录按钮
 */
- (void)addLoginButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 330, kSCREENWIDTH-20, 50);
    [self.view addSubview:button];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button setTitle:@"点击了这个按钮" forState:UIControlStateHighlighted];
    
    [button setBackgroundColor:[UIColor redColor]];
    
    [button.titleLabel.font fontWithSize:18];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)loginBtnClick{
    if (self.passwordTF.text.length>0) {
        NSString *str = self.passwordTF.text;
//        //MD5加密
//        NSString *md5str = [ZQMD5 md5HeXDigest:str];
//        NSLog(@"加密后%@",md5str);
//        if ([md5str isEqualToString:self.md5_str]) {
//            NSLog(@"登录成功");
//        }else{
//            NSLog(@"密码不正确");
//        }
        NSString *bundleId = [NSBundle mainBundle].bundleIdentifier;

        NSString *strpsw = [YYKeychain getPasswordForService:bundleId account:@"username"];
        if ([str isEqualToString:strpsw]) {
            NSLog(@"登录成功");
        }else{
            NSLog(@"密码不正确");
        }
    }
}
@end
