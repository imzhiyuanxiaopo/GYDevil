//
//  UIView+GYTransitaion.m
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/27.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "UIView+GYTransitaion.h"

#import "GYDevil.h"

#import <objc/runtime.h>

static char devilKey;

@implementation UIView (GYTransitaion)

- (GYDevil *)devil{
    if (!objc_getAssociatedObject(self, &devilKey)) {
        [self setDevil:[GYDevil new]];
    }
    return objc_getAssociatedObject(self, &devilKey);
}

- (void)setDevil:(GYDevil *)devil{
    objc_setAssociatedObject(self,  &devilKey, devil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
