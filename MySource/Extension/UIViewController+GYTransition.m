//
//  UIViewController+GYTransition.m
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/17.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "UIViewController+GYTransition.h"

#import "GYTransitionAnimation.h"
#import "GYDevil.h"

#import <objc/runtime.h>


static char devilKey;

@interface UIViewController ()

@end

@implementation UIViewController (GYTransition)

- (GYDevil *)devil{
    self.modalPresentationStyle = UIModalPresentationCustom;
    if (!objc_getAssociatedObject(self, &devilKey)) {
        [self setDevil:[GYDevil new]];
    }
    self.transitioningDelegate = self;
    return objc_getAssociatedObject(self, &devilKey);
}

- (void)setDevil:(GYDevil *)devil{
    objc_setAssociatedObject(self,  &devilKey, devil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    GYTransitionAnimation *presentAnimation = [self.devil valueForKey:@"presentAnimation"];
    return presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    GYTransitionAnimation *dismissAnimation = [self.devil valueForKey:@"dismissAnimation"];
    return dismissAnimation;
}

@end
