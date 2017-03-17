//
//  CAShapeLayer+ViewMask.h
//  LCYTabbarController
//
//  Created by hu on 2017/3/16.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAShapeLayer (ViewMask)
+ (CAShapeLayer *)createBackMaskLayerWithView:(UIView *)view radiusView:(UIView *)radiusView;
@end
