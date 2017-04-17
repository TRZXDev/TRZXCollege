//
//  TRZXWavesView.h
//  TRZXCollege
//
//  Created by N年後 on 2017/4/17.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WavesBlock)(CGRect myFrame);


@interface TRZXWavesView : UIView
/**
 *  浪弯曲度
 */
@property (nonatomic, assign) CGFloat waveCurvature;
/**
 *  浪速
 */
@property (nonatomic, assign) CGFloat waveSpeed;
/**
 *  浪高
 */
@property (nonatomic, assign) CGFloat waveHeight;
/**
 *  实浪颜色
 */
@property (nonatomic, strong) UIColor *realWaveColor;
/**
 *  遮罩浪颜色
 */
@property (nonatomic, strong) UIColor *maskWaveColor;

@property (nonatomic, copy) WavesBlock waveBlock;

@property (nonatomic , assign)CGRect imageFrame;


- (void)stopWaveAnimation;

- (void)startWaveAnimation;
@end
