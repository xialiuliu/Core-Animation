//
//  CenterButton.m
//  Views
//
//  Created by kabda on 15/7/21.
//
//

#import "CenterButton.h"


@interface CenterButton ()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *numberLable;
@end

@implementation CenterButton

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        
        self.imageView.backgroundColor = [UIColor clearColor];
        [self bringSubviewToFront:self.imageView];
        
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        self.titleLabel.numberOfLines = 1;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        _lineView = [[UIView alloc] initWithFrame:CGRectZero];
        _lineView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_lineView];
        
        _numberLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _numberLable.font = [UIFont systemFontOfSize:13];
        _numberLable.textAlignment = NSTextAlignmentCenter;
        _numberLable.lineBreakMode = NSLineBreakByCharWrapping;
        _numberLable.backgroundColor = [UIColor clearColor];
        _numberLable.textColor = [UIColor whiteColor];
        [self addSubview:_numberLable];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    
    CGSize imageSize = CGSizeMake(bounds.size.width*0.30, bounds.size.width*0.25);
    self.imageView.frame = CGRectMake(CGRectGetWidth(bounds)/2 - imageSize.width/2, CGRectGetHeight(bounds)*0.1, imageSize.width, imageSize.height);
    
    CGSize lableSize = CGSizeMake(CGRectGetWidth(bounds)*0.9, CGRectGetWidth(bounds)*0.30);
    self.titleLabel.frame = CGRectMake(CGRectGetWidth(bounds)/2 - lableSize.width/2, CGRectGetMaxY(self.imageView.frame), lableSize.width, lableSize.height);
    
    CGSize lineSize = CGSizeMake(CGRectGetWidth(bounds)*0.8,1);
    self.lineView.frame = CGRectMake(CGRectGetWidth(bounds)/2 - lineSize.width/2, CGRectGetMaxY(self.titleLabel.frame) + CGRectGetHeight(bounds)*0.01, lineSize.width, lineSize.height);
    
    CGSize numberLableSize = CGSizeMake(CGRectGetWidth(bounds)*0.6, CGRectGetMaxY(self.lineView.frame)*0.16);
    self.numberLable.frame = CGRectMake(CGRectGetWidth(bounds)/2 - numberLableSize.width/2, CGRectGetMaxY(self.lineView.frame) + CGRectGetHeight(bounds)*0.05, numberLableSize.width, numberLableSize.height);
}

- (void)setNumber:(NSInteger)number{
    _number= number;
    self.numberLable.text = [NSString stringWithFormat:@"%ld人",(long)number];
}
@end
