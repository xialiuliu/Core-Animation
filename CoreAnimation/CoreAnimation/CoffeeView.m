//
//  CoffeeView.m
//  LCYTabbarController
//
//  Created by hu on 2017/3/16.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import "CoffeeView.h"
#import "UIImage+view.h"
#import "UIView+Rotate.h"
#import "CAShapeLayer+ViewMask.h"

static CGFloat kWidth = 518.0/2;
static CGFloat kStartAlpha = 0;

@interface CoffeeView ()
@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UIImageView *imageView4;
@property (nonatomic, strong) UIImageView *imageView5;
@property (nonatomic, strong) UIImageView *imageView6;
@property (nonatomic, strong) UIImageView *imageView7;
@property (nonatomic, strong) UIImageView *imageView8;

@property (nonatomic, strong) UIImageView *maskBgImageView; //遮罩层

@property (nonatomic, assign) CGFloat tranformScale;

@end

@implementation CoffeeView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.tranformScale = 0.8;
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.backgroundColor = [UIColor clearColor];
        _bgImageView.clipsToBounds = YES;
        [self addSubview:_bgImageView];
        
        _maskBgImageView = [[UIImageView alloc] init];
        _maskBgImageView.backgroundColor = [UIColor clearColor];
        [self.bgImageView addSubview:_maskBgImageView];
        
        _imageView1 = [[UIImageView alloc] init];
        _imageView1.backgroundColor = [UIColor clearColor];
        _imageView1.image = [UIImage imageNamed:@"img_coffee_1"];
        _imageView1.alpha = kStartAlpha;
        [self.maskBgImageView addSubview:_imageView1];
        
        _imageView2 = [[UIImageView alloc] init];
        _imageView2.backgroundColor = [UIColor clearColor];
        _imageView2.image = [UIImage imageNamed:@"img_coffee_2"];
        _imageView2.alpha = kStartAlpha;
        [self.maskBgImageView addSubview:_imageView2];
        
        _imageView5 = [[UIImageView alloc] init];
        _imageView5.backgroundColor = [UIColor clearColor];
        _imageView5.image = [UIImage imageNamed:@"img_coffee_5"];
        _imageView5.alpha = kStartAlpha;
        [self.maskBgImageView addSubview:_imageView5];
        
        _imageView3 = [[UIImageView alloc] init];
        _imageView3.backgroundColor = [UIColor clearColor];
        _imageView3.image = [UIImage imageNamed:@"img_coffee_3"];
        _imageView3.alpha = kStartAlpha;
        [self.maskBgImageView addSubview:_imageView3];
        
        _imageView6 = [[UIImageView alloc] init];
        _imageView6.backgroundColor = [UIColor clearColor];
        _imageView6.image = [UIImage imageNamed:@"img_coffee_6"];
        _imageView6.alpha = kStartAlpha;
        [self.maskBgImageView addSubview:_imageView6];
        
        _imageView7 = [[UIImageView alloc] init];
        _imageView7.backgroundColor = [UIColor clearColor];
        _imageView7.image = [UIImage imageNamed:@"img_coffee_7"];
        _imageView7.alpha = kStartAlpha;
        [self.maskBgImageView addSubview:_imageView7];
        
        _imageView8 = [[UIImageView alloc] init];
        _imageView8.backgroundColor = [UIColor clearColor];
        _imageView8.image = [UIImage imageNamed:@"img_coffee_8"];
        _imageView8.alpha = kStartAlpha;
        [self.maskBgImageView addSubview:_imageView8];
        
        _imageView4 = [[UIImageView alloc] init];
        _imageView4.backgroundColor = [UIColor clearColor];
        _imageView4.image = [UIImage imageNamed:@"img_coffee_4"];
        _imageView4.alpha = kStartAlpha;
        [self.maskBgImageView addSubview:_imageView4];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    self.bgImageView.frame = bounds;
    
    self.imageView1.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*300.0/2), self.tranformScale*kWidth, self.tranformScale*300.0/2);
    self.imageView1.backgroundColor = [UIColor clearColor];

    self.maskBgImageView.frame = CGRectMake((CGRectGetWidth(self.bgImageView.frame)-self.tranformScale*kWidth)/2, 0, self.tranformScale*kWidth, CGRectGetHeight(self.bgImageView.frame));
    //为涂层增加蒙版  遮盖部分区域 实现无缝动画弹出   http://blog.csdn.net/u013282174/article/details/52188660
    CAShapeLayer *layer = [CAShapeLayer createBackMaskLayerWithView:self.maskBgImageView radiusView:self.imageView1];
    self.maskBgImageView.layer.mask = layer;
    
    self.imageView1.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*300.0/2), self.tranformScale*kWidth, self.tranformScale*300.0/2);
    self.imageView2.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*300.0/2), self.tranformScale*kWidth, self.tranformScale*300.0/2);
    
    self.imageView3.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*431.0/2), self.tranformScale*kWidth, self.tranformScale*431.0/2);
    
    self.imageView4.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*300.0/2), self.tranformScale*kWidth, self.tranformScale*300.0/2);
    
    self.imageView5.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*300.0/2), self.tranformScale*kWidth, self.tranformScale*300.0/2);
    
    self.imageView6.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*431.0/2), self.tranformScale*kWidth, self.tranformScale*431.0/2);
    
    self.imageView7.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*376.0/2), self.tranformScale*kWidth, self.tranformScale*376.0/2);
    
    self.imageView8.frame = CGRectMake((CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2, (CGRectGetHeight(self.maskBgImageView.frame)-self.tranformScale*300.0/2), self.tranformScale*kWidth, self.tranformScale*300.0/2);
}

- (void)startAnimation{
    [self.imageView1 fadeInWithDuration:0.25 delay:0];
    [self.imageView2 fadeInWithDuration:0.25 delay:0.39];
    [self.imageView5 fadeInWithDuration:0.25 delay:0.7];
    
    [self.imageView8 opacityInWithDuration:0 delay:1.05];
    
    CGFloat imageView3CenterX = (CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2+self.tranformScale*kWidth/2;
    CGFloat imageView3CenterBeginY = CGRectGetHeight(self.maskBgImageView.frame)+CGRectGetHeight(self.imageView3.frame)/2;
    CGFloat imageView3CenterEndY = CGRectGetHeight(self.maskBgImageView.frame)-CGRectGetHeight(self.imageView3.frame)+CGRectGetHeight(self.imageView3.frame)/2;
    
    [self.imageView3 showInFromPosition:CGPointMake(imageView3CenterX,imageView3CenterBeginY) toPosition:CGPointMake(imageView3CenterX,imageView3CenterEndY) WithDuration:0.35 delay:1.4];
    CGPoint oldAnchorPoint4 = self.imageView4.layer.anchorPoint;
    self.imageView4.layer.anchorPoint = CGPointMake(0.2027, 0.5);
    [self.imageView4.layer setPosition:CGPointMake(self.imageView4.layer.position.x + self.imageView4.layer.bounds.size.width * (self.imageView4.layer.anchorPoint.x - oldAnchorPoint4.x), self.imageView4.layer.position.y + self.imageView4.layer.bounds.size.height * (self.imageView4.layer.anchorPoint.y - oldAnchorPoint4.y))];
    [self.imageView4 fadeInWithDuration:0.25 delay:1.43];
    
    CGFloat imageView7CenterX = (CGRectGetWidth(self.maskBgImageView.frame)-self.tranformScale*kWidth)/2+self.tranformScale*kWidth/2;
    CGFloat imageView7CenterBeginY = CGRectGetHeight(self.maskBgImageView.frame)+CGRectGetHeight(self.imageView7.frame)/2;
    CGFloat imageView7CenterEndY = CGRectGetHeight(self.maskBgImageView.frame)-CGRectGetHeight(self.imageView7.frame)+CGRectGetHeight(self.imageView7.frame)/2;

    [self.imageView7 showInFromPosition:CGPointMake(imageView7CenterX,imageView7CenterBeginY) toPosition:CGPointMake(imageView7CenterX,imageView7CenterEndY) WithDuration:0.35 delay:1.45];
    
    [self.imageView5 opacityWithDuration:0.25 beginAlpha:1.0 endAlpha:0.0 delay:1.75];
    [self.imageView6 showInZpostion:0.0 toPosition:1.0 WithDuration:0.25 delay:1.8];
}

@end
