//
//  ZPickView.m
//  ZQBsaeDemo
//
//  Created by ZQQ on 2017/12/17.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZPickView.h"
#import "SHProvNmModel.h"
#import "SHCityModel.h"
#import "SHCountyModel.h"
@interface ZPickView ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,strong) NSArray *provArr; // 省
@property (nonatomic,strong) NSArray *cityArr; // 市
@property (nonatomic,strong) NSArray *countyArr; // 区
@property (nonatomic,assign) NSInteger index1; // 省下标
@property (nonatomic,assign) NSInteger index2; // 市下标
@property (nonatomic,assign) NSInteger index3; // 区下标
@property (nonatomic,strong) UIPickerView *pickview; // 选择器
@property (nonatomic,strong) UIView *topview; // 选择器头部
@end
@implementation ZPickView

- (instancetype)initWithFrame:(CGRect)frame {
    self =  [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    return self;
}
- (void)setupView{
    //添加数据
    [self addCityData];
    //添加view
    [self addPickview];
}

- (void)addCityData{
    //解析省数组
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CityList" ofType:@"plist"];
    NSArray *data = [[NSArray alloc] initWithContentsOfFile:path];
    
    NSArray *arr = [NSArray modelArrayWithClass:[SHProvNmModel class] json:data];
    self.provArr = arr;
    
    // 根据省的index1，默认是0，拿出对应省下面的市
    SHProvNmModel *proModel = arr[self.index1];
    NSArray *cityArr = [NSArray modelArrayWithClass:[SHCityModel class] json:proModel.cityList];
    self.cityArr = cityArr;
    //区
    SHCityModel *cityMole = cityArr[self.index2];
    NSArray *counArr = [NSArray modelArrayWithClass:[SHCountyModel class] json:cityMole.countyList];
    self.countyArr = counArr;
    
}
- (void)addPickview{
    //添加pickview
    UIPickerView *pickView = [[UIPickerView alloc]init];
    self.pickview = pickView;
    pickView.backgroundColor = [UIColor whiteColor];
    pickView.frame = CGRectMake(0, 44, kScreenWidth, kPickViewHeight);
    pickView.delegate = self;
    pickView.dataSource = self;
    
    //添加取消和确定按钮
    UIView *topview = [[UIView alloc]init];
    self.topview = topview;
    topview.backgroundColor = [UIColor redColor];
    topview.frame = CGRectMake(0, 0, kScreenWidth, 44);
    //添加按钮
    UIButton *cancelbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [topview addSubview:cancelbutton];
    cancelbutton.tag = 101;
    [cancelbutton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelbutton addTarget:self action:@selector(topbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *donebutton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-50, 0, 50, 44)];
    [topview addSubview:donebutton];
    donebutton.tag = 102;
    [donebutton setTitle:@"确认" forState:UIControlStateNormal];
    [donebutton addTarget:self action:@selector(topbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.pickview];
    [self addSubview:self.topview];
}
- (void)topbuttonClick:(UIButton *)button{
    if (button.tag == 101) {
        //取消
//        [self closePickView];
        if (self.cancelBtnClicktBlock) {
            self.cancelBtnClicktBlock();
        }
    }else{
        //确认
//        [self closePickView];
        
        //省市区
        SHProvNmModel *model = self.provArr[self.index1];
        SHCityModel *cityModel = self.cityArr[self.index2];
        SHCountyModel *couModel = self.countyArr[self.index3];
        NSLog(@"%@ %@ %@",model.provNm,cityModel.cityNm,couModel.countyNm);
        if (self.doneBtnClicktBlock) {
            self.doneBtnClicktBlock(model.provNm, cityModel.cityNm, couModel.countyNm);
        }
    }
}

#pragma mark - UIPickerViewDataSource Implementation
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // Returns
    switch (component)
    {
        case 0: return self.provArr.count;
        case 1: return self.cityArr.count;
        case 2:return self.countyArr.count;
        default:break;
    }
    return 0;
}
#pragma mark UIPickerViewDelegate Implementation

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* label = (UILabel*)view;
    if (!label)
    {
        label = [[UILabel alloc] init];
        [label setFont:[UIFont systemFontOfSize:14]];
    }
    
    NSString * title = @"";
    if (component == 0) {
        SHProvNmModel *model = self.provArr[row];
        title = model.provNm;
    }
    if (component == 1) {
        SHCityModel *model = self.cityArr[row];
        title = model.cityNm;
    }
    if (component == 2) {
        SHCountyModel *model = self.countyArr[row];
        title = model.countyNm;
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.text=title;
    return label;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
        {
            self.index1 = row;
            self.index2 = 0;
            self.index3 = 0;
            // 滚动的时候都要进行一次数组的刷新
            [self addCityData];
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }
            break;
            
        case 1:
        {
            self.index2 = row;
            self.index3 = 0;
            [self addCityData];
            [pickerView selectRow:0 inComponent:2 animated:YES];
            [pickerView reloadComponent:2];
        }
            break;
        case 2:
            self.index3 = row;
            break;
        default:break;
    }
}
@end
