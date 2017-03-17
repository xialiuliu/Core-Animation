//
//  UIView+Rotate.m
//  Views
//
//  Created by kabda on 15/7/27.
//
//

#import "UIView+Rotate.h"

@implementation UIView (Rotate)
//转圈圈
- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount{
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 3.0];
        rotationAnimation.duration = aDuration;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = aRepeatCount;
        rotationAnimation.removedOnCompletion = NO;
        [self.layer addAnimation:rotationAnimation
                                     forKey:@"rotationAnimation"];
}

//动画组 从小变大 伴随透明度变化
- (void)fadeInWithDuration:(CGFloat)aDuration delay:(NSTimeInterval)delay{
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    //对于某些复杂的效果，可能需要同时为多个属性进行动画 如我们需要同时对图片的 position，rotation 和 z-position 进行动画
    CAAnimationGroup *animationGroup;
    animationGroup = [CAAnimationGroup animation];
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = defaultCurve;
    animationGroup.fillMode = kCAFillModeBoth;
    animationGroup.beginTime = CACurrentMediaTime() + delay;
    animationGroup.duration = aDuration;
    
    //CAKeyframeAnimation 提供关键帧动画  这是xy坐标
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.xy"];
    //从小变大
    scaleAnimation.values = @[@0.0,@1.0];
    //时间变化
    scaleAnimation.keyTimes = @[@0,@1.0];
    
    //透明度变化
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@0,@0.3,@1];
    opacityAnimation.keyTimes = @[@0,@0.5,@1];
    opacityAnimation.timingFunction =  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    opacityAnimation.removedOnCompletion = NO;
    //组合动画
    NSArray *animations = @[scaleAnimation, opacityAnimation];
    
    animationGroup.animations = animations;
    
    [self.layer addAnimation:animationGroup forKey:@"fadeOut"];
}
//渐现  透明度
- (void)opacityInWithDuration:(CGFloat)aDuration delay:(NSTimeInterval)delay {
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@0,@1.0];
    opacityAnimation.keyTimes = @[@0,@1.0];
    opacityAnimation.timingFunction =  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    opacityAnimation.removedOnCompletion = NO;
    opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.beginTime = CACurrentMediaTime() + delay;
    opacityAnimation.duration = aDuration;

    [self.layer addAnimation:opacityAnimation forKey:@"opacityIn"];
}

//小飞机飞出效果
- (void)showInFromPosition:(CGPoint)from toPosition:(CGPoint)to WithDuration:(CGFloat)aDuration delay:(NSTimeInterval)delay {
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup *animationGroup;
    animationGroup = [CAAnimationGroup animation];
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = defaultCurve;
    animationGroup.fillMode = kCAFillModeBoth;
    animationGroup.beginTime = CACurrentMediaTime() + delay;
    animationGroup.duration = aDuration;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:from];
    animation.toValue = [NSValue valueWithCGPoint:to]; // 终了帧
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@1,@1];
    opacityAnimation.keyTimes = @[@0,@1];
    opacityAnimation.timingFunction =  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    opacityAnimation.removedOnCompletion = NO;
    
    NSArray *animations = @[animation,opacityAnimation];
    
    animationGroup.animations = animations;
    
    [self.layer addAnimation:animationGroup forKey:@"showInPosition"];
}

- (void)opacityWithDuration:(CGFloat)aDuration beginAlpha:(CGFloat)beginAlpha endAlpha:(CGFloat)endAlpha delay:(NSTimeInterval)delay {
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup *animationGroup;
    animationGroup = [CAAnimationGroup animation];
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = defaultCurve;
    animationGroup.fillMode = kCAFillModeBoth;
    animationGroup.beginTime = CACurrentMediaTime() + delay;
    animationGroup.duration = aDuration;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@(beginAlpha),@(endAlpha)];
    opacityAnimation.keyTimes = @[@0.0,@1.0];
    opacityAnimation.timingFunction =  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    opacityAnimation.removedOnCompletion = NO;
    
    NSArray *animations = @[opacityAnimation];
    
    animationGroup.animations = animations;
    
    [self.layer addAnimation:animationGroup forKey:@"opacityOut"];
}

- (void)showInZpostion:(CGFloat)from toPosition:(CGFloat)to WithDuration:(CGFloat)aDuration delay:(NSTimeInterval)delay {
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup *animationGroup;
    animationGroup = [CAAnimationGroup animation];
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = defaultCurve;
    animationGroup.fillMode = kCAFillModeBoth;
    animationGroup.beginTime = CACurrentMediaTime() + delay;
    animationGroup.duration = aDuration;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"zPosition"];
    animation.fromValue = @(from);
    animation.toValue = @(to); // 终了帧
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@0,@1];
    opacityAnimation.keyTimes = @[@0,@1];
    opacityAnimation.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    opacityAnimation.removedOnCompletion = NO;
    
    NSArray *animations = @[animation,opacityAnimation];
    
    animationGroup.animations = animations;
    
    [self.layer addAnimation:animationGroup forKey:@"showInZpostion"];
}

@end
