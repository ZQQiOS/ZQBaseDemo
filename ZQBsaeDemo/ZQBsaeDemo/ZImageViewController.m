//
//  ZImageViewController.m
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/12/19.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZImageViewController.h"
#import "ZPushImageViewController.h"
@interface ZImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgV_imageView;

@end

@implementation ZImageViewController
- (void)viewWillAppear:(BOOL)animated{
    UIImage *img = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"fistImage"]];
    
    if (img) {
        self.imgV_imageView.image = img;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.imgV_imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgV_imageViewClick)];
    [ self.imgV_imageView addGestureRecognizer:tap];}

- (void)imgV_imageViewClick {
    //push出新界面
    ZPushImageViewController *imageVc = [[ZPushImageViewController alloc]initWithImageView:self.imgV_imageView edit:YES];
    [self.navigationController pushViewController:imageVc animated:YES];
}



@end
