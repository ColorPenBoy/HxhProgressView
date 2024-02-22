//
//  HXHArcRotatePointView.m
//  HXHGradientProgressLayerDemo
//
//  Created by colorpen on 2016/11/25.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import "HXHArcRotatePointView.h"

@interface HXHArcRotatePointView ()

/** 圆点动画路径 */
@property (nonatomic, strong) UIBezierPath * animationPath;
/** 起点圆点 - 固定 */
@property (nonatomic, strong) CALayer * startPointLayer;
/** 终点圆点 - 移动 */
@property (nonatomic, strong) CALayer * endPointLayer;

@end

@implementation HXHArcRotatePointView

- (void)beginAnimationWithDuration:(CFTimeInterval)duration {
    // endPointLayer 按照路径移动
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = self.animationPath.CGPath;
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.calculationMode = kCAAnimationCubicPaced;
    [self.endPointLayer addAnimation:animation forKey:@"position"];
}

- (void)drawArcWithStartAngle:(CGFloat)startAngle
                     endAngle:(CGFloat)endAngle
                    lineWidth:(CGFloat)lineWidth
                    fillColor:(UIColor*)filleColor
                  strokeColor:(UIColor*)strokeColor {
    // 半径
    CGFloat r_radius = MIN(self.bounds.size.height, self.bounds.size.width) * 0.5 - lineWidth;
    // 圆心
    CGPoint r_center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y - self.frame.origin.y);
    // 起点
    CGPoint startPoint = [UIBezierPath bezierPathWithArcCenter:r_center
                                                        radius:r_radius
                                                    startAngle:startAngle
                                                      endAngle:startAngle
                                                     clockwise:YES].currentPoint;
    // 动画路径
    self.animationPath = [UIBezierPath bezierPathWithArcCenter:r_center
                                                        radius:r_radius
                                                    startAngle:startAngle
                                                      endAngle:endAngle - (1.5 * M_PI) * (1.0 - self.maxProgressValue)
                                                     clockwise:YES];
    // 加入两个圆点
    [self.layer addSublayer:self.startPointLayer];
    [self.layer addSublayer:self.endPointLayer];
    
    // 两个点移动到Bezier曲线的起点
    self.startPointLayer.position = startPoint;
    self.endPointLayer.position = startPoint;
}

#pragma mark - Getter
- (CALayer *)startPointLayer {
    if (!_startPointLayer) {
        _startPointLayer = [self getStartLayer];
    }
    return _startPointLayer;
}

- (CALayer *)endPointLayer {
    if (!_endPointLayer) {
        _endPointLayer = [self getStartLayer];
    }
    return _endPointLayer;
}

- (CALayer *)getStartLayer {
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 5, 5);
    layer.cornerRadius = 0.5 * layer.bounds.size.width;
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    return layer;
}

@end
