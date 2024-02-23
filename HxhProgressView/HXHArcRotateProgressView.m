//
//  HXHArcRotateProgressView.m
//  HXHGradientProgressLayerDemo
//
//  Created by colorpen on 2016/11/25.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import "HXHArcRotateProgressView.h"

@interface HXHArcRotateProgressView ()

/** 开始角度 */
@property (nonatomic, assign) CGFloat startAngle;
/** 结束角度 */
@property (nonatomic, assign) CGFloat endAngle;
/** 线宽 */
@property (nonatomic, assign) CGFloat lineWidth;
/** 半径 */
@property (nonatomic, assign) CGFloat arcRadius;
/** 圆心 */
@property (nonatomic, assign) CGPoint arcCenter;
/** 进度层 */
@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation HXHArcRotateProgressView


- (void)beginAnimationWithDuration:(CFTimeInterval)duration {
    // endPointLayer 按照路径移动
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"strokeEnd";
    animation.fromValue = @(0);
    animation.toValue = @(_maxProgressValue);
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.progressLayer addAnimation:animation forKey:@"strokeEnd"];
}

- (void)drawArcWithStartAngle:(CGFloat)startAngle
                     endAngle:(CGFloat)endAngle
                    lineWidth:(CGFloat)lineWidth
                    fillColor:(UIColor*)filleColor
                  strokeColor:(UIColor*)strokeColor {
    
    //保存弧线宽度,开始角度，结束角度
    self.startAngle = startAngle;
    self.endAngle   = endAngle;
    self.lineWidth  = lineWidth;
    self.arcRadius  = MIN(self.bounds.size.height, self.bounds.size.width) * 0.5 - self.lineWidth;
    
    UIBezierPath *outArc=[UIBezierPath bezierPathWithArcCenter:self.arcCenter
                                                        radius:self.arcRadius
                                                    startAngle:startAngle
                                                      endAngle:endAngle
                                                     clockwise:YES];
    // 底色 - 全长度，固定轨迹
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth     = lineWidth;
    shapeLayer.fillColor     = filleColor.CGColor;
    shapeLayer.strokeColor   = strokeColor.CGColor;
    shapeLayer.path          = outArc.CGPath;
    shapeLayer.lineCap       = kCALineCapRound;
    [self.layer addSublayer:shapeLayer];
}

/**
 *  进度条曲线
 *
 *  @param fillColor   填充颜色
 *  @param strokeColor 轮廓颜色
 */
- (void)drawProgressCicrleWithfillColor:(UIColor*)fillColor strokeColor:(UIColor*)strokeColor {
    
    UIBezierPath *progressPath  = [UIBezierPath bezierPathWithArcCenter:self.arcCenter
                                                                 radius:self.arcRadius
                                                             startAngle:self.startAngle
                                                               endAngle:self.endAngle
                                                              clockwise:YES];
    // 外圈进度条
    self.progressLayer.path = progressPath.CGPath;
    self.progressLayer.fillColor = fillColor.CGColor;
    self.progressLayer.strokeColor = strokeColor.CGColor;
    [self.layer addSublayer:self.progressLayer];
}

/**
 *  添加渐变图层
 *  @param colorGradArray 颜色数组，如果想达到红-黄-红效果，数组应该是红，黄，红
 */
- (void)setColorGradient:(NSArray*)colorGradArray {
    //渐变图层
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [gradientLayer setColors:colorGradArray];
    [gradientLayer setStartPoint:CGPointMake(0, 1)];
    [gradientLayer setEndPoint:CGPointMake(1, 1)];
    
    // 用progressLayer来截取渐变层
    CALayer *outsideGradientLayer = [CALayer layer];
    [outsideGradientLayer addSublayer:gradientLayer];
    [outsideGradientLayer setMask:self.progressLayer];
    [self.layer addSublayer:outsideGradientLayer];
}


#pragma mark - Getter
- (CAShapeLayer *)progressLayer {
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.lineWidth = self.lineWidth + 0.25f;
        _progressLayer.strokeStart = 0;
        _progressLayer.strokeEnd = 0.0;
        _progressLayer.lineCap = kCALineCapRound;
    }
    return _progressLayer;
}

- (CGPoint)arcCenter {
    return CGPointMake(self.center.x - self.frame.origin.x, self.center.y - self.frame.origin.y);
}


@end
