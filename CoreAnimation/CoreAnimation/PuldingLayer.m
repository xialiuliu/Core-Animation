//
//  PuldingLayer.m
//  Views
//
//  Created by kabda on 15/7/23.
//
//

#import "PuldingLayer.h"

@interface PuldingLayer ()
@property (nonatomic, strong) CAAnimationGroup *animationGroup;
@end

@implementation PuldingLayer
- (id)init{
    self = [super init];
    if (self) {
//        self.opacity = 0;
//        self.backgroundColor = [UIColor grayColor].CGColor;
        self.radius = 150;
        self.width = 0;
        self.animationDuration = 2;
        self.color = [UIColor grayColor].CGColor;

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            [self setupAnimationGroup];
        });
    }
    return self;
}

- (void)setRadius:(CGFloat)radius {
    
    _radius = radius;
    
    CGPoint tempPos = self.position;
    
    CGFloat diameter = self.radius * 2;
    
    self.bounds = CGRectMake(0, 0, diameter, diameter);
    self.cornerRadius = self.radius;
    self.borderColor = self.color;
    self.position = tempPos;
}

- (void)setWidth:(CGFloat)width{
    _width = width;
    self.borderWidth = self.width;
}

- (void)setColor:(CGColorRef)color{
    _color = color;
    self.borderColor = color;
}

- (void)setDelay:(NSTimeInterval)delay{
    _delay = delay;
}

- (void)setAnimationDuration:(NSTimeInterval)animationDuration{
    _animationDuration = animationDuration;
}

- (void)setGradient:(BOOL)gradient{
    _gradient = gradient;
}

- (void)setupAnimationGroup {
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    self.animationGroup = [CAAnimationGroup animation];
    self.animationGroup.duration = self.animationDuration;
    self.animationGroup.repeatCount = INFINITY;
    self.animationGroup.removedOnCompletion = NO;
    self.animationGroup.timingFunction = defaultCurve;
    self.animationGroup.beginTime = CACurrentMediaTime() + self.delay;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @0.3;
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = self.animationDuration;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = self.animationDuration;
    opacityAnimation.values = @[@1.0,@0.1];
    opacityAnimation.keyTimes = @[@0,@1];
    opacityAnimation.timingFunction =  [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    opacityAnimation.removedOnCompletion = NO;
    
    NSMutableArray *animations = [[NSMutableArray alloc] init];
    [animations addObject:scaleAnimation];
    if (self.gradient) {
        [animations addObject:opacityAnimation];
    }
    
    self.animationGroup.animations = [NSArray arrayWithArray:animations];
}

- (void)startAnimation{
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self addAnimation:self.animationGroup forKey:@"pulse"];
    });
}

- (void)stopAnimation{
    [self removeAnimationForKey:@"pulse"];
}
@end
