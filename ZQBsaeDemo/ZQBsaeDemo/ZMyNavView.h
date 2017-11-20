//
//  ZMyNavView.h
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/11/16.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^rightItemBlock)();
typedef void (^leftItemBlock)();

@interface ZMyNavView : UIView
@property (nonatomic, strong) rightItemBlock rightItemBlock;
@property (nonatomic, strong) leftItemBlock leftItemBlock;

@property(nonatomic,strong)UIImageView * headBackView;

@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, strong) NSString *leftImageStr;
@property (nonatomic, strong) NSString *rightImageStr;
@property (nonatomic, strong) UIColor *labelColor;


@end
