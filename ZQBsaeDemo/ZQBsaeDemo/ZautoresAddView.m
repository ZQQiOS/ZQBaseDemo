//
//  ZautoresAddView.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/16.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZautoresAddView.h"

@implementation ZautoresAddView

{
    UIView *view1;
    UIView *view2;
    UIView *view3;
    UIView *view4;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        //添加子控件
        view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        view1.backgroundColor = [UIColor redColor];
        [self addSubview:view1];
        
        view2 = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width - 50, 0, 50, 50)];
        view2.backgroundColor = [UIColor redColor];
        [self addSubview:view2];
        
        view3 = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - 50, 50, 50)];
        view3.backgroundColor = [UIColor redColor];
        [self addSubview:view3];
        
        
        view4 = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width - 50, frame.size.height - 50, 50, 50)];
        view4.backgroundColor = [UIColor redColor];
        [self addSubview:view4];
        

        view2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        view3.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        view4.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
    }
    return self;
}

@end
