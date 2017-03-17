
#import <UIKit/UIKit.h>

@interface UIImage (view)
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithSceneType:(NSInteger)type;
+ (UIImage *)imageWithSearchType:(NSInteger)type;
+ (UIImage *)imageWithJobType:(NSInteger)type;
+ (UIImage *)imageWithSceneWhiteType:(NSInteger)type;
+ (UIImage *)imageWithSceneBlueType:(NSInteger)type;

@end
