//
//  ZPickView.h
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/12/17.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kPickViewHeight 220
//点击取消确定回调
typedef void (^doneBtnClicktBlock)(NSString *proNm,NSString *cityNm,NSString *countyNm);//1.别名 传参
typedef void (^cancelBtnClicktBlock)();
@interface ZPickView : UIView
@property (nonatomic, strong) doneBtnClicktBlock doneBtnClicktBlock;//2.声明block
@property (nonatomic, strong) cancelBtnClicktBlock cancelBtnClicktBlock;

@end
