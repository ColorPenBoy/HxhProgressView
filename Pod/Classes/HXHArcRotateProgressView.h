//
//  HXHArcRotateProgressView.h
//  HXHGradientProgressLayerDemo
//
//  Created by colorpen on 2016/11/25.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXHArcRotateProgressView : UIView

/** 设定最大值：赋值区间 - (0~1) */
@property (nonatomic,assign) CGFloat maxProgressValue;

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

/**
 *  进度条曲线
 *
 *  @param fillColor   填充颜色
 *  @param strokeColor 轮廓颜色
 */
- (void)drawProgressCicrleWithfillColor:(UIColor*)fillColor
                            strokeColor:(UIColor*)strokeColor;
/**
 *  添加渐变图层
 *
 *  @param colorGradArray 颜色数组，如果想达到红-黄-红效果，数组应该是红，黄，红
 */
- (void)setColorGradient:(NSArray*)colorGradArray;

/**
 *  开始动画
 */
- (void)beginAnimationWithDuration:(CFTimeInterval)duration;

@end
