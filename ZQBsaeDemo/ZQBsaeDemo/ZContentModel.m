//
//  ZContentModel.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/9/6.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZContentModel.h"

@implementation ZContentModel
- (NSArray *)cellContent{
    if (!_cellContent) {
        _cellContent = [NSArray array];
    }
    return _cellContent;
}
@end
