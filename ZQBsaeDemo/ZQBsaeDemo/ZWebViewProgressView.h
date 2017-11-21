//
//  ZWebViewProgressView.h
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/11/21.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWebViewProgressView : UIView
/**
 *  进度条颜色
 */
@property (nonatomic, strong) UIColor *progressColor;



#pragma mark --开始加载
- (void)startLoadingAnimation;
#pragma mark --结束加载
- (void)endLoadingAnimation;
@end
