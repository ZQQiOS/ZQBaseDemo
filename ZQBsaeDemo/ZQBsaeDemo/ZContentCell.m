//
//  ZContentCell.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/9/6.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZContentCell.h"
@interface ZContentCell()
@end
@implementation ZContentCell


- (void)setModel:(ZContentModel *)model{
    NSInteger count = model.cellContent.count;
    if (count>0) {
        //创建view
        CGFloat magin = 10.0;
        for (int i = 0; i<count; i++) {
            UIView *view = [[UIView alloc]init];
            view.backgroundColor = [UIColor purpleColor];
            [self addSubview:view];
            
            CGFloat w = (kScreenWidth -3*magin)/4;
            CGFloat h = w;
            CGFloat x = i%4*(w+magin);
            CGFloat y = i/4*(w+magin);
            view.frame = CGRectMake(x, y, w, h);
            view.tag = i+100;

            //UIView添加image
            //UIviewt添加label
            UILabel *label = [[UILabel alloc]init];
            [view addSubview:label];
            label.frame = CGRectMake(0, 0.65*h, w, 0.25*h);
            label.text = [model.cellContent[i] objectForKey:@"titleLabel"];
            label.textAlignment = NSTextAlignmentCenter;
        }
    }
}
- (void)prepareForReuse{
    [super prepareForReuse];
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}
//点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([touch view].tag>0)
    {
        if (self.clickImageBlock) {
            
            self.clickImageBlock(
                                 [touch view].tag);
        }
        
    }
}
@end
