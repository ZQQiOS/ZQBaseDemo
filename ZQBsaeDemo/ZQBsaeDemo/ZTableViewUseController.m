//
//  ZTableViewUseController.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/7/7.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZTableViewUseController.h"
@interface ZTableViewUseController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
//行的数组
@property (nonatomic, strong) NSMutableArray *arrayData;
//行对应的小的数组
@property (nonatomic, strong) NSArray *detailArrayData;
//记录选中行
@property (nonatomic, assign) NSInteger currentRow;
//最初的数组
@property (nonatomic, strong) NSArray *oldArray;
//是否打开
@property (nonatomic, assign) BOOL isOpen;
@end

@implementation ZTableViewUseController
- (NSArray *)oldArray{
    if (!_oldArray) {
        _oldArray = [NSArray array];
    }
    return _oldArray;
}
- (NSMutableArray *)arrayData{
    if (!_arrayData) {
        _arrayData = [NSMutableArray array];
    }
    return _arrayData;
}
- (NSArray *)detailArrayData{
    if (!_detailArrayData) {
        _detailArrayData = [NSArray array];
    }
    return _detailArrayData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kRandomColor;
    [self addTableView];
    [self addData];
    //默认isOpen为NO
    self.isOpen = NO;
    self.currentRow = -1;
}

- (void)addTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kScreenHeight) style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableView];
}
- (void)addData{
    self.arrayData = [NSMutableArray arrayWithObjects:@"第一组",@"第二组",@"第三组", nil];
    self.oldArray = @[@"第一组",@"第二组",@"第三组"];
    self.detailArrayData = @[@[@"123",@"234"],@[@"123",@"456"],@[@"135",@"246"]];
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"testCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
  
    cell.textLabel.text = self.arrayData[indexPath.row];
    return cell;
}

//选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //取消选中
    if (self.currentRow == indexPath.row) {
        [self didDeselectRow];
        
    }else{
        if (self.arrayData.count > self.oldArray.count) {
            [self didDeselectRow];
            
        }else{
            [self didDeselectRow];
            [self didSelectRow:indexPath.row];
        }
    }
    [self.tableView reloadData];

}
//选中
- (void)didSelectRow:(NSInteger )row{
    self.currentRow = row;
    NSArray *selectArray = (NSArray *)self.detailArrayData[row];
    NSInteger index = self.arrayData.count - row;
    //遍历数组插入
    for (NSString *str in selectArray) {
        [self.arrayData insertObject:str atIndex:self.arrayData.count -index +1 ];
    }
    
}

//取消已经选中的行
- (void)didDeselectRow{
    if (self.currentRow != -1) {
        self.currentRow = -1;
        //减数组
        self.arrayData = nil;
        [self.arrayData addObjectsFromArray:self.oldArray];
        
    }
 }
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 9.9;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
@end
