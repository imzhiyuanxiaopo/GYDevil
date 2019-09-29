//
//  GYTransitionAnimation.m
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/17.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "GYTransitionAnimation.h"

#import "GYDevil.h"
#import "UIView+GYTransitaion.h"

static CGFloat kTWidth;
static CGFloat kTHeight;

typedef NSMutableArray <UIView *> DevilIDArray;

@interface GYTransitionAnimation ()

@property (weak ,nonatomic) UIViewController *toViewController;
@property (weak ,nonatomic) UIViewController *fromViewController;
@property (weak ,nonatomic) UIView *toView;
@property (weak ,nonatomic) UIView *fromView;
@property (weak ,nonatomic) UIView *containerView;

@property (strong ,nonatomic) DevilIDArray *fvArray;
@property (strong ,nonatomic) DevilIDArray *tvArray;

@property (assign ,nonatomic) CGRect presentFrame;
@property (assign ,nonatomic) CGRect dismissFrame;

@property (weak ,nonatomic) id<UIViewControllerContextTransitioning> context;

@end

@implementation GYTransitionAnimation

- (instancetype)init{
    if (self = [super init]) {
        kTWidth = [UIScreen mainScreen].bounds.size.width;
        kTHeight = [UIScreen mainScreen].bounds.size.height;
        self.tvArray = [DevilIDArray new];
        self.fvArray = [DevilIDArray new];
        self.transitionType = GYTransitionTypeCover;
        self.animationDirection = GYAnimationDirectionBottom;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    [self modalAnimation:transitionContext];
}

/**
 modal动画

 @param transitionContext transitionContext description
 */
- (void)modalAnimation:(id <UIViewControllerContextTransitioning>)transitionContext {
    self.toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if ([transitionContext viewForKey:UITransitionContextFromViewKey] && [transitionContext viewForKey:UITransitionContextToViewKey]) {
        self.toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        self.fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    }else{
        self.toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        self.fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        
    }
    self.containerView = transitionContext.containerView;
    self.context = transitionContext;
    
    [self start];
}

/**
 动画开始了
 */
- (void)start{
    [self checkTransitionType];
}

- (void)viewAnimation:(void(^)(void))animations{
    [UIView animateWithDuration:[self transitionDuration:self.context] animations:^{
        animations();
    }completion:^(BOOL finished) {
        BOOL isCancelled = [self.context transitionWasCancelled];
        [self.context completeTransition:!isCancelled];
    }];
}

/// 判断动画类型
- (void)checkTransitionType{
    switch (self.transitionType) {
        case GYTransitionTypeFade:
            [self fadeAnimation];
            break;
        case GYTransitionTypeZoom:
            [self zoomAnimation];
            break;
        case GYTransitionTypeCover:
        default:
            [self checkAnimationDirection];
            break;
    }
}

/// 设置动画方向  并对动画进行计算
- (void)checkAnimationDirection{
    self.dismissFrame = CGRectMake(0, 0, kTWidth, kTHeight);
    switch (self.animationDirection) {
        case GYAnimationDirectionTop:
            self.presentFrame = CGRectMake(0, -kTHeight, kTWidth, kTHeight);
            break;
        case GYAnimationDirectionLeft:
            self.presentFrame = CGRectMake(-kTWidth, 0, kTWidth, kTHeight);
            break;
        case GYAnimationDirectionBottom:
            self.presentFrame = CGRectMake(0, kTHeight, kTWidth, kTHeight);
            break;
        case GYAnimationDirectionRight:
        default:
            self.presentFrame = CGRectMake(kTWidth, 0, kTWidth, kTHeight);
            break;
    }
    
    [self coverAnimation];
}

/// 滑动动画
- (void)coverAnimation{
    __weak typeof(self) weakObj = self;
    if (_toViewController.beingPresented) {
        [self.containerView addSubview:self.toView];
        self.toView.frame = self.presentFrame;
        [self viewAnimation:^{
            __strong typeof(weakObj) strongObj = weakObj;
            strongObj.toView.frame = strongObj.dismissFrame;
        }];
    }
    if (_fromViewController.beingDismissed) {
        [self.containerView insertSubview:self.toView belowSubview:self.fromView];
        self.fromView.frame = self.dismissFrame;
        [self viewAnimation:^{
            __strong typeof(weakObj) strongObj = weakObj;
            strongObj.fromView.frame = strongObj.presentFrame;
        }];
    }
}

/// 缩放动画
- (void)zoomAnimation{
    __weak typeof(self) weakObj = self;
    if (_toViewController.beingPresented) {
        [self.containerView addSubview:self.toView];
        self.toView.frame = self.containerView.bounds;
        self.toView.transform = CGAffineTransformMakeScale(0.7, 0.7);
        self.toView.alpha = 0;
        [self viewAnimation:^{
            __strong typeof(weakObj) strongObj = weakObj;
            strongObj.toView.alpha = 1;
            strongObj.toView.transform = CGAffineTransformMakeScale(1., 1.);
        }];
    }
    if (_fromViewController.beingDismissed) {
        [self.containerView insertSubview:self.toView belowSubview:self.fromView];
        self.fromView.frame = self.containerView.bounds;
        [self viewAnimation:^{
            __strong typeof(weakObj) strongObj = weakObj;
            strongObj.fromView.transform = CGAffineTransformMakeScale(0.7, 0.7);
            strongObj.fromView.alpha = 0;
        }];
    }
}

/// 渐入渐出动画
- (void)fadeAnimation{
    __weak typeof(self) weakObj = self;
    if (_toViewController.beingPresented) {
        [self.containerView addSubview:self.toView];
        self.toView.frame = self.containerView.bounds;
        self.toView.alpha = 0;
        [self viewAnimation:^{
            __strong typeof(weakObj) strongObj = weakObj;
            strongObj.toView.alpha = 1;
        }];
    }
    if (_fromViewController.beingDismissed) {
        [self.containerView insertSubview:self.toView belowSubview:self.fromView];
        self.fromView.frame = self.containerView.bounds;
        [self viewAnimation:^{
            __strong typeof(weakObj) strongObj = weakObj;
            strongObj.fromView.alpha = 0;
        }];
    }
}

- (void)checkFromHeroIDWithView:(UIView *)superView{
    for (UIView *view in superView.subviews) {
        [self.fvArray addObject:view];
        [self.containerView addSubview:view];
        if (view.subviews.count > 0) {
            [self checkFromHeroIDWithView:view];
        }
    }
}

- (void)checkToViewHeroIDWithView:(UIView *)superView{
    for (UIView *view in superView.subviews) {
        if (view.subviews.count > 0) {
            [self.tvArray addObject:view];
            [self checkToViewHeroIDWithView:view];
        }
    }
}

/// 动画持续时间
/// @param transitionContext transitionContext description
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

#pragma mark - 设置转场动画类型和方向的枚举
- (void)setAnimationDirection:(GYAnimationDirection)animationDirection{
    _animationDirection = animationDirection;
}

- (void)setTransitionType:(GYTransitionType)transitionType{
    _transitionType = transitionType;
}

#pragma mark - 是否内存泄露打印
- (void)dealloc{
    NSLog(@"%@ WILL BE DEALLOC" ,NSStringFromClass(self.class));
}

@end
