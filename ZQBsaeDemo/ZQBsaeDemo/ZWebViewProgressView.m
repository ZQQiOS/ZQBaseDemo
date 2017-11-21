//
//  ZWebViewProgressView.m
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/11/21.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZWebViewProgressView.h"

@implementation ZWebViewProgressView

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
    
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.width = kScreenWidth * 0.6;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.width = kScreenWidth * 0.8;
        }];
    }];
}

- (void)endLoadingAnimation{
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.width = kScreenWidth;
    }completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}
@end
