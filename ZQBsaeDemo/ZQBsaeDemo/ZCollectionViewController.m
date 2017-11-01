//
//  ZCollectionViewController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/7/12.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZCollectionViewController.h"
@interface ZCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ZCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kRandomColor;
    
    [self addCollectionView];
}

- (void)addCollectionView{
    //此处必须要有创见一个UICollectionViewFlowLayout的对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = 5;
    //最小两行直接的间距
    layout.minimumLineSpacing = 5;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
    self.collectionView = collectionView;
    collectionView.backgroundColor = [UIColor redColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    
    //注册头视图
    [collectionView registerClass:[UICollectionReusableView class]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionHeaderView"];
}
//一共有多少个组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
//每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
//每一个cell是什么
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * CellIdentifier = @"GradientCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    return cell;
}
//头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    return nil;
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 50);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 1, 5, 1);
}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}
@end
