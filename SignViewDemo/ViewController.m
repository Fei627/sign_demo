//
//  ViewController.m
//  SignViewDemo
//
//  Created by gaojianlong on 2016/11/29.
//  Copyright © 2016年 user1. All rights reserved.
//

#import "ViewController.h"
#import "SignViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *signImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(20, 100, 200, 30);
    [btn setTitle:@"签名" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(signAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self.view addSubview:self.signImageView];
}

- (void)signAction {
    SignViewController *signVC = [[SignViewController alloc] init];
    
    __weak ViewController *(weakSelf) = self;
    [signVC setSaveImageBlock:^(UIImage *image) {
        weakSelf.signImageView.image = image;
    }];
    [self.navigationController pushViewController:signVC animated:YES];
}

#pragma mark - 懒加载

- (UIImageView *)signImageView {
    if (!_signImageView) {
        _signImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200)];
        _signImageView.backgroundColor = [UIColor orangeColor];
        _signImageView.contentMode = UIViewContentModeScaleAspectFill;
        _signImageView.clipsToBounds = YES;
        
    }
    return _signImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
