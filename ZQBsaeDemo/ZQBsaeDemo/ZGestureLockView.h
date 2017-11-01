//
//  ZGestureLockView.h
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/30.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGestureLockView;

@protocol ZGestureLockDelegate <NSObject>
- (void)gestureLockView:(ZGestureLockView *)lockView drawRectFinished:(NSMutableString *)gesturePassword;
@end
@interface ZGestureLockView : UIView
//检测手势密码答案情况 对/错/不够4个数字
//解锁
typedef NS_ENUM(NSUInteger, DownLockType) {
    DownLockTypeTrue,
    DownLockTypeFalse,
    DownLockTypeNoEnough,
    DownLockTypeClear
};
//设置
typedef NS_ENUM(NSUInteger, SetGestureType) {
    SetGestureTypeNoEnough,
    SetGestureTypeTrue
};

@property (nonatomic, weak) id<ZGestureLockDelegate> delegate;

@property (nonatomic, assign) BOOL isSetGesture;// 用来验证是否是设置手势密码
- (void)clearLockView;//清除布局 重新开始

- (void)checkPwdResult:(DownLockType)resultType;//检测解锁的结果

- (void)checkSetResult:(SetGestureType)resultType;//检测设置的结果
@end
