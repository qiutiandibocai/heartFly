//
//  heartFiyView.m
//  UI(冒❤️)
//
//  Created by Ibokan2 on 16/6/21.
//  Copyright © 2016年 ibokan. All rights reserved.
//
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
//#define RGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#import "heartFiyView.h"
@interface heartFiyView ()
@property(nonatomic,strong) UIColor *strokeColor;
@property(nonatomic,strong) UIColor *fillColor;
@end
@implementation heartFiyView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _strokeColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
        self.layer.anchorPoint = CGPointMake(0.5, 1);
        _fillColor =RandColor;
    }
    return self;
}
-(void)animateAtView:(UIView *)view{
    NSTimeInterval totalDuration = 5;
    CGFloat heartSize = CGRectGetHeight(self.bounds);
    CGFloat heartCenterX = self.center.x;
    CGFloat viewHeight = CGRectGetHeight(view.bounds);
    
    self.transform = CGAffineTransformMakeScale(0, 0);
    self.alpha = 0;
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 0.9;
    } completion:nil];
    
    NSInteger a = arc4random_uniform(2);
    NSInteger b = 1-(2*a);
    NSInteger c = arc4random_uniform(100);
    
    [UIView animateWithDuration:totalDuration animations:^{
        self.transform = CGAffineTransformMakeRotation(b*M_PI/(16+c*0.2));
    } completion:nil];
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:self.center];
    
    CGPoint point2 = CGPointMake(heartCenterX+(b)*arc4random_uniform(2*heartSize), viewHeight/6+arc4random_uniform(viewHeight/4));
    
    
    CGFloat float1 =(heartSize/2+arc4random_uniform(2*heartSize))*b;
    CGFloat float2 =MAX(point2.y, MAX(arc4random_uniform(8*heartSize), heartSize));
    CGPoint pointa = CGPointMake(heartCenterX+float1, viewHeight-float2);
    CGPoint pointb = CGPointMake(heartCenterX-2*float1, float2);
    [path1 addCurveToPoint:point2 controlPoint1:pointa controlPoint2:pointb];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path1.CGPath;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration =totalDuration+point2.y/viewHeight;
    [self.layer addAnimation:animation forKey:@"position"];
    
    [UIView animateWithDuration:totalDuration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    
//    [_strokeColor setStroke];
//    [_fillColor setFill];
//    CGFloat curv = floor((CGRectGetWidth(rect)-8)/4);
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    CGPoint lefta = CGPointMake(floor(CGRectGetWidth(rect)/2), CGRectGetHeight(rect)-4);
//    [path moveToPoint:lefta];
//    
//    //左边
//    CGPoint leftb =CGPointMake(4, floor(CGRectGetHeight(rect)/2.4));
//    [path addQuadCurveToPoint:leftb controlPoint:CGPointMake(leftb.x, leftb.y+curv)];
//    [path addArcWithCenter:CGPointMake(leftb.x+curv, leftb.y) radius:curv startAngle:M_PI endAngle:0 clockwise:YES];
//    //右边
//    CGPoint righta = CGPointMake(leftb.x+2*curv, leftb.y);
//    [path addArcWithCenter:CGPointMake(righta.x+curv, righta.y) radius:curv startAngle:M_PI endAngle:0 clockwise:YES];
//    
//    CGPoint rightb = CGPointMake(leftb.x+4*curv, righta.y);
//    [path addQuadCurveToPoint:lefta controlPoint:CGPointMake(rightb.x, rightb.y+curv)];
//    [path fill];
//    path.lineWidth = 2;
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineJoinRound;
//    [path stroke];

    
    [_strokeColor setStroke];
    [_fillColor setFill];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(18, 32)];
    [path addQuadCurveToPoint:CGPointMake(4, 15) controlPoint:CGPointMake(4, 22)];
    [path addArcWithCenter:CGPointMake(11, 15) radius:7 startAngle:M_PI endAngle:0 clockwise:YES];
    [path addArcWithCenter:CGPointMake(25, 15) radius:7 startAngle:M_PI endAngle:0 clockwise:YES];
    [path addQuadCurveToPoint:CGPointMake(18, 32) controlPoint:CGPointMake(32, 22)];
    [path fill];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    [path stroke];
    
}



@end
