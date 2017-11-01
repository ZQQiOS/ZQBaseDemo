//
//  ZAVAudioViewController.h
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/26.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>
//导入音频视频播放库
#import <AVFoundation/AVFoundation.h>
@interface ZAVAudioViewController : UIViewController<AVAudioPlayerDelegate>
{
    //播放按钮
    UIButton *_btnPlay;
    //暂停按钮
    UIButton *_btnPause;
    //停止播放
    UIButton *_btnStop;
    //音乐播放进度条
    UIProgressView *_musicProgress;
    //声音大小
    UISlider *_volumeSliser;
    //静音开关
    UISwitch *_vomumOn;
    //播放器对象
    AVAudioPlayer *_player;
    //定时器
    NSTimer *_timer;
}
@end
