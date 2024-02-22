//
//  HXHArcRotatePointView.h
//  HXHGradientProgressLayerDemo
//
//  Created by colorpen on 2016/11/25.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXHArcRotatePointView : UIView

/** 设定最大值：赋值区间 - (0~1) */
@property (nonatomic,assign) CGFloat maxProgressValue;

/**
 *  开始动画
 */
- (void)beginAnimationWithDuration:(CFTimeInterval)duration;

/**
 *  画弧度
 *
 *  @param startAngle  开始角度
 *  @param endAngle    结束角度
 *  @param lineWidth  线宽
 *  @param filleColor  扇形填充颜色
 *  @param strokeColor 弧线颜色
 */
- (void)drawArcWithStartAngle:(CGFloat)startAngle
                     endAngle:(CGFloat)endAngle
                    lineWidth:(CGFloat)lineWidth
                    fillColor:(UIColor*)filleColor
                  strokeColor:(UIColor*)strokeColor;

@end
