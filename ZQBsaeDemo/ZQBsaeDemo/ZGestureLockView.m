//
//  ZGestureLockView.m
//  ZQBsaeDemo
//
//  Created by crfchina-mac-mini-1000 on 2017/10/30.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZGestureLockView.h"
@interface ZGestureLockView()
@property (strong, nonatomic) NSMutableArray *selectBtns;//选中的按钮数组
@property (nonatomic, strong) NSMutableArray *errorBtns;//错误的按钮数组
@property(nonatomic, assign)BOOL finished;//是否完成
@property (nonatomic, assign) CGPoint currentPoint;//当前触摸点
@property (nonatomic, assign) DownLockType resultType;//解锁结果
@property (nonatomic, assign) SetGestureType setResultType;//设置结果
@end
@implementation ZGestureLockView

- (NSMutableArray *)selectBtns {
    if (!_selectBtns) {
        _selectBtns = [NSMutableArray array];
    }
    return _selectBtns;
}

- (NSMutableArray *)errorBtns {
    if (!_errorBtns) {
        _errorBtns = [NSMutableArray array];
    }
    return _errorBtns;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        
    }
    return self;
}
//子视图初始化
- (void)initSubviews {
    self.backgroundColor = [UIColor clearColor];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    //创建9个按钮
    for (NSInteger i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        [btn setImage:[UIImage imageNamed:@"Gesture_Default"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"Gesture_ture"] forState:UIControlStateSelected];
        btn.tag = i+1;
        [self addSubview:btn];
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSUInteger count = 9;
    int cols = 3;//总列数
    CGFloat x = 0,y = 0,w = 0,h = 0;
    if (kScreenWidth == 320) {
        w = 50;
        h = 50;
    } else {
        w = 60;
        h = 60;
    }
    CGFloat minWidth = MIN(self.height, self.width);
    CGFloat margin = (minWidth - cols * w) / (cols + 1);//间距
    CGFloat col ;
    CGFloat row ;
    for (int i = 0; i < count; i++) {
        col = i % cols;
        row = i / cols;
        x = (col+1)*margin + col*w;
        y = (row+1)*margin + row*h;
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, w, h);
    }
}
//调用这个方法就会把之前绘制的东西清空 重新绘制
- (void)drawRect:(CGRect)rect {
    if (_selectBtns.count == 0) return;
    // 把所有选中按钮中心点连线
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < self.selectBtns.count; i ++) {
        UIButton *btn = self.selectBtns[i];
        if (i == 0) {
            [path moveToPoint:btn.center]; // 设置起点
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    
    //判断是否松开手指
    if (self.finished) {
        //松开手
        NSMutableString *pwd = [self transferGestureResult];//传递创建的密码
        [[UIColor redColor] set];
        if ([self.delegate respondsToSelector:@selector(gestureLockView:drawRectFinished:)]) {
            [self.delegate gestureLockView:self drawRectFinished:pwd];
        }
        
        if (self.isSetGesture) {
            //设置密码
            switch (self.setResultType) {
                case SetGestureTypeNoEnough:
                {
                    [[UIColor clearColor] set];
                }
                    break;
                case SetGestureTypeTrue:
                {
                    [[UIColor blueColor] set];
                }
                    break;
                default:
                    break;
            }
        } else {
            switch (self.resultType) {
                case DownLockTypeTrue:
                {
                    //正确
                    [[UIColor clearColor] set];
                }
                    break;
                case DownLockTypeFalse:
                {
                    //错误
                    [[UIColor redColor] set];
                    for (int i = 0; i < self.errorBtns.count; i++) {
                        UIButton *btn =  [self.errorBtns objectAtIndex:i];
                        [btn setImage:[UIImage imageNamed:@"Gesture_false"] forState:UIControlStateNormal];
                    }
                    break;
                case DownLockTypeNoEnough:
                    {
                        [[UIColor clearColor] set];
                    }
                    break;
                case DownLockTypeClear:
                    {
                        
                    }
                    break;
                default:
                    break;
                }
            }
        }
    } else {
        //密码输入中
        [path addLineToPoint:self.currentPoint];
        [[UIColor greenColor] set];
    }
    path.lineWidth = 1;
    path.lineJoinStyle = kCGLineCapRound;//线条拐角
    path.lineCapStyle = kCGLineCapRound;//终点处理
    [path stroke];
}
#pragma mark 手势
- (void)pan:(UIPanGestureRecognizer *)pan {
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        for (UIButton *btn in _errorBtns) {
            [btn setImage:[UIImage imageNamed:@"Gesture_Default"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"Gesture_ture"] forState:UIControlStateSelected];
        }
        [self.errorBtns removeAllObjects];
    }
    _currentPoint = [pan locationInView:self];

    for (UIButton *button in self.subviews) {
        if (CGRectContainsPoint(button.frame, _currentPoint)) {
            if (button.selected == NO) {
                //点在按钮上
                button.selected = YES;//设置为选中
                [self.selectBtns addObject:button];
            }
        }
    }
    
    //重绘
    [self setNeedsDisplay];
    //监听手指松开
    if (pan.state == UIGestureRecognizerStateEnded) {
        self.finished = YES;
    }
}

//传递设置的手势密码
- (NSMutableString *)transferGestureResult {
    //创建可变字符串
    NSMutableString *result = [NSMutableString string];
    for (UIButton *btn in self.selectBtns) {
        [result appendFormat:@"%ld", btn.tag - 1];
    }
    return result;
}

//清除
- (void)clearLockView {
    self.finished = NO;
    //遍历所有选中的按钮
    for (UIButton *btn in self.selectBtns) {
        //取消选中状态
        btn.selected = NO;
    }
    [self.selectBtns removeAllObjects];
    //
    [self setNeedsDisplay];
}
//检验密码正误
- (void)checkPwdResult:(DownLockType)resultType {
    self.resultType = resultType;
    switch (resultType) {
        case DownLockTypeFalse:
            _errorBtns = [NSMutableArray arrayWithArray:self.selectBtns];
            break;
        case DownLockTypeTrue:
            break;
        case DownLockTypeNoEnough:
            break;
        case DownLockTypeClear:
        {
            [[UIColor clearColor] set];
            for (int i = 0; i < self.errorBtns.count; i++) {
                UIButton *btn =  [self.errorBtns objectAtIndex:i];
                [btn setImage:[UIImage imageNamed:@"Gesture_Default"] forState:UIControlStateNormal];
            }
            [self.errorBtns removeAllObjects];
        }
            break;
        default:
            break;
    }
    [self clearLockView];
}

- (void)checkSetResult:(SetGestureType)resultType {
    self.setResultType = resultType;
    switch (resultType) {
        case SetGestureTypeTrue:
            break;
        case SetGestureTypeNoEnough:{
            [self clearLockView];
        }
            break;
        default:
            break;
    }
}

@end
