//
//  SecondViewController.m
//  CoreAnimation
//
//  Created by hu on 2017/3/17.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import "SecondViewController.h"
#import "FadeView.h"
#import "ItemModel.h"
#import "PuldingView.h"

@interface SecondViewController ()
@property (nonatomic,strong) FadeView *faceView;
@property (nonatomic, strong) PuldingView *puldingView;
@end

@implementation SecondViewController

- (id)init{
    self = [super init];
    if (self) {
        self.title = @"demo2";
        self.view.backgroundColor = [UIColor whiteColor];
        self.hidesBottomBarWhenPushed = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"Animation1",@"stopAnimation2",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(10, 20, CGRectGetWidth(self.view.frame) - 10, 40);
    [segmentedControl addTarget:self action:@selector(didClicksegmentedControlAction:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
    self.faceView = [[FadeView alloc] initWithFrame:CGRectMake(20, 60, CGRectGetWidth(self.view.frame) - 40, CGRectGetWidth(self.view.frame))];
    [self.view addSubview:self.faceView];
    
    self.puldingView = [[PuldingView alloc] initWithFrame:CGRectMake(20, 60, CGRectGetWidth(self.view.frame) - 40, CGRectGetWidth(self.view.frame))];
    [self.view addSubview:self.puldingView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)animation1{
    self.puldingView.hidden = NO;
    self.faceView.hidden = YES;
    
    [self.puldingView startAnimation];
}

- (void)animation2{
    self.puldingView.hidden = YES;
    [self.puldingView stopAnimation];
    
    self.faceView.hidden = NO;
    
    ItemModel *model1 = [[ItemModel alloc] init];
    model1.name = @"111";
    model1.type = 1;
    model1.user = 1;
    
    ItemModel *model2 = [[ItemModel alloc] init];
    model1.name = @"222";
    model1.type = 2;
    model1.user = 2;
    
    ItemModel *model3 = [[ItemModel alloc] init];
    model3.name = @"333";
    model3.type = 3;
    model3.user = 3;
    
    ItemModel *model4 = [[ItemModel alloc] init];
    model4.name = @"444";
    model4.type = 4;
    model4.user = 4;
    
    ItemModel *model5 = [[ItemModel alloc] init];
    model5.name = @"555";
    model5.type = 5;
    model5.user = 5;
    
    ItemModel *model6 = [[ItemModel alloc] init];
    model6.name = @"666";
    model6.type = 6;
    model6.user = 6;
    
    [self.faceView setSceneArray:@[model1,model2,model3,model4,model5,model6] withAnnimation:YES];
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
        default:
            break;
    }
}
@end
