//
//  ZCellGroupController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/9/4.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZCellGroupController.h"

@interface ZCellGroupController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;//分组
@property (nonatomic, strong) NSArray *friendsArray;//每组对应内容
@property (nonatomic, strong) NSMutableArray  *selectedArr;//存储需要展开的cell组

@end

@implementation ZCellGroupController


-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.selectedArr = [[NSMutableArray alloc]init];
    [self addTableView];
    [self addData];
}
- (void)addTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kViewTop) style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    //避免iOS11tableview分组不能正常显示
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
}
- (void)addData{
    self.titleArray = [NSArray arrayWithObjects:@"好友",@"陌生人", nil];
    self.friendsArray = [NSArray arrayWithObjects:
                                             @[@"A",@"B",@"C",@"D",@"E",@"F"],
                                             @[@"陌生1",@"陌生2",@"陌生3",@"陌生4",@"陌生5",@"陌生6",@"陌生7",@"陌生8",@"陌生9",@"陌生10",@"陌生11",@"陌生12",@"陌生13",@"陌生14"],nil];
}

#pragma mark --tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titleArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *sectionStr = [NSString stringWithFormat:@"%ld",(long)section];
    NSInteger num ;
    //如果selectedArr不包含section，该分组返回number为0；
    if ([self.selectedArr containsObject:sectionStr]) {
        NSArray *arrayData = self.friendsArray[section];
        
        num = arrayData.count ;
    }else{
        num = 0;
    }
    return num;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5,kScreenWidth-20 , 30)];
    titleLabel.text = self.titleArray[section];
    [view addSubview:titleLabel];
    
    //添加点击事件
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    btn.tag = 100+section;
    [btn addTarget:self action:@selector(viewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return view;
}
- (void)viewBtnClick:(UIButton *)btn{
    NSString *string = [NSString stringWithFormat:@"%ld",btn.tag - 100];
    if ([self.selectedArr containsObject:string]) {
        [self.selectedArr removeObject:string];
    }else{
        [self.selectedArr addObject:string];
    }
    NSLog(@"selectedArr:%@",self.selectedArr);

    [_tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *sectionStr = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
    static NSString *cellID = @"testCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle  = UITableViewCellSelectionStyleGray;

    }
    
    NSArray *arrayData = self.friendsArray[indexPath.section];
    
    if ([self.selectedArr containsObject:sectionStr]) {
        cell.textLabel.text = arrayData[indexPath.row];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
@end
