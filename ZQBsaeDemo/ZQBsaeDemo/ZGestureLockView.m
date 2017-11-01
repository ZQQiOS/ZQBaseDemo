//
//  ZGestureLockView.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/30.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZGestureLockView.h"
@interface ZGestureLockView()
@property (strong, nonatomic) NSMutableArray *selectBtns;//选中的按钮数组
@property (nonatomic, strong) NSMutableArray *errorBtns;//错误的按钮数组
@property(nonatomic, assign)BOOL finished;//是否完成
@property (nonatomic, assign) CGPoint currentPoint;//当前触摸点
@property (nonatomic, assign) DownLockType resultType;//解锁结果
@property (nonatomic, assign) SetGestureType setResultType;//设置结果
@end
@implementation ZGestureLockView

- (NSMutableArray *)selectBtns {
    if (!_selectBtns) {
        _selectBtns = [NSMutableArray array];
    }
    return _selectBtns;
}

- (NSMutableArray *)errorBtns {
    if (!_errorBtns) {
        _errorBtns = [NSMutableArray array];
    }
    return _errorBtns;
}
- (void)initSubviews {
    self.backgroundColor = [UIColor clearColor];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    //创建9个按钮
    for (NSInteger i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        [btn setImage:[UIImage imageNamed:@"sign_img_circle_n"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"sign_img_circle_s"] forState:UIControlStateSelected];
        btn.tag = i+1;
        [self addSubview:btn];
    }
}

@end
