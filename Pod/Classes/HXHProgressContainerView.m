//
//  HXHProgressContainerView.m
//  HXHGradientProgressLayerDemo
//
//  Created by colorpen on 2016/11/25.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import "HXHProgressContainerView.h"
#import "HXHArcRotateProgressView.h"
#import "HXHArcRotatePointView.h"
#import "UICountingLabel.h"

// 外圈固定宽度
static CGFloat const outsideLineWidth = 10.0f;
// 内圈固定宽度
static CGFloat const insideLineWidth = 2.0f;
// 外圈与内圈的缝隙
static CGFloat const lineGapWidth = 10.0f;

@interface HXHProgressContainerView ()

// 外圈
@property (nonatomic, strong) HXHArcRotateProgressView * outsideView;
// 内圈
@property (nonatomic, strong) HXHArcRotateProgressView * insideView;
// 两个小圆点
@property (nonatomic, strong) HXHArcRotatePointView * pointView;
// 中间数字
@property (nonatomic, strong) UICountingLabel * countLabel;

@end

@implementation HXHProgressContainerView

- (void)beginAnimation {
    [self.outsideView beginAnimationWithDuration:self.animationDuration];
    [self.insideView beginAnimationWithDuration:self.animationDuration];
    [self.pointView beginAnimationWithDuration:self.animationDuration];
    [self.countLabel countFrom:0.0 to:self.maxCount withDuration:self.animationDuration];
}

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configParameter];
    }
    return self;
}

- (void)configParameter {
    // 设置默认参数
    self.maxProgressValue = 1.0f;
    self.animationDuration = 2.5f;
    self.maxCount = 5.0f;
    self.countLabelTextColor = [UIColor blackColor];
    self.colorGradientArray = @[(id)[[UIColor orangeColor] CGColor],(id)[[UIColor yellowColor] CGColor]];
    
    // 布局UI
    [self configProgressWithMaxProgressValue:self.maxProgressValue];
}

- (void)configProgressWithMaxProgressValue:(CGFloat)maxProgressValue {
    
    /********************************** 外圈 ************************************/
    self.outsideView = [[HXHArcRotateProgressView alloc] initWithFrame:self.bounds];
    self.outsideView.backgroundColor = [UIColor cyanColor];
    //弧线
    [self.outsideView drawArcWithStartAngle:-M_PI * 1.25
                                   endAngle:M_PI * 0.25
                                  lineWidth:outsideLineWidth
                                  fillColor:[UIColor clearColor]
                                strokeColor:[UIColor grayColor]];
    self.outsideView.maxProgressValue = maxProgressValue;
    // 进度的曲线
    [self.outsideView drawProgressCicrleWithfillColor:[UIColor clearColor] strokeColor:[UIColor whiteColor]];
    [self.outsideView setColorGradient:self.colorGradientArray];
    [self addSubview:self.outsideView];
    
    /********************************** 内圈 ************************************/
    CGFloat inside_X = outsideLineWidth + lineGapWidth;
    CGFloat inside_W = self.bounds.size.width - 2 * (outsideLineWidth + lineGapWidth);
    CGRect insideRect = CGRectMake(inside_X, inside_X, inside_W, inside_W);
    
    self.insideView = [[HXHArcRotateProgressView alloc] initWithFrame:insideRect];
    self.insideView.layer.cornerRadius = 0.5 * inside_W;
    //弧线
    [self.insideView drawArcWithStartAngle:-M_PI * 1.25
                                  endAngle:M_PI * 0.25
                                 lineWidth:insideLineWidth
                                 fillColor:[UIColor clearColor]
                               strokeColor:[UIColor clearColor]];
    self.insideView.maxProgressValue = maxProgressValue;
    
    // 进度的曲线
    [self.insideView drawProgressCicrleWithfillColor:[UIColor clearColor] strokeColor:[UIColor whiteColor]];
    [self.insideView setColorGradient:self.colorGradientArray];
    
    [self addSubview:self.insideView];
    
    /********************************** 圆点 ************************************/
    self.pointView = [[HXHArcRotatePointView alloc] initWithFrame:insideRect];
    self.pointView.layer.cornerRadius = 0.5 * inside_W;
    self.pointView.maxProgressValue = maxProgressValue;
    [self.pointView drawArcWithStartAngle:-M_PI * 1.25
                                 endAngle:M_PI * 0.25
                                lineWidth:insideLineWidth
                                fillColor:[UIColor clearColor]
                              strokeColor:[UIColor grayColor]];
    [self addSubview:self.pointView];
    
    /********************************** 数字 ************************************/
    CGFloat label_X = outsideLineWidth + lineGapWidth + 10.0;
    CGFloat label_W = insideRect.size.width - 2 * (outsideLineWidth + lineGapWidth + 10);
    CGRect labelRect = CGRectMake(label_X, label_X, label_W, label_W);
    
    self.countLabel = [[UICountingLabel alloc] initWithFrame:labelRect];
    self.countLabel.center = self.pointView.center;
    self.countLabel.font = [UIFont boldSystemFontOfSize:38.0];
    self.countLabel.textColor = self.countLabelTextColor;
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    self.countLabel.format = @"%.1f";
    [self addSubview:self.countLabel];
}

#pragma mark - Setter

- (void)setMaxProgressValue:(CGFloat)maxProgressValue {
    _maxProgressValue = maxProgressValue;
    // 重新添加
    [self configProgressWithMaxProgressValue:self.maxProgressValue];
}

- (void)setMaxCount:(CGFloat)maxCount {
    _maxCount = maxCount;
    // 重新添加
    [self configProgressWithMaxProgressValue:self.maxProgressValue];
}

- (void)setColorGradientArray:(NSArray *)colorGradientArray {
    _colorGradientArray = colorGradientArray;
    // 重新添加
    [self configProgressWithMaxProgressValue:self.maxProgressValue];
}

- (void)setCountLabelTextColor:(UIColor *)countLabelTextColor {
    _countLabelTextColor = countLabelTextColor;
    // 重新添加
    [self configProgressWithMaxProgressValue:self.maxProgressValue];
}

@end
