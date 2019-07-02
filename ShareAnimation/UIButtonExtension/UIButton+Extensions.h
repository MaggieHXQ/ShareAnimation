//
//  UIButton+Extensions.h
//  峰哥cells
//
//  Created by silence on 2017/9/3.
//  Copyright © 2017年 silence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extensions)

/**
 上部分是图片，下部分是文字

 @param space 间距
 */
- (void)setUpImageAndDownLableWithSpace:(CGFloat)space;


/**
 左边是文字，右边是图片（和原来的样式翻过来）

 @param space 间距
 */
- (void)setLeftTitleAndRightImageWithSpace:(CGFloat)space;


/**
 设置角标的个数（右上角）

 @param badgeValue <#badgeValue description#>
 */
- (void)setBadgeValue:(NSInteger)badgeValue;

@end
