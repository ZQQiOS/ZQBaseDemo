//
//  ZPushImageViewController.m
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/12/19.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZPushImageViewController.h"
#import "SelectPhotoManager.h"

@interface ZPushImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong)SelectPhotoManager *photoManager;
@property (nonatomic, assign) BOOL isEditImage;

@end

@implementation ZPushImageViewController
//原始尺寸
static CGRect oldframe;
- (instancetype)initWithImageView:(UIImageView *)imageView edit:(BOOL)isEditImage{
    self = [self init];
    if (self) {
        self.imageView = imageView;
        self.isEditImage = isEditImage;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [self.view removeAllSubviews];
    [self addImageView];
}

- (void)addEiteNavItem{
    //添加右边按钮替换照片
    //右上角菜单按钮
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    editBtn.frame = CGRectMake(0, 0, 50, 18);
    [editBtn setTitle:@"替换" forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(editImage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:editBtn];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加展示图片的view
    [self addImageView];
    if (self.isEditImage) {
        [self addEiteNavItem];
    }

}
- (void)editImage{
    __weak ZPushImageViewController *weakSelf = self;
    if (!_photoManager) {
        _photoManager =[[SelectPhotoManager alloc]init];
    }
    [_photoManager startSelectPhotoWithImageName:@"选择头像"];
    //选取照片成功
    _photoManager.successHandle=^(SelectPhotoManager *manager,UIImage *image){
        weakSelf.imageView.image = image;
        
        //保存到本地
        NSData *data = UIImagePNGRepresentation(image);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"fistImage"];
        //上传图片 可开启子线程上传 上传成功保存到本地headerImage
    };
}
- (void)addImageView{
    //  当前imageview的图片
    UIImage *image = self.imageView.image;

    oldframe = [self.imageView convertRect:self.imageView.bounds toView:self.view];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:oldframe];
    [imageView setImage:image];
    imageView.contentMode =UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    //  动画放大所展示的ImageView
    [UIView animateWithDuration:0.4 animations:^{
        CGFloat y,width,height;
        y = ([UIScreen mainScreen].bounds.size.height - image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width) * 0.5-kViewTop;
        //宽度为屏幕宽度
        width = [UIScreen mainScreen].bounds.size.width;
        //高度 根据图片宽高比设置
        height = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
        [imageView setFrame:CGRectMake(0, y, width, height)];
    } completion:^(BOOL finished) {
        
    }];
}



@end
