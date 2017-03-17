//
//  FadeVIew.m
//  LCYTabbarController
//
//  Created by hu on 2017/3/15.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import "FadeView.h"
#import "VerticalButton.h"
#import "HorizontalButton.h"
#import "CenterButton.h"
#import "ItemModel.h"
#import "UIImage+view.h"
#import "UIView+Rotate.h"

@interface FadeView ()
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) CenterButton *centerButton;
@property (nonatomic, strong) VerticalButton *scenceButton1;
@property (nonatomic, strong) HorizontalButton *scenceButton2;
@property (nonatomic, strong) VerticalButton *scenceButton3;
@property (nonatomic, strong) HorizontalButton *scenceButton4;
@property (nonatomic, strong) HorizontalButton *scenceButton5;
@property (nonatomic, strong) HorizontalButton *scenceButton6;

@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation FadeView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _buttonArray = [NSMutableArray array];
        
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _backImageView.image = [UIImage imageNamed:@"loc_bg"];
        _backImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backImageView.userInteractionEnabled = YES;
        [self addSubview:_backImageView];
        
        _backView = [[UIView alloc] initWithFrame:CGRectZero];
        _backView.backgroundColor = [UIColor clearColor];
        [_backImageView addSubview:_backView];
        
        _centerButton = [[CenterButton alloc] initWithFrame:CGRectZero];
        [_centerButton setBackgroundImage:[UIImage imageNamed:@"loc_big_blue"] forState:UIControlStateNormal];
        [_centerButton setImage:[UIImage imageNamed:@"ic_location_small"] forState:UIControlStateNormal];
        [_centerButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_centerButton];
        _centerButton.tag = 0;
        _centerButton.alpha = 0;
        
        _scenceButton1 = [[VerticalButton alloc] initWithFrame:CGRectZero];
        [_scenceButton1 setImage:[UIImage imageNamed:@"loc_circle_white"] forState:UIControlStateNormal];
        [_scenceButton1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_scenceButton1];
        _scenceButton1.tag = 1;
        [_buttonArray addObject:_scenceButton1];
        _scenceButton1.alpha = 0;
        
        _scenceButton2 = [[HorizontalButton alloc] initWithFrame:CGRectZero];
        [_scenceButton2 setImage:[UIImage imageNamed:@"loc_map_white"] forState:UIControlStateNormal];
        [_scenceButton2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_scenceButton2];
        _scenceButton2.tag = 2;
        [_buttonArray addObject:_scenceButton2];
        _scenceButton2.alpha = 0;
        
        _scenceButton3 = [[VerticalButton alloc] initWithFrame:CGRectZero];
        [_scenceButton3 setImage:[UIImage imageNamed:@"loc_circle_white"] forState:UIControlStateNormal];
        [_scenceButton3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_scenceButton3];
        _scenceButton3.tag = 3;
        [_buttonArray addObject:_scenceButton3];
        _scenceButton3.alpha = 0;
        
        _scenceButton4 = [[HorizontalButton alloc] initWithFrame:CGRectZero];
        [_scenceButton4 setImage:[UIImage imageNamed:@"loc_map_blue"] forState:UIControlStateNormal];
        [_scenceButton4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_scenceButton4];
        _scenceButton4.tag = 4;
        [_buttonArray addObject:_scenceButton4];
        _scenceButton4.alpha = 0;
        
        _scenceButton5 = [[HorizontalButton alloc] initWithFrame:CGRectZero];
        [_scenceButton5 setImage:[UIImage imageNamed:@"loc_map_blue"] forState:UIControlStateNormal];
        [_scenceButton5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_scenceButton5];
        _scenceButton5.tag = 5;
        [_buttonArray addObject:_scenceButton5];
        _scenceButton5.alpha = 0;
        
        _scenceButton6 = [[HorizontalButton alloc] initWithFrame:CGRectZero];
        [_scenceButton6 setImage:[UIImage imageNamed:@"loc_map_blue"] forState:UIControlStateNormal];
        [_scenceButton6 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:_scenceButton6];
        _scenceButton6.tag = 6;
        [_buttonArray addObject:_scenceButton6];
        _scenceButton6.alpha = 0;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    _backImageView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height-1 + 200);
    
    CGRect backViewBounds = CGRectMake(0, 0, bounds.size.width, bounds.size.width);
    _backView.bounds = backViewBounds;
    _backView.center = self.center;
    
    CGFloat width =  CGRectGetWidth(backViewBounds);
    CGFloat height = CGRectGetHeight(backViewBounds);
    
    _centerButton.bounds = CGRectMake(0, 0, width/3, width/3);
    _centerButton.center = CGPointMake(width/2, height*0.40);
    
    CGRect scenceButton1Frame = CGRectMake(width*0.11, height*0.40, width*0.22, height*0.24);
    _scenceButton1.frame = scenceButton1Frame;
    
    CGRect scenceButton2Frame = CGRectMake(width*0.55, height*0.57, width*0.36, height*0.16);
    _scenceButton2.frame = scenceButton2Frame;
    
    CGRect scenceButton3Frame = CGRectMake(width*0.68, height*0.06, width*0.22, height*0.24);
    _scenceButton3.frame = scenceButton3Frame;
    
    CGRect scenceButton4Frame = CGRectMake(width*0.1, height*0.0, width*0.36, height*0.16);
    _scenceButton4.frame = scenceButton4Frame;
    
    CGRect scenceButton5Frame = CGRectMake(width*0.08, height*0.74, width*0.36, height*0.16);
    _scenceButton5.frame = scenceButton5Frame;
    
    CGRect scenceButton6Frame = CGRectMake(width*0.62, height*0.80, width*0.36, height*0.16);
    _scenceButton6.frame = scenceButton6Frame;
}

- (void)setSceneArray:(NSMutableArray *)sceneArray withAnnimation:(BOOL)annimated{
    self.scenseArray = sceneArray;
    for (ItemModel *shopModel in self.scenseArray) {
        NSInteger index = [_scenseArray indexOfObjectIdenticalTo:shopModel];
        
        if (index == 0) {
            [_centerButton setTitle:shopModel.name forState:UIControlStateNormal];
            _centerButton.number = shopModel.user;
            if (annimated) {
                [_centerButton fadeInWithDuration:0.8 delay:0];
            }
            _centerButton.alpha = 1;
        }else{
            if (index > self.buttonArray.count) {
                return;
            }
            
            if ([[self.buttonArray objectAtIndex:index - 1] isKindOfClass:[VerticalButton class]]) {
                VerticalButton *button = [self.buttonArray objectAtIndex:index - 1];
                button.typeImage.image = [UIImage imageWithSceneBlueType:shopModel.type];
                [button setTitle:shopModel.name forState:UIControlStateNormal];
                if (annimated) {
                    [button fadeInWithDuration:0.5 delay:button.tag*0.1];
                }
                button.alpha = 1;
            }
            if ([[self.buttonArray objectAtIndex:index - 1] isKindOfClass:[HorizontalButton class]]) {
                HorizontalButton *button = [self.buttonArray objectAtIndex:index - 1];
                button.typeImage.image = [UIImage imageWithSceneWhiteType:shopModel.type];
                if (button.tag == 2) {
                    button.typeImage.image = [UIImage imageWithSceneBlueType:shopModel.type];
                }
                [button setTitle:shopModel.name forState:UIControlStateNormal];
                if (annimated) {
                    [button fadeInWithDuration:0.5 delay:button.tag*0.1];
                }
                button.alpha = 1;
            }
        }
    }
}

- (void)buttonClicked:(UIButton *)sender{
    if (_locationDelegate && [_locationDelegate respondsToSelector:@selector(fadeView:didSelectItemAtIndex:)]) {
        [_locationDelegate fadeView:self didSelectItemAtIndex:sender.tag];
    }
}

@end
