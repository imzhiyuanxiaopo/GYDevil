//
//  GYMatchViewController.m
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/27.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "GYMatchViewController.h"

static CGFloat kTWidth;
static CGFloat kTHeight;

@interface GYMatchViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *transitionView;

@end

@implementation GYMatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    kTWidth = [UIScreen mainScreen].bounds.size.width;
    kTHeight = [UIScreen mainScreen].bounds.size.height;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.transitionView.layer.cornerRadius = 10;
    self.transitionView.layer.masksToBounds = YES;
    self.transitionView.devil.ID = @"绿色view";
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    self.button.devil.ID = @"黄色button";
    
    
}
- (IBAction)clickButton:(UIButton *)sender {
//    GYMatchViewController1 *vc = GYMatchViewController1.new;
//    [self presentViewController:vc animated:YES completion:nil];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.button.frame = CGRectMake(50, 100, kTWidth - 100, 60);
        self.transitionView.frame = self.view.bounds;
//        self.button.layer.cornerRadius = 0;
        self.transitionView.layer.cornerRadius = 0;
    }];
}

- (void)clickBackgroundView{
    
}

@end

@interface GYMatchViewController1 ()

@property (strong ,nonatomic) UIView *yellowView;

@property (strong ,nonatomic) UIView *greenView;

@end

@implementation GYMatchViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.yellowView];
}

- (UIView *)yellowView{
    if (!_yellowView){
        _yellowView = [[UIView alloc] init];
        _yellowView.frame = CGRectMake(0, 50, kTWidth - 100, 60);
        _yellowView.devil.ID = @"黄色button";
    }
    return _yellowView;
}

@end
