//
//  SystemEnum.h
//  QianYing
//
//  Created by chm on 16/8/24.
//  Copyright © 2016年 chm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

#define KSWidth ([[UIScreen mainScreen] bounds].size.width)

#define KSHeight ([[UIScreen mainScreen] bounds].size.height)
// 状态栏高度
#define StateHeight ((KSHeight == 812.0 || KSHeight == 896.0) ? 44 : 20)
// 导航栏高度
#define NavHeight ((KIsiPhoneX || KIsiPHoneXr || KIsiPHoneXs || KIsPhoneXsMax) ? 88 : 64)

#define SafeAreabottomEageHeight ((KIsiPhoneX || KIsiPHoneXr || KIsiPHoneXs || KIsPhoneXsMax) ? 34 : 0)
// tabbar高度
#define TabBarHeight ((KSHeight == 812.0 || KSHeight == 896.0) ? 83 : 49)

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:alphaValue]

// 判断是否为iPhoneX
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPHoneXr
#define KIsiPHoneXr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPHoneXs
#define KIsiPHoneXs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs Max
#define KIsPhoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))


/**资讯apiKey**/
#define televisionServiceKey @"58sg!@#vmiqy"

#define gdtAppkey @"1106092751"

#define moheAPPID 40

#define AD_config_url @"http://iad.jisuvod.com/api/ad"

/**服务器域名**/
#define moviesServiceDomain @"http://test.app.yelbean.com:8091"//http://test.app.yelbean.com:8091  http://iapp.iosbean.com:82

#define baseurlServiceDomain @"http://aad.yelldou.com:82"


@interface SystemEnum : NSObject

/**获取当前网速**/
+ (long long) getInterfaceBytes;

/**获得某个范围内的屏幕图像**/
+ (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r  hd:(BOOL) isHD;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**匹配获取url超链接**/
+ (NSString *)urlStringForMatch:(NSString *) string;

/**图片裁剪**/
+ (id) createRoundedRectImage:(UIImage*)image size:(CGSize)size;

+(NSString *)getMMSSFromSS:(NSInteger)seconds;

+(NSString *)convertToJsonData:(NSDictionary *)dict;

+(UIFont *)getPingFangSCMediumFontWithSize:(NSInteger)fontSize;
+(UIFont *)getPingFangSCSemiboldFontWithSize:(NSInteger)fontSize;
+(UIFont *)getPingFangSCLightFontWithSize:(NSInteger)fontSize;
+(UIFont *)getPingFangSCRegularFontWithSize:(NSInteger)fontSize;
+(UIFont *)getDINCondensedBoldFontWithSize:(NSInteger)fontSize;

+(NSString *)numChuliWithNum:(NSInteger)num;

+ (UIViewController *)presentingVC;
@end
