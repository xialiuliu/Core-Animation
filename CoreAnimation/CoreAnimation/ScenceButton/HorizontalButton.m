//
//  HorizontalButton.m
//  Views
//
//  Created by kabda on 15/7/21.
//
//

#import "HorizontalButton.h"

static const CGFloat Pading = 3;

@implementation HorizontalButton
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _typeImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.imageView addSubview:_typeImage];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.imageView.backgroundColor = [UIColor clearColor];
        self.titleLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    
    CGSize imageSize = CGSizeMake(bounds.size.width*0.36, bounds.size.height);
    self.imageView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    
    CGSize lableSize = CGSizeMake(CGRectGetWidth(bounds) - CGRectGetMaxX(self.imageView.frame),CGRectGetHeight(self.imageView.frame));
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + Pading, CGRectGetMinY(self.imageView.frame), lableSize.width, lableSize.height);
    
    CGSize typeImageSize = CGSizeMake(imageSize.width*0.5,imageSize.width*0.5);
    self.typeImage.bounds = CGRectMake(0, 0, typeImageSize.width, typeImageSize.height);
    self.typeImage.center = CGPointMake(self.imageView.center.x, self.imageView.center.y*0.8);
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim{
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
}
@end
