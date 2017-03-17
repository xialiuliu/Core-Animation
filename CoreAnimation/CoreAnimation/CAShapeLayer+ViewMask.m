//
//  CAShapeLayer+ViewMask.m
//  LCYTabbarController
//
//  Created by hu on 2017/3/16.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import "CAShapeLayer+ViewMask.h"

@implementation CAShapeLayer (ViewMask)
//遮盖蒙层
+ (CAShapeLayer *)createBackMaskLayerWithView:(UIView *)view radiusView:(UIView *)radiusView {
    
    CGFloat viewWidth = CGRectGetWidth(view.frame);
    CGFloat viewHeight = CGRectGetHeight(view.frame);
    
    CGFloat radiusViewHeight = CGRectGetHeight(radiusView.frame);
    
    CGPoint point1 = CGPointMake(0.0, 0.0);
    CGPoint point2 = CGPointMake(viewWidth, 0.0);
    CGPoint point3 = CGPointMake(viewWidth, viewHeight-radiusViewHeight/2-1.0);
    CGPoint point4 = CGPointMake(viewWidth/2, viewHeight-1.0);
    CGPoint point5 = CGPointMake(0.0, viewHeight-radiusViewHeight/2-1.0);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    
    [path closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    return layer;
}

@end
