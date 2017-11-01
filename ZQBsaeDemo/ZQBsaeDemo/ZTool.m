//
//  ZTool.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/26.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZTool.h"

@implementation ZTool
#pragma mark 密码包含大小写字母和数字的组合，不能使用特殊字符，长度在8到10之间。
+ (BOOL) validatePassword:(NSString *)passWord
{

    if (passWord) {
        return YES;
    }
    return NO;
}
@end
