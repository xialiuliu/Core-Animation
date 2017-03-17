//
//  ThirdViewController.m
//  CoreAnimation
//
//  Created by hu on 2017/3/17.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import "ThirdViewController.h"
#import "CoffeeView.h"

@interface ThirdViewController ()
@property (nonatomic, strong) CoffeeView *coffeeView;
@end

@implementation ThirdViewController

- (void)awakeFromNib{
    [super awakeFromNib];
    
    UIButton *item = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    item.frame = CGRectMake(100, 120, 90, 40);
    [item setTitle:@"Click Here" forState:UIControlStateNormal];
    [item addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:item];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.coffeeView = [[CoffeeView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    [self.view addSubview:self.coffeeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click{
    [self.coffeeView startAnimation];
}

@end
