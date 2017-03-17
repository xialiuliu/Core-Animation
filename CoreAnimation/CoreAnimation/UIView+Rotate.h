//
//  UIView+Rotate.h
//  Views
//
//  Created by kabda on 15/7/27.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Rotate)
- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount;
- (void)fadeInWithDuration:(CGFloat)aDuration delay:(NSTimeInterval)delay;
- (void)opacityInWithDuration:(CGFloat)aDuration delay:(NSTimeInterval)delay;
- (void)showInFromPosition:(CGPoint)from toPosition:(CGPoint)to WithDuration:(CGFloat)aDuration delay:(NSTimeInterval)delay;
- (void)opacityWithDuration:(CGFloat)aDuration beginAlpha:(CGFloat)beginAlpha endAlpha:(CGFloat)endAlpha delay:(NSTimeInterval)delay;
- (void)showInZpostion:(CGFloat)from toPosition:(CGFloat)to WithDuration:(CGFloat)aDuration delay:(NSTimeInterval)delay;
@end
