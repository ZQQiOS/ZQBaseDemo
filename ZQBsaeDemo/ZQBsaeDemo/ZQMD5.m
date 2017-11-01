//
//  ZQMD5.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/9/18.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZQMD5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation ZQMD5
+ (NSString *)md5HeXDigest:(NSString *)input{
    const char *cStr = [input UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}
@end
