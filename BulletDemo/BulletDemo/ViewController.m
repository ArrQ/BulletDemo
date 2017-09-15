//
//  ViewController.m
//  BulletDemo
//
//  Created by ArrQ on 2017/9/16.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "ViewController.h"

#import "BulletManager.h"
#import "BulletView.h"
@interface ViewController ()


@property(nonatomic,strong) BulletManager *manager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.manager = [[BulletManager alloc]init];
    
    __weak typeof (self) weakSelf =self;
    
self.manager.generateViewBlock = ^(BulletView *view) {
  
    [weakSelf addBulletView:view];
    
    
};
    
    
    
    
    
    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    button_.frame = CGRectMake(100, 100, 100, 40);
    [button_ setTitle:@"加入" forState:UIControlStateNormal];
    button_.titleLabel.font = [UIFont systemFontOfSize:14];
    button_.layer.masksToBounds = YES;
    button_.layer.cornerRadius = 5;
    
    button_.layer.borderWidth = 1.f;
    button_.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_ setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    
    [button_ addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_];
    

    
    
    
    
    
}


- (void)btnOnClick{

    [self.manager strat];
    
    

}



- (void)addBulletView:(BulletView *)view{


    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    view.frame = CGRectMake(width, 300 + view.trajectory *40, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
    
    [self.view addSubview:view];
    
    
    [view startAnimation];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
