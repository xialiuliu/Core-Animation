//
//  FirstViewController.m
//  CoreAnimation
//
//  Created by hu on 2017/3/17.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic, strong) UIImageView *img1;
@property (nonatomic, strong) UIImageView *img2;
@property (nonatomic, strong) UIImageView *img3;
@property (nonatomic, strong) UIImageView *img4;
@property (nonatomic, strong) UIImageView *img5;

@property (nonatomic, strong) UIImageView *img6;
@property (nonatomic, strong) UIImageView *img7;

@end

@implementation FirstViewController

- (id)init{
    self = [super init];
    if (self) {
        self.title = @"demo1";
        self.view.backgroundColor = [UIColor whiteColor];
        self.hidesBottomBarWhenPushed = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"anima1",@"anima2",@"anima3",@"anima4",@"anima5",@"anima6",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(10, 20, CGRectGetWidth(self.view.frame) - 10, 40);
    [segmentedControl addTarget:self action:@selector(didClicksegmentedControlAction:)forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
    
    self.img1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 64, 400, 100)];
    self.img1.image = [UIImage imageNamed:@"1.png"];
    [self.view addSubview:self.img1];
    
    self.img2 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 10, 40, 20)];
    self.img2.image = [UIImage imageNamed:@"2"];
    [self.img1 addSubview:self.img2];
    
    self.img3 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 40, 20)];
    self.img3.image = [UIImage imageNamed:@"2"];
    [self.img1 addSubview:self.img3];
    
    self.img4 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 180, 200, 200)];
    self.img4.image = [UIImage imageNamed:@"3.png"];
    [self.view addSubview:self.img4];
    
    self.img5 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 30, 40, 20)];
    self.img5.image = [UIImage imageNamed:@"2"];
    [self.img4 addSubview:self.img5];
    
    self.img6 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 390, 200, 200)];
    self.img6.image = [UIImage imageNamed:@"4"];
    [self.view addSubview:self.img6];
    
    self.img7 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 390, 200, 200)];
    self.img7.image = [UIImage imageNamed:@"5"];
    [self.view addSubview:self.img7];
}

- (void)animation1{
    CABasicAnimation *animation = [CABasicAnimation animation];
    //请注意我们要动画的键路径，也就是 position.x，实际上包含一个存储在 position 属性中的 CGPoint 结构体成员。这是 Core Animation 一个非常方便的特性。http://www.jianshu.com/writer#/notebooks/10847029/notes/10179638/preview
    //https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html
    animation.keyPath = @"position.x";
    animation.fromValue = @40;
    animation.toValue = @300;
    animation.duration = 1;
    animation.repeatCount = 1;
    
    //时间函数
    //    Core Animation 附带了一些 linear 之外的内置 easing 函数，如：
    //    Ease in (kCAMediaTimingFunctionEaseIn):
    //    Ease out (kCAMediaTimingFunctionEaseOut):
    //    Ease in ease out (kCAMediaTimingFunctionEaseInEaseOut):
    //    默认 (kCAMediaTimingFunctionDefault):
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //然而，当我们运行该代码时，我们意识到火箭在完成动画后马上回到了初始位置。这是因为在默认情况下，动画不会在超出其持续时间后还修改 presentation layer。实际上，在结束时它甚至会被彻底移除。
    
    //一旦动画被移除，presentation layer 将回到 model layer 的值，并且因为我们从未修改该 layer 的 position 属性，所以我们的飞船将重新出现在它开始的地方。
    [self.img2.layer addAnimation:animation forKey:@"basic"];
}

- (void)animation2{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @40;
    animation.toValue = @450;
    animation.duration = 1;
    animation.repeatCount = 1;
    //留在最终状态
    animation.fillMode = kCAFillModeForwards;
    //防止它被自动移除    ps:如果将已完成的动画保持在 layer 上时，会造成额外的开销，因为渲染器会去进行额外的绘画工作
    animation.removedOnCompletion = NO;
    
    [self.img2.layer addAnimation:animation forKey:@"basic"];
}

//实际上我们创建的动画对象在被添加到 layer 时立刻就复制了一份。这个特性在多个 view 中重用动画时这非常有用。比方说我们想要第二个火箭在第一个火箭起飞不久后起飞：
- (void)animation3{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @40;
    animation.toValue = @450;
    animation.duration = 1;
    animation.repeatCount = 1;
    //留在最终状态
    animation.fillMode = kCAFillModeForwards;
    //防止它被自动移除
    animation.removedOnCompletion = NO;
    
    [self.img2.layer addAnimation:animation forKey:@"basic"];
    //设置动画的 beginTime 为未来 0.5 秒将只会影响 rocket2，因为动画在执行语句 [rocket1.layer addAnimation:animation forKey:@"basic"]; 时已经被复制了，并且之后 rocket1 也不会考虑对动画对象的改变。
    animation.beginTime = CACurrentMediaTime() + 0.5;
    [self.img3.layer addAnimation:animation forKey:@"basic"];
}

//多步动画 CAKeyframeAnimation
- (void)animation4{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    //应该到哪些位置
    animation.values = @[@0,@10,@-10,@10,@0];
    //指定关键帧动画发生的时间。它们被指定为关键帧动画总持续时间的一个分数。
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    //Core Animation 在更新 presentation layer 之前将动画的值添加到 model layer 中去。这使我们能够对所有形式的需要更新的元素重用相同的动画，且无需提前知道它们的位置。因为这个属性从 CAPropertyAnimation 继承，所以你也可以在使用 CABasicAnimation 时使用它。
    animation.additive = YES;
    
    [self.img1.layer addAnimation:animation forKey:@"basic"];
}

//沿路径的动画
- (void)animation5{
    CGRect boundingRect = CGRectMake(-40, -20, 150, 150);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    //创建一个圆形的 CGPath
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    //calculationMode 是控制关键帧动画时间的另一种方法。我们通过将其设置为 kCAAnimationPaced，让 Core Animation 向被驱动的对象施加一个恒定速度，不管路径的各个线段有多长。将其设置为 kCAAnimationPaced 将无视所有我们已经设置的 keyTimes。
    orbit.calculationMode = kCAAnimationPaced;
    //确保飞船沿着路径旋转
    orbit.rotationMode = kCAAnimationRotateAuto;
    //    orbit.rotationMode = nil;
    
    [self.img5.layer addAnimation:orbit forKey:@"orbit"];
}

//组合动画
- (void)animation6{
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    zPosition.fromValue = @-1;
    zPosition.toValue = @1;
    zPosition.duration = 1.2;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[ @0, @0.14, @0 ];
    rotation.duration = 1.2;
    rotation.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[
                        [NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(110, -20)],
                        [NSValue valueWithCGPoint:CGPointZero]
                        ];
    position.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    position.additive = YES;
    position.duration = 1.2;
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    //对于某些复杂的效果，可能需要同时为多个属性进行动画 如我们需要同时对图片的 position，rotation 和 z-position 进行动画
    CAAnimationGroup *animationGroup;
    animationGroup = [CAAnimationGroup animation];
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = defaultCurve;
    animationGroup.fillMode = kCAFillModeBoth;
    //beginTime 非常重要
    animationGroup.beginTime = CACurrentMediaTime() + 1;
    animationGroup.duration = 1.2;
    
    NSArray *animations = @[zPosition, position,rotation];
    
    animationGroup.animations = animations;
    
    [self.img6.layer addAnimation:animationGroup forKey:@"fadeOut"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClicksegmentedControlAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index) {
        case 0:
            [self animation1];
            break;
        case 1:
            [self animation2];
            break;
        case 2:
            [self animation3];
            break;
        case 3:
            [self animation4];
            break;
        case 4:
            [self animation5];
            break;
        case 5:
            [self animation6];
            break;
        default:
            break;
    }
}

@end
