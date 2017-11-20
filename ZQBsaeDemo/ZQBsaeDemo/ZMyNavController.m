//
//  ZMyNavController.m
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/11/16.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZMyNavController.h"
#import "ZMyNavView.h"
@interface ZMyNavController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *_headerImg;
    UILabel *_nameLabel;
    NSMutableArray *_dataArray;
    
}
@property(nonatomic,strong)UIImageView *backgroundImgV;
@property(nonatomic,assign)float backImgHeight;
@property(nonatomic,assign)float backImgWidth;
@property(nonatomic,strong)ZMyNavView *NavView;
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ZMyNavController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self backImageView];
    
    [self createNaView];
    
    [self loadData];
    
    [self setUpTableView];
}


-(void)setUpTableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kViewTop, kScreenWidth, kScreenHeight-kViewTop) style:UITableViewStylePlain];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.dataSource=self;
        _tableView.delegate=self;
        _tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_tableView];
    }
    [_tableView setTableHeaderView:[self headImageView]];
}

- (void)backImageView{
    UIImage *image = [UIImage imageNamed:@"backImage"];
    UIImageView *backgroundImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, image.size.height*0.8)];
    self.backgroundImgV = backgroundImgView;
    backgroundImgView.image = image;
    backgroundImgView.userInteractionEnabled = YES;
    [self.view addSubview:backgroundImgView];
    
    _backImgHeight = backgroundImgView.height;
    _backImgWidth = backgroundImgView.width;
}
-(void)createNaView
{
    self.NavView=[[ZMyNavView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kViewTop)];
    self.NavView.titleStr = @"我的";
    self.NavView.labelColor = [UIColor whiteColor];
    self.NavView.leftImageStr = @"left_first";
    self.NavView.rightImageStr = @"left_first";
    __weak ZMyNavController *weakSelf = self;
    
    self.NavView.rightItemBlock = ^{
        [weakSelf popViewController];
    };
    self.NavView.leftItemBlock = ^{
        [weakSelf popViewController];
    };
    [self.view addSubview:self.NavView];
    
}


- (void)popViewController{
    [self.navigationController popViewControllerAnimated:NO];
    
}
-(void)loadData{
    
    _dataArray =[[NSMutableArray alloc]init];
    
    for (int i = 0; i < 20; i++) {
        
        NSString * string=[NSString stringWithFormat:@"第%d行",i];
        
        [_dataArray addObject:string];
        
    }
    
}
-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView=[[UIImageView alloc]init];
        _headImageView.frame=CGRectMake(0, kViewTop, kScreenWidth, 170);
        _headImageView.backgroundColor=[UIColor clearColor];
        _headImageView.userInteractionEnabled = YES;
        
        _headerImg=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-35, 50, 70, 70)];
        _headerImg.center=CGPointMake(kScreenWidth/2, 70);
        [_headerImg setImage:[UIImage imageNamed:@"headerImage"]];
        [_headerImg.layer setMasksToBounds:YES];
        [_headerImg.layer setCornerRadius:35];
        _headerImg.backgroundColor=[UIColor whiteColor];
        _headerImg.userInteractionEnabled=YES;
        UITapGestureRecognizer *header_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(header_tap_Click:)];
        [_headerImg addGestureRecognizer:header_tap];
        [_headImageView addSubview:_headerImg];
        
        
        _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(147, 130, 105, 20)];
        _nameLabel.center = CGPointMake(kScreenWidth/2, 125);
        _nameLabel.text = @"test";
        _nameLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *nick_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nick_tap_Click:)];
        [_nameLabel addGestureRecognizer:nick_tap];
        _nameLabel.textColor=[UIColor whiteColor];
        _nameLabel.textAlignment=NSTextAlignmentCenter;
        [_headImageView addSubview:_nameLabel];
    }
    return _headImageView;
}
-(void)header_tap_Click:(UITapGestureRecognizer *)tap
{
    NSLog(@"头像");
}
//昵称
-(void)nick_tap_Click:(UIButton *)item
{
    NSLog(@"昵称");
}
#pragma mark ---- UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"ZMyNavCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    int contentOffsety = scrollView.contentOffset.y;

    if (scrollView.contentOffset.y<=170) {
        self.NavView.headBackView.alpha = scrollView.contentOffset.y/170;
        self.NavView.leftImageStr = @"left_first";
        self.NavView.rightImageStr = @"left_first";
        self.NavView.labelColor = [UIColor whiteColor];


    }else{
        self.NavView.headBackView.alpha = 1;

        self.NavView.leftImageStr = @"left";
        self.NavView.rightImageStr = @"left";
        self.NavView.labelColor = [UIColor blueColor];

    }
    if (contentOffsety<0) {
        CGRect rect = _backgroundImgV.frame;
        rect.size.height = _backImgHeight-contentOffsety;
        rect.size.width = _backImgWidth* (_backImgHeight-contentOffsety)/_backImgHeight;
        rect.origin.x =  -(rect.size.width-_backImgWidth)/2;
        rect.origin.y = 0;
        _backgroundImgV.frame = rect;
    }else{
        CGRect rect = _backgroundImgV.frame;
        rect.size.height = _backImgHeight;
        rect.size.width = _backImgWidth;
        rect.origin.x = 0;
        rect.origin.y = -contentOffsety;
        _backgroundImgV.frame = rect;

    }


}

@end
