//
//  UIViewController+GYTransition.h
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/17.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GYDevil;

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (GYTransition)<UIViewControllerTransitioningDelegate>

/** 魔王*/
@property (strong ,nonatomic ,readonly) GYDevil *devil;

@end

NS_ASSUME_NONNULL_END
