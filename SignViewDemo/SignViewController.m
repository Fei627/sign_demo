//
//  SignViewController.m
//  SignViewDemo
//
//  Created by gaojianlong on 2016/11/29.
//  Copyright © 2016年 user1. All rights reserved.
//

#import "SignViewController.h"
#import "JLSignView.h"

@interface SignViewController ()

@property (nonatomic, strong) JLSignView *signView;
@property (nonatomic, strong) UIBarButtonItem *rightBarButton;
@property (nonatomic, strong) UIImageView *signImageView;

@end

@implementation SignViewController

- (void)loadView
{
    [super loadView];
    self.signView = [[JLSignView alloc] initWithFrame:self.view.frame];
    self.signView.backgroundColor = [UIColor whiteColor];
    self.view = self.signView;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    __weak SignViewController *(weakSelf) = self;
    [self.signView saveSign:^(UIImage *image, NSData *imageData) {
        weakSelf.saveImageBlock(image);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"签名";
    self.navigationItem.rightBarButtonItem = self.rightBarButton;
}

- (void)clearAction {
    [self.signView erase];
}

#pragma mark - 懒加载

- (UIBarButtonItem *)rightBarButton {
    if (!_rightBarButton) {
        _rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"清除" style:UIBarButtonItemStylePlain target:self action:@selector(clearAction)];
    }
    return _rightBarButton;
}

- (UIImageView *)signImageView {
    if (!_signImageView) {
        _signImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200)];
        _signImageView.backgroundColor = [UIColor orangeColor];
    }
    return _signImageView;
}


@end
