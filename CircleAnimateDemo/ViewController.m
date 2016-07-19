//
//  ViewController.m
//  CircleAnimateDemo
//
//  Created by qiuyu wang on 16/7/18.
//  Copyright © 2016年 qiuyu wang. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ClircleAnimate.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)beginClick:(UIButton *)sender {
    
    ClircleAnimate *circle = [[ClircleAnimate alloc] initWithFrame:CGRectMake(0, 120, 320, 300)];
    [circle setCircleAnimationBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:circle];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor orangeColor];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
