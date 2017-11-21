//
//  ZMyNavView.m
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/11/16.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZMyNavView.h"
@interface ZMyNavView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftBt;
@property (nonatomic, strong) UIButton *rightBt;
@end

@implementation ZMyNavView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.headBackView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.headBackView.backgroundColor=[UIColor whiteColor];
        
        self.headBackView.alpha = 0;
        
        [self addSubview:self.headBackView];
        //添加titleLabel
        UILabel *titleLabel = [[UILabel alloc]init];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.mas_top).offset(kNavTop+20);
            make.height.equalTo(@44);
        }];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        [titleLabel sizeToFit];
    
        //添加两个按钮
        UIButton *leftBt = [[UIButton alloc]init];
        self.leftBt = leftBt;
        [self addSubview:leftBt];
//        leftBt.frame = CGRectMake(15, kNavTop+20, 44, 44);
        [leftBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(15);
            make.top.equalTo(self).offset(kNavTop+20);
            make.height.equalTo(@44);
            make.width.equalTo(@44);

        }];
        [leftBt addTarget:self action:@selector(leftBtClick) forControlEvents:UIControlEventTouchUpInside];
        
        //添加两个按钮
        UIButton *rightBt = [[UIButton alloc]init];
        self.rightBt = rightBt;
        [self addSubview:rightBt];
//        rightBt.frame = CGRectMake(kScreenWidth-44-15, kNavTop+20, 44, 44);
        [rightBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-15);
            make.top.equalTo(self).offset(kNavTop+20);
            make.height.equalTo(@44);
            make.width.equalTo(@44);

        }];
        [rightBt addTarget:self action:@selector(rightBtClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)leftBtClick{
    if (self.leftItemBlock) {
        self.leftItemBlock();
    }
}
- (void)rightBtClick{
    if (self.rightItemBlock) {
        self.rightItemBlock();
    }
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}
- (void)setLabelColor:(UIColor *)labelColor{
    _labelColor = labelColor;
    self.titleLabel.textColor = labelColor;
}
- (void)setRightImageStr:(NSString *)rightImageStr{
    _rightImageStr = rightImageStr;
    [self.rightBt setImage:[UIImage imageNamed:rightImageStr] forState:UIControlStateNormal];
}
- (void)setLeftImageStr:(NSString *)leftImageStr{
    _leftImageStr = leftImageStr;
    [self.leftBt setImage:[UIImage imageNamed:leftImageStr] forState:UIControlStateNormal];
}
@end
