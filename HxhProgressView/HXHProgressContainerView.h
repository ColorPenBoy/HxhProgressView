//
//  HXHProgressContainerView.h
//  HXHGradientProgressLayerDemo
//
//  Created by colorpen on 2016/11/25.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXHProgressContainerView : UIView

/**
 *  设定最大值：赋值区间 - (0~1)
 *  默认为 1
 */
@property (nonatomic, assign) CGFloat maxProgressValue;

/**
 *  动画时间
 *  默认为 2.5s
 */
@property CFTimeInterval animationDuration;

/**
 *  添加渐变图层 - 颜色数组，如果想达到红-黄-红效果，数组应该是红，黄，红
 *  默认为 @[(id)[[UIColor orangeColor] CGColor],(id)[[UIColor yellowColor] CGColor]]
 */
@property (nonatomic, strong) NSArray *colorGradientArray;

/**
 *  中央显示的数字的最大值
 *  默认为 5.0
 */
@property (nonatomic, assign) CGFloat maxCount;

/**
 *  中央显示的数字的颜色
 *  默认为 blackColor
 */
@property (nonatomic, strong) UIColor *countLabelTextColor;

/**
 *  开始动画
 */
- (void)beginAnimation;

@end
