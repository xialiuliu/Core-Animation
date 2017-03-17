//
//  FadeVIew.h
//  LCYTabbarController
//
//  Created by hu on 2017/3/15.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FadeView;

@protocol FadeViewDelegate <NSObject>
- (void)fadeView:(FadeView *)locationView didSelectItemAtIndex:(NSInteger)index;
@end

@interface FadeView : UIScrollView
@property (nonatomic, strong) NSArray *scenseArray;
@property (nonatomic, weak) id <FadeViewDelegate> locationDelegate;

- (void)setSceneArray:(NSArray *)sceneArray withAnnimation:(BOOL)annimated;
@end
