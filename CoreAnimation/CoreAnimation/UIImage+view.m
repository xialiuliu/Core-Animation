
#import "UIImage+view.h"

@implementation UIImage (view)

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [UIImage imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)imageWithSceneType:(NSInteger)type {
    switch (type) {
        case 1: {
            return [UIImage imageNamed:@"ic_scene_class_eat"];
        }
        case 2: {
            return [UIImage imageNamed:@"ic_scene_class_hotel"];
        }
        case 3: {
            return [UIImage imageNamed:@"ic_scene_class_bar"];
        }
        case 4: {
            return [UIImage imageNamed:@"ic_scene_class_cinema"];
        }
        case 5: {
            return [UIImage imageNamed:@"ic_scene_class_office"];
        }
        case 6: {
            return [UIImage imageNamed:@"ic_scene_class_shopping"];
        }
        case 7: {
            return [UIImage imageNamed:@"ic_scene_class_coffee"];
        }
        case 8: {
            return [UIImage imageNamed:@"ic_scene_class_relax"];
        }
        case 9: {
            return [UIImage imageNamed:@"ic_scene_class_community"];
        }
        case 10: {
            return [UIImage imageNamed:@"ic_scene_class_bodycare"];
        }
        case 11: {
            return [UIImage imageNamed:@"ic_scene_class_tea"];
        }
        case 12: {
            return [UIImage imageNamed:@"ic_scene_class_ktv"];
        }
        case 13: {
            return [UIImage imageNamed:@"ic_scene_class_school"];
        }
        case 14: {
            return [UIImage imageNamed:@"ic_scene_class_culture"];
        }
        case 15: {
            return [UIImage imageNamed:@"ic_scene_class_sport"];
        }
        case 16: {
            return [UIImage imageNamed:@"ic_scene_class_traffic"];
        }
        default: {
            return [UIImage imageNamed:@"ic_scene_class_others"];
        }
    }
}

+ (UIImage *)imageWithSearchType:(NSInteger)type {
    switch (type) {
        case 1: {
            return [UIImage imageNamed:@"ic_search_dining_blue"];
        }
        case 2: {
            return [UIImage imageNamed:@"ic_search_hotel_blue"];
        }
        case 3: {
            return [UIImage imageNamed:@"ic_search_bar_blue"];
        }
        case 4: {
            return [UIImage imageNamed:@"ic_search_entertainment_blue"];
        }
        case 5: {
            return [UIImage imageNamed:@"ic_search_company_blue"];
        }
        case 6: {
            return [UIImage imageNamed:@"ic_search_school_blue"];
        }
        case 7: {
            return [UIImage imageNamed:@"ic_search_shopping_blue"];
        }
        case 8: {
            return [UIImage imageNamed:@"ic_search_scenic_blue"];
        }
        case 9: {
            return [UIImage imageNamed:@"ic_search_others_blue"];
        }
        case 10: {
            return [UIImage imageNamed:@"ic_search_my_place_blue"];
        }
        default: {
            return [UIImage imageNamed:@"ic_search_others_blue"];
        }
    }
}

+ (UIImage *)imageWithJobType:(NSInteger)type {
    /*
     UserJobIT = 0,// 计算机/互联网/通信
     UserJobIndustry = 1,// 生产/工艺/制造
     UserJobCommerce = 2,// 商业/服务业/个体经营
     UserJobFinance = 3,// 金融/银行/投资/保险
     UserJobCulture = 4,// 文化/广告/传媒
     UserJobArt = 5,// 娱乐/艺术/表演
     UserJobMedical = 6,// 医疗/护理/制药
     UserJobLawyer = 7,// 律师/法务
     UserJobEducation = 8,// 教育/培训
     UserJobServant = 9,// 公务员/事业单位
     UserJobStudent = 10,// 学生
     UserJobNone = 11, //无
     */
    NSString *imageName = [NSString stringWithFormat:@"ic_job_type_%ld", (long)type];
    return [UIImage imageNamed:imageName];
}

+ (UIImage *)imageWithSceneWhiteType:(NSInteger)type{
    switch (type) {
        case 1: {
            return [UIImage imageNamed:@"ic_type_dining_white"];
        }
        case 2: {
            return [UIImage imageNamed:@"ic_type_hotel_white"];
        }
        case 3: {
            return [UIImage imageNamed:@"ic_type_bar_white"];
        }
        case 4: {
            return [UIImage imageNamed:@"ic_type_entertainment_white"];
        }
        case 5: {
            return [UIImage imageNamed:@"ic_type_company_white"];
        }
        case 6: {
            return [UIImage imageNamed:@"ic_type_school_white"];
        }
        case 7: {
            return [UIImage imageNamed:@"ic_type_shopping_white"];
        }
        case 8: {
            return [UIImage imageNamed:@"ic_type_scenic_white"];
        }
        case 9: {
            return [UIImage imageNamed:@"ic_type_others_white"];
        }
        case 10: {
            return [UIImage imageNamed:@"ic_type_my_place_white"];
        }
        default: {
            return [UIImage imageNamed:@"ic_type_others_white"];
        }
    }
}

+ (UIImage *)imageWithSceneBlueType:(NSInteger)type{
    
    switch (type) {
        case 1: {
            return [UIImage imageNamed:@"ic_type_dining_blue"];
        }
        case 2: {
            return [UIImage imageNamed:@"ic_type_hotel_blue"];
        }
        case 3: {
            return [UIImage imageNamed:@"ic_type_bar_blue"];
        }
        case 4: {
            return [UIImage imageNamed:@"ic_type_entertainment_blue"];
        }
        case 5: {
            return [UIImage imageNamed:@"ic_type_company_blue"];
        }
        case 6: {
            return [UIImage imageNamed:@"ic_type_school_blue"];
        }
        case 7: {
            return [UIImage imageNamed:@"ic_type_shopping_mall"];
        }
        case 8: {
            return [UIImage imageNamed:@"ic_type_scenic_blue"];
        }
        case 9: {
            return [UIImage imageNamed:@"ic_type_others_blue"];
        }
        case 10: {
            return [UIImage imageNamed:@"ic_type_my_place_blue"];
        }
        case 11: {
            //购物中心
            return [UIImage imageNamed:@"ic_type_shopping_blue"];
        }
        default: {
            return [UIImage imageNamed:@"ic_type_others_blue"];
        }
    }
}

@end
