#import "UIView+Ex.h"

@implementation UIView (Ex)

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect tempFrame = self.frame;
    tempFrame.origin.x = x;
    self.frame = tempFrame;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect tempFrame = self.frame;
    tempFrame.origin.y = y;
    self.frame = tempFrame;
}


- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect tempFrame = self.frame;
    tempFrame.size.width = width;
    self.frame = tempFrame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height
{
    CGRect tempFrame = self.frame;
    tempFrame.size.height = height;
    self.frame = tempFrame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect tempFrame = self.frame;
    tempFrame.size = size;
    self.frame = tempFrame;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint tempCenter =  self.center;
    tempCenter.x = centerX;
    self.center = tempCenter;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint tempCenter =  self.center;
    tempCenter.y = centerY;
    self.center = tempCenter;
}

-(void)makeCornerCircle {
    self.layer.cornerRadius = self.bounds.size.height / 2;
    self.layer.masksToBounds = YES;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

-(CGFloat)boundsWidth{
    return self.bounds.size.width;
}

-(void)setBoundsWidth:(CGFloat)boundsWidth{
    CGRect bounds = self.bounds;
    bounds.size.width = boundsWidth;
    self.bounds = bounds;
}

-(CGFloat)boundsHeight{
    return self.bounds.size.height;
}

-(void)setBoundsHeight:(CGFloat)boundsHeight{
    CGRect bounds = self.bounds;
    bounds.size.height = boundsHeight;
    self.bounds = bounds;
}





- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (void)setMaxX:(CGFloat)maxX{
    CGRect frame = self.frame;
    frame.origin.x = maxX - frame.size.width;
    self.frame = frame;
}

- (CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}

- (void)setMaxY:(CGFloat)maxY{
    CGRect frame = self.frame;
    frame.origin.y = maxY - frame.size.height;
    self.frame = frame;
}

- (CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}
@end

