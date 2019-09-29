//
//  GYTransitionAnimation.h
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/17.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger ,GYTransitionType) {
    GYTransitionTypeCover = 0,
    GYTransitionTypeFade,
    GYTransitionTypeZoom
};

typedef NS_ENUM(NSUInteger ,GYAnimationDirection) {
    GYAnimationDirectionLeft = 0,
    GYAnimationDirectionRight ,
    GYAnimationDirectionTop ,
    GYAnimationDirectionBottom ,
};

@interface GYTransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (assign ,nonatomic) GYTransitionType transitionType;

@property (assign ,nonatomic) GYAnimationDirection animationDirection;

@end

NS_ASSUME_NONNULL_END
