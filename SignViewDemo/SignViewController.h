//
//  SignViewController.h
//  SignViewDemo
//
//  Created by gaojianlong on 2016/11/29.
//  Copyright © 2016年 user1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignViewController : UIViewController

@property (nonatomic , copy) void(^saveImageBlock)(UIImage *image);

@end
