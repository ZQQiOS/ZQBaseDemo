//
//  ZQProgressView.m
//  ZQProgressViewDemo
//
//  Created by ZQQ on 2017/12/5.
//  Copyright © 2017年 ZQQ. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#import "ZQProgressView.h"

@implementation ZQProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setProgressColor:(UIColor *)progressColor{
    _progressColor = progressColor;
    self.backgroundColor = progressColor;
}

- (void)startLoadingAnimation{
    self.hidden = NO;
    self.width = 0.0;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.width = kScreenWidth*0.5;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.width = kScreenWidth*0.8;
        }];
    }];
}

- (void)endLoadingAnimation{
    [UIView animateWithDuration:0.2 animations:^{
        self.width = kScreenWidth;
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

@end
