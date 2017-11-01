//
//  ZAVAudioViewController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/26.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZAVAudioViewController.h"

@interface ZAVAudioViewController ()

@end

@implementation ZAVAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _btnPlay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnPlay.frame = CGRectMake(100, 100, 100, 40);
    [_btnPlay setTitle:@"播放" forState:UIControlStateNormal];
    [_btnPlay addTarget:self action:@selector(pressPlay) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnPlay];
    
    _btnPause = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnPause.frame = CGRectMake(100, 160, 100, 40);
    [_btnPause setTitle:@"暂停" forState:UIControlStateNormal];
    [_btnPause addTarget:self action:@selector(pressPause) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnPause];
    
    _btnStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnStop.frame = CGRectMake(100, 220, 100, 40);
    [_btnStop setTitle:@"停止" forState:UIControlStateNormal];
    [_btnStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnStop];
    
    _musicProgress = [[UIProgressView alloc]init];
    _musicProgress.frame = CGRectMake(10, 300, 300, 20);
    _musicProgress.progress = 0;
    [self.view addSubview:_musicProgress];
    
    _volumeSliser = [[UISlider alloc]init];
    _volumeSliser.frame = CGRectMake(10, 380, 300, 20);
    _volumeSliser.maximumValue = 100;
    _volumeSliser.minimumValue = 0;
    [_volumeSliser addTarget:self action:@selector(volumeChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_volumeSliser];
    [self createPlayer];
}
- (void)createPlayer{
    NSString *str = [[NSBundle mainBundle] pathForResource:@"testMusic" ofType:@"mp3"];
    NSURL *urlMusic = [NSURL fileURLWithPath:str];
    
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:urlMusic error:nil];
    _player.numberOfLoops = -1;//播放次数 无限循环
}
- (void)pressPlay{
    NSLog(@"播放");
    [_player play];

}

- (void)pressPause {
    NSLog(@"暂停");
    [_player pause];
    
}

- (void)pressStop {
    NSLog(@"停止");
    [_player stop];
}

- (void)volumeChange:(UISlider *)slider{
    NSLog(@"改变声音");
    _musicProgress.progress = slider.value/100;
}
@end
