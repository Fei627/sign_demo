//
//  JLSignView.h
//  中转站
//
//  Created by gaojianlong on 2016/11/29.
//  Copyright © 2016年 user1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLSignView : UIView

/** 清除签名*/
- (void)erase;
/** 回传签名图片*/
- (void)saveSign:(void(^)(UIImage *image,NSData *imageData))saveImageBlock;

@end
