//
//  ZImageShowViewController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/7/19.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZImageShowViewController.h"
@interface ZImageShowViewController ()

@end

@implementation ZImageShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpImageView];
}
- (void)setUpImageView{

    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"show" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:filePath];
    UIImage *imageGif = [self loadImageWithImageName:@"testImage.png"];

    YYAnimatedImageView *gifImageView = [[YYAnimatedImageView alloc]initWithImage:imageGif];
    gifImageView.frame = CGRectMake(0, 0,self.view.width,self.view.height );
    gifImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:gifImageView];
    [self.view bringSubviewToFront:gifImageView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage*)loadImageWithImageName:(NSString *)imageName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:imageName ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
