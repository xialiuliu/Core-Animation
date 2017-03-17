//
//  ItemModel.h
//  LCYTabbarController
//
//  Created by hu on 2017/3/15.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger user;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger coupon;
@property (nonatomic, strong) NSNumber *has_menu;

@end
