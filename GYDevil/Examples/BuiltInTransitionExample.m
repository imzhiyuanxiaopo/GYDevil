//
//  BuiltInTransitionExampleViewController.m
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/10.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "BuiltInTransitionExample.h"

@interface BuiltInTransitionExample ()

@end

@implementation BuiltInTransitionExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [[UIColor alloc] initWithRed:1 green:0.6 blue:0 alpha:1];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
    label.center = self.view.center;
    label.text = @"2";
    label.font = [UIFont systemFontOfSize:200];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)clickBackgroundView{
    [super clickBackgroundView];
}



@end

@interface BuiltInTransitionExample1 ()<UIViewControllerTransitioningDelegate>

@property (strong ,nonatomic) GYTransitionAnimation *transitioning;

@end

@implementation BuiltInTransitionExample1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor alloc] initWithRed:0 green:0.6 blue:1 alpha:1];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
    label.center = self.view.center;
    label.text = @"1";
    label.font = [UIFont systemFontOfSize:200];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (instancetype)init{
    if (self = [super init]) {
        self.transitioning.transitionType = GYTransitionTypeCover;
    }
    return self;
}

- (void)clickBackgroundView{
    BuiltInTransitionExample *vc = BuiltInTransitionExample.new;
    vc.devil.present.transitionType(GYTransitionTypeFade).dismiss.transitionType(GYTransitionTypeZoom);
    [self presentViewController:vc animated:YES completion:nil];
}

@end
