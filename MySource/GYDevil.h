//
//  GYDevil.h
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/21.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GYTransitionAnimation.h"
#import "UIViewController+GYTransition.h"
#import "UIView+GYTransitaion.h"
#import "GYViewContext.h"


NS_ASSUME_NONNULL_BEGIN

@interface GYDevil : NSObject <UIViewControllerTransitioningDelegate>

//@property (assign ,nonatomic) BOOL isEnable;

/** 唯一标识*/
@property (copy ,nonatomic) NSString *ID;

#pragma mark - 以下为viewcontroller方法
/// 设置跳转或者消失时，对属性进行设置
- (GYDevil *)dismiss;
- (GYDevil *)present;

/// 动画类型
- (GYDevil *(^)(GYTransitionType transitionType))transitionType;

/// 动画方向
/// 暂时只有滑动动画设置方向有效
/// 其他的动画设置方向没有影响
- (GYDevil *(^)(GYAnimationDirection))direction;

@end

NS_ASSUME_NONNULL_END
