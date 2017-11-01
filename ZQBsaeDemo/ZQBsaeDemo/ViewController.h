//
//  ViewController.h
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/7/6.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *_messageContents;
    int _messageCount;
    int _notificationCount;
}
- (void)addNotificationCount;

@end

