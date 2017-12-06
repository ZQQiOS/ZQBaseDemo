//
//  ZQProgressView.h
//  ZQProgressViewDemo
//
//  Created by ZQQ on 2017/12/5.
//  Copyright © 2017年 ZQQ. All rights reserved.
//
#import "UIView+Ex.h"
#import <UIKit/UIKit.h>

@interface ZQProgressView : UIView
/**
 *  进度条颜色
 */
@property (nonatomic, strong) UIColor *progressColor;


#pragma mark --开始加载
- (void)startLoadingAnimation;
#pragma mark --结束加载
- (void)endLoadingAnimation;

@end
