//
//  ShareView.h
//  QuanMianRead
//
//  Created by 蒋威威 on 2019/4/25.
//  Copyright © 2019 QuanMian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface ShareView : UIView

/**
 从底部显示更多操作模式的按钮视图
 
 @param titleArray 标题名称
 @param imgNameArray 图片名称
 @param blockTapAction 点击返回事件(0,1,2,3...)
 */
+ (void)showMoreWithTitle:(NSArray *)titleArray
             imgNameArray:(NSArray *)imgNameArray
           blockTapAction:( void(^)(NSInteger index) )blockTapAction;

@end


NS_ASSUME_NONNULL_END
