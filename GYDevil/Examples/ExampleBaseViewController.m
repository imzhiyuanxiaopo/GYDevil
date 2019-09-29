//
//  BuiltInTransitionExample.m
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/10.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "ExampleBaseViewController.h"

@interface ExampleBaseViewController ()

@property (strong ,nonatomic) UIButton *backButton;

@end

@implementation ExampleBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backButton];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBackgroundView)];
    [self.view addGestureRecognizer:gesture];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)clickBackgroundView{
    NSLog(@"点击背景视图");
    [self back];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, 100, 50)];
        [_backButton setTitle:@"back" forState:UIControlStateNormal];
        _backButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_backButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (void)dealloc{
    NSLog(@"%@ WILL BE DEALLOC" ,NSStringFromClass(self.class));
}

@end
