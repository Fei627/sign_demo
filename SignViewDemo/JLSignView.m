//
//  JLSignView.m
//  中转站
//
//  Created by gaojianlong on 2016/11/29.
//  Copyright © 2016年 user1. All rights reserved.
//

#import "JLSignView.h"
#import <QuartzCore/QuartzCore.h>

static CGPoint midpoint(CGPoint p0, CGPoint p1) {
    return (CGPoint) {
        (p0.x + p1.x) / 2.0,
        (p0.y + p1.y) / 2.0
    };
}

@interface JLSignView ()

@end

@implementation JLSignView
{
    UIBezierPath *path;
    CGPoint previousPoint;
}

- (void)commonInit {
    path = [UIBezierPath bezierPath];
    path.lineWidth = 2.0;
    
    // Capture touches
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    pan.maximumNumberOfTouches = pan.minimumNumberOfTouches = 1;
    [self addGestureRecognizer:pan];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) [self commonInit];
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) [self commonInit];
    return self;
}

- (void)erase {
    path = [UIBezierPath bezierPath];
    path.lineWidth = 2.0;
    [self setNeedsDisplay];
}


- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint currentPoint = [pan locationInView:self];
    CGPoint midPoint = midpoint(previousPoint, currentPoint);
    
    if (pan.state == UIGestureRecognizerStateBegan)
    {
        [path moveToPoint:currentPoint];
    }
    else if (pan.state == UIGestureRecognizerStateChanged)
    {
        [path addQuadCurveToPoint:midPoint controlPoint:previousPoint];
    }
    
    previousPoint = currentPoint;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor greenColor] setStroke];
    [path stroke];
}

//将绘制的签名，生成图片传出去
- (void)saveSign:(void(^)(UIImage *image,NSData *imageData))saveImageBlock
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *signImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //    NSData *signImageData = UIImageJPEGRepresentation(signImage, 1.0);
    
    //png格式
    NSData *signImageData = UIImagePNGRepresentation(signImage);
    
    if (saveImageBlock)
    {
        saveImageBlock(signImage,signImageData);
    }
}

@end
