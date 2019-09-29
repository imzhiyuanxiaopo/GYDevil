//
//  GYDevil.m
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/21.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "GYDevil.h"


@interface GYDevil ()

@property (assign ,nonatomic) BOOL isPresent;
@property (assign ,nonatomic) BOOL isDismiss;

/** 是否选择了dissmiss样式  未选择的话默认为present样式退出*/
@property (assign ,nonatomic) BOOL selectDismiss;

@property (strong ,nonatomic) GYTransitionAnimation *presentAnimation;
@property (strong ,nonatomic) GYTransitionAnimation *dismissAnimation;

@end

@implementation GYDevil

- (void)dealloc{
    NSLog(@"%@ WILL BE DEALLOC" ,NSStringFromClass(self.class));
}

- (GYTransitionAnimation *)presentAnimation{
    if (!_presentAnimation) {
        _presentAnimation = GYTransitionAnimation.new;
    }
    return _presentAnimation;
}

- (GYTransitionAnimation *)dismissAnimation{
    if (!_dismissAnimation) {
        _dismissAnimation = [GYTransitionAnimation new];
    }
    return _dismissAnimation;
}

- (GYDevil *)dismiss{
    self.isDismiss = YES;
    self.selectDismiss = YES;
    return self;
}

- (GYDevil *)present{
    self.isPresent = YES;
    return self;
}


- (GYDevil *(^)(GYTransitionType transitionType))transitionType{
    return ^(GYTransitionType transitionType){
        if (self.isPresent) {
            self.presentAnimation.transitionType = transitionType;
            self.isPresent = NO;
        }
        if (self.isDismiss) {
            self.dismissAnimation.transitionType = transitionType;
            self.isDismiss = NO;
        }
        return self;
    };
}

- (GYDevil * (^)(GYAnimationDirection))direction{
    return ^(GYAnimationDirection type){
        if (self.isPresent) {
            self.presentAnimation.animationDirection = type;
        }
        if (self.isDismiss && self.selectDismiss) {
            self.dismissAnimation.animationDirection = type;
        }else{
            self.dismissAnimation.animationDirection = self.presentAnimation.animationDirection;
        }
        return self;
    };
}

@end
