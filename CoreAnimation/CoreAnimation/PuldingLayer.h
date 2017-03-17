//
//  PuldingLayer.h
//  Views
//
//  Created by kabda on 15/7/23.
//
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface PuldingLayer : CALayer
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) NSTimeInterval animationDuration;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, assign) CGColorRef color;
@property (nonatomic, assign) BOOL gradient;

- (void)startAnimation;
- (void)stopAnimation;
@end
