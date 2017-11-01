//
//  UIImageView+setCornerRadius.m
//  UIImageView添加圆角
//
//  Created by crfchina-mac-mini-1000 on 2017/6/20.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "UIImageView+setCornerRadius.h"
@implementation UIImageView (setCornerRadius)
- (void)setImageViewOval{
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.bounds.size];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    //设置大小
    layer.frame = self.bounds;
    layer.path = aPath.CGPath;
    self.layer.mask = layer;
}
@end
