//
//  ZTabAddViewController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/9/6.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZTabAddViewController.h"
#import "ZContentCell.h"

@interface ZTabAddViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;

@end

@implementation ZTabAddViewController
- (NSArray *)arrayData{
    if (!_arrayData) {
        _arrayData = [NSArray array];
    }
    return _arrayData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //加载tableview
    [self setupTableView];
    [self setupData];

}
- (void)setupData{
    NSArray *array = @[@{@"groupName":@"商品",
                         @"cellContent":@[@{@"imageName":@"",@"titleLabel":@"商品查询"},
                                        @{@"imageName":@"",@"titleLabel":@"价钱生成"}]},
                       @{@"groupName":@"即将上线",
                         @"cellContent":@[@{@"imageName":@"",@"titleLabel":@"通知发布"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"}]},
                       @{@"groupName":@"即将上线",
                         @"cellContent":@[@{@"imageName":@"",@"titleLabel":@"通知发布"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"}]},
                       @{@"groupName":@"即将上线",
                         @"cellContent":@[@{@"imageName":@"",@"titleLabel":@"通知发布"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"}]},
                       @{@"groupName":@"即将上线",
                         @"cellContent":@[@{@"imageName":@"",@"titleLabel":@"通知发布"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"}]},
                       @{@"groupName":@"即将上线",
                         @"cellContent":@[@{@"imageName":@"",@"titleLabel":@"通知发布"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"}]},
                       @{@"groupName":@"即将上线",
                         @"cellContent":@[@{@"imageName":@"",@"titleLabel":@"通知发布"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"},
                                          @{@"imageName":@"",@"titleLabel":@"会员管理"}
                                          ]}];
    
    NSDictionary *mDic = [NSDictionary dictionary];
    NSMutableArray *mArray = [NSMutableArray array];
    for (mDic in array) {
        //获取的字典
        ZContentModel *model = [[ZContentModel alloc]init];
        model = [ZContentModel modelWithJSON:mDic];
        [mArray addObject:model];
    }

    self.arrayData = mArray.copy;
}
- (void)setupTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight- kViewTop) style:UITableViewStyleGrouped];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    headerView.backgroundColor = [UIColor redColor];
    tableView.tableHeaderView = headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrayData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 35)];
    view.backgroundColor = [UIColor clearColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5,kScreenWidth-20 , 25)];
    ZContentModel *model = self.arrayData[section];
    titleLabel.text = model.groupName;
    [view addSubview:titleLabel];
    
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"ZContentCell";
    ZContentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ZContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.model = self.arrayData[indexPath.section];
    cell.clickImageBlock = ^(NSInteger currView) {
        // 点击第n个view
        NSLog(@"点击第n个view%ld",currView-100);
    };
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = (kScreenWidth -3*10)/4 +10;
    ZContentModel *model = self.arrayData[indexPath.section];
    CGFloat height;
    if (model.cellContent.count%4 == 0) {
        height = model.cellContent.count/4*h -10;
    }else{
        height = (model.cellContent.count/4 +1) *h -10;
    }
    return height;
}
@end
