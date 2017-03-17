//
//  PuldingView.m
//  Views
//
//  Created by kabda on 15/7/23.
//
//

#import "PuldingView.h"
#import "PuldingLayer.h"
#import "UIView+Rotate.h"

static const CGFloat BEACONSIZE = 105;
static const CGFloat CENTERSIZE = 95;
static const CGFloat PULDINGCOUNT = 3;

@interface PuldingView ()
@property (nonatomic, strong) UIImageView *beaconView;
@property (nonatomic, strong) UIImageView *centerImageView;
@end

@implementation PuldingView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _beaconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _beaconView.image = [UIImage imageNamed:@"ic_pulding_progress"];
        [self addSubview:self.beaconView];
        
        _centerImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _centerImageView.image = [UIImage imageNamed:@"ic_pulding_loc"];
        [self addSubview:_centerImageView];
        _centerImageView.center = self.center;
        
        for (int i=0; i<PULDINGCOUNT; i++) {
            PuldingLayer *pulsing = [[PuldingLayer alloc] init];

            if (i == 0) {
                pulsing.backgroundColor = [UIColor clearColor].CGColor;
                pulsing.radius = 220;
                pulsing.animationDuration = 2;
                pulsing.width = 1;
//                pulsing.delay = 0.2;
                pulsing.color = [UIColor orangeColor].CGColor;
                pulsing.gradient = NO;
            }
            if (i == 1) {
                pulsing.backgroundColor = [UIColor orangeColor].CGColor;
                pulsing.animationDuration = 2;
                pulsing.gradient = NO;
            }
            if (i == 2) {
                pulsing.backgroundColor = [UIColor whiteColor].CGColor;
                pulsing.animationDuration = 1;
                pulsing.gradient = NO;
            }
            
            [self.layer insertSublayer:pulsing below:self.beaconView.layer];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _beaconView.bounds = CGRectMake(0, 0, BEACONSIZE, BEACONSIZE);
    _beaconView.center = self.center;

    _centerImageView.bounds = CGRectMake(0, 0, CENTERSIZE, CENTERSIZE);
    _centerImageView.center = self.center;
    
    for (PuldingLayer *layer in self.layer.sublayers){
        layer.position = self.center;
    }
}

- (void)startAnimation{
    [self.beaconView rotate360WithDuration:1.5 repeatCount:MAX_CANON];

    for (CALayer *layer in self.layer.sublayers){
        if ([layer isKindOfClass:[PuldingLayer class]]) {
            [(PuldingLayer *)layer startAnimation];
        }
    }
}

- (void)stopAnimation{
    [self.beaconView stopAnimating];
    
    for (CALayer *layer in self.layer.sublayers){
        if ([layer isKindOfClass:[PuldingLayer class]]) {
            [(PuldingLayer *)layer stopAnimation];
        }
    }
}
@end
