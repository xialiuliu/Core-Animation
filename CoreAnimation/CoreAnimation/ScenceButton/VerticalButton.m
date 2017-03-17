//
//  VerticalButton.m
//  Views
//
//  Created by kabda on 15/7/21.
//
//

#import "VerticalButton.h"

static const CGFloat Pading = 3;

@implementation VerticalButton

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.imageView.backgroundColor = [UIColor clearColor];
        
        _typeImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_typeImage];
        
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    
    CGSize imageSize = CGSizeMake(bounds.size.width*0.68, bounds.size.width*0.68);
    self.imageView.frame = CGRectMake(CGRectGetWidth(bounds)/2 - imageSize.width/2, 0, imageSize.width, imageSize.height);
    
    NSDictionary *attributes = @{NSFontAttributeName: self.titleLabel.font};
    CGSize lableSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(bounds), CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil].size;
    
    self.titleLabel.frame = CGRectMake(CGRectGetWidth(bounds)/2 - lableSize.width/2, CGRectGetMaxY(self.imageView.frame) + Pading, lableSize.width, lableSize.height);
    
    CGSize typeImageSize = CGSizeMake(imageSize.width*0.5,imageSize.height*0.5);
    self.typeImage.bounds = CGRectMake(0, 0, typeImageSize.width, typeImageSize.height);
    self.typeImage.center = self.imageView.center;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self setNeedsDisplay];
}
@end
