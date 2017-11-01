//
//  ZTool.h
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/26.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTool : NSObject
/**
 密码的强度必须是包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间。
 */
+ (BOOL) validatePassword:(NSString *)passWord;
@end
