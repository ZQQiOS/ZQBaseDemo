//
//  ViewController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/7/6.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ViewController.h"

#import "ZTableViewUseController.h"
#import "ZImageViewController.h"
#import "ZCollectionViewController.h"
#import "ZWebViewController.h"
#import "ZImageShowViewController.h"
#import "ZReactNativeViewController.h"
#import "ZProvideViewController.h"
#import "ZLeftSlideController.h"
#import "ZBaseController.h"
#import "ZCellGroupController.h"
#import "ZTabAddViewController.h"
#import "ZAutoresViewController.h"
#import "ZAVAudioViewController.h"
#import "ZGestureController.h"
#import "ZImageFlowController.h"
#import "ZMyNavController.h"
#import "ZPickerViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@end

@implementation ViewController

- (NSArray *)arrayData{
    if (!_arrayData) {
        _arrayData = [NSArray array];
    }
    return _arrayData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.arrayData = @[@"基本组件(各种加密)",@"tableView-Use",@"图片大图查看",@"collectionView-Use",@"react-native-Use",@"webView-Use",@"image-Show",@"provide-Show",@"抽屉效果",@"cell展开收回",@"tableViewAddView",@"自动布局",@"音频",@"手势密码",@"图片轮播",@"个人中心自定义导航栏",@"省市级三联动"];
    [self setupTableView];
    
}

- (void)setupTableView {

    CGFloat y = kScreenHeight - kViewTop;
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, y) style:UITableViewStylePlain];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark --tableView的delegate、dataSoutce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.arrayData[indexPath.row];
    return cell;
}
- (void)pushView:(UIViewController *)viewController didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    viewController.title = self.arrayData[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexPath%ld",indexPath.row);
    switch (indexPath.row) {
        case 0:
        {//跳转
            ZBaseController *tableVc = [[ZBaseController alloc]init];
            [self pushView:tableVc didSelectRowAtIndexPath:indexPath];
        }
            break;
            case 1:
        {//跳转
            ZTableViewUseController *tableUseVc = [[ZTableViewUseController alloc]init];
            [self pushView:tableUseVc didSelectRowAtIndexPath:indexPath];

        }
            break;
            case 2:
        {
            ZImageViewController *imageVc = [[ZImageViewController alloc]init];
            [self pushView:imageVc didSelectRowAtIndexPath:indexPath];


        }
            break;
        case 3:
        {
            ZCollectionViewController *collectionVc = [[ZCollectionViewController alloc]init];
            [self pushView:collectionVc didSelectRowAtIndexPath:indexPath];

            
        }
            break;
        case 4:
        {
            ZReactNativeViewController *reactNativeVc = [[ZReactNativeViewController alloc]init];
            [self pushView:reactNativeVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 5:
        {
            ZWebViewController *webVc = [[ZWebViewController alloc]init];
            [self pushView:webVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 6:
        {
            ZImageShowViewController *imageShowVc = [[ZImageShowViewController alloc]init];
            [self pushView:imageShowVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 7:
        {
            ZProvideViewController *provideShowVc = [[ZProvideViewController alloc]init];
            [self pushView:provideShowVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 8:
        {
            ZLeftSlideController *leftSlideVc = [[ZLeftSlideController alloc]init];

            [self pushView:leftSlideVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 9:
        {
            ZCellGroupController *cellGroupVc = [[ZCellGroupController alloc]init];
            
            [self pushView:cellGroupVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 10:
        {
            ZTabAddViewController *tabAddViewVc = [[ZTabAddViewController alloc]init];
            
            [self pushView:tabAddViewVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 11:
        {
            ZAutoresViewController *autoresViewVc = [[ZAutoresViewController alloc]init];
            
            [self pushView:autoresViewVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 12:
        {
            ZAVAudioViewController *AVAudioVc = [[ZAVAudioViewController alloc]init];
            
            [self pushView:AVAudioVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 13:
        {
            ZGestureController *GestureVc = [[ZGestureController alloc]init];
            
            [self pushView:GestureVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 14:
        {
            ZImageFlowController *ImageFlowVc = [[ZImageFlowController alloc]init];
            
            [self pushView:ImageFlowVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 15:
        {
            ZMyNavController *myNavVc = [[ZMyNavController alloc]init];
            
            [self pushView:myNavVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
        case 16:
        {
            ZPickerViewController *pickVc = [[ZPickerViewController alloc]init];
            
            [self pushView:pickVc didSelectRowAtIndexPath:indexPath];
            
        }
            break;
          default:
            break;
    }
}
- (void)addNotificationCount {
    
    _notificationCount++;
}

@end
