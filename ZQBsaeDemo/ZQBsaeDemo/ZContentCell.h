//
//  ZContentCell.h
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/9/6.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZContentModel.h"
typedef void (^clickImageBlock)(NSInteger currView);

@interface ZContentCell : UITableViewCell
@property (nonatomic, strong) ZContentModel *model;
@property (nonatomic, copy) clickImageBlock clickImageBlock;//2.声明block

@end
