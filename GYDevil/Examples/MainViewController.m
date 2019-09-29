//
//  MainViewController.m
//  GYHero
//
//  Created by zhiyuan gao on 2019/7/10.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "MainViewController.h"

#import "BuiltInTransitionExample.h"
#import "GYMatchViewController.h"

#import "GYDevil.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *first;
@property (weak, nonatomic) IBOutlet UIButton *second;
@property (weak, nonatomic) IBOutlet UIButton *third;
@property (weak, nonatomic) IBOutlet UIButton *fourth;
@property (weak, nonatomic) IBOutlet UIButton *fifth;

@end

@implementation UIButton (MainViewController)
- (void)addBorder{
    self.layer.borderColor = [UIColor colorWithWhite:0.7 alpha:1].CGColor;
    self.layer.borderWidth = 0.8;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.first addBorder];
    [self.second addBorder];
    [self.third addBorder];
    [self.fourth addBorder];
}

- (IBAction)clickFirst:(id)sender {
    BuiltInTransitionExample1 *vc = BuiltInTransitionExample1.new;
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)clickMatch:(id)sender {
    GYMatchViewController *vc = GYMatchViewController.new;
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
