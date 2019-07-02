//
//  BookShareView.m
//  QuanMianRead
//
//  Created by 蒋威威 on 2019/4/25.
//  Copyright © 2019 QuanMian. All rights reserved.
//

#import "ShareView.h"
#import "SystemEnum.h"
#import "UIButton+Extensions.h"

#define ShareHeight 190+SafeAreabottomEageHeight

@interface ShareView ()

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imgNameArray;
@property (nonatomic, copy) void (^blockTapAction)(NSInteger index);
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation ShareView

+ (void)showMoreWithTitle:(NSArray *)titleArray
             imgNameArray:(NSArray *)imgNameArray
           blockTapAction:( void(^)(NSInteger index) )blockTapAction{
    if (titleArray.count != imgNameArray.count || !titleArray.count) {
        return;
    }
    
    ShareView *modeView = [[ShareView alloc] initWithFrame:CGRectMake(0, 0, MIN(KSWidth, KSHeight), MAX(KSWidth, KSHeight))];
    modeView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    modeView.alpha = 0;
    modeView.titleArray = titleArray;
    modeView.imgNameArray = imgNameArray;
    modeView.blockTapAction = blockTapAction;
    [[UIApplication sharedApplication].keyWindow addSubview:modeView];
    
    // 创建内容
    [modeView bulidContentView];
    
    [modeView show];
    [modeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:modeView action:@selector(dismiss)]];
}

- (void)bulidContentView{
    
//    CGRect frame;
//    if (KSWidth < KSHeight) {
//        frame = CGRectMake(0, KSHeight, KSWidth, ShareHeight);
//    }else{
//        frame = CGRectMake(0, KSWidth, KSHeight, ShareHeight);
//    }
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, MAX(KSWidth, KSHeight), MIN(KSWidth, KSHeight), ShareHeight)];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(15, 15)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    [self.contentView.layer addSublayer:shapeLayer];
    [self addSubview:self.contentView];
    
    [self bulidContent];
    [self bulidCancle];
}
// 取消按钮
- (void)bulidCancle{
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleButton.frame = CGRectMake(0, self.contentView.bounds.size.height - 55-SafeAreabottomEageHeight, self.contentView.bounds.size.width, 55);
    cancleButton.titleLabel.font = [SystemEnum getPingFangSCRegularFontWithSize:16];
    [cancleButton setTitle:@"取消分享" forState:UIControlStateNormal];
    [cancleButton setTitleColor:UIColorFromRGBA(0x333333, 1) forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, cancleButton.bounds.size.width, 1);
    layer.backgroundColor = UIColorFromRGBA(0xF5F5F5, 1).CGColor;
    [cancleButton.layer addSublayer:layer];
    
    [self.contentView addSubview:cancleButton];
}
- (void)bulidContent{
    
//    CGFloat width;
//    if (KSWidth < KSHeight) {
//        width = KSWidth;
//    }else{
//        width = KSHeight;
//    }
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 22, MIN(KSWidth, KSHeight), 12)];
    nameLab.text = @"分享至社交";
    nameLab.textColor = UIColorFromRGBA(0x999999, 1);
    nameLab.font = [UIFont systemFontOfSize:12];
    nameLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:nameLab];
    
    self.buttonArray = [[NSMutableArray alloc] init];
    CGFloat iconWidth = 45;
    CGFloat space = (MIN(KSWidth, KSHeight)  - (self.titleArray.count * iconWidth)) / (self.titleArray.count + 1);
    
    for (int i = 0; i < self.titleArray.count; i++) {
        
        CGRect frame;
        frame.size.width = iconWidth;
        frame.size.height = iconWidth;
        frame.origin.x = (i % self.titleArray.count) * (frame.size.width + space) + space;
        frame.origin.y = CGRectGetMaxY(nameLab.frame)+14;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.frame = frame;
        [button setImage:[UIImage imageNamed:self.imgNameArray[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        [self.buttonArray addObject:button];
        
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(button.frame)-2.5, CGRectGetMaxY(button.frame)+10, 50, 12)];
        titleLab.textColor = UIColorFromRGBA(0x3C3E45, 1);
        titleLab.font = [SystemEnum getPingFangSCRegularFontWithSize:12];
        titleLab.text = self.titleArray[i];
        titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showButton];
    });
}

- (void)showButton{
    
    for (int i = 0; i < self.buttonArray.count; i++) {
        
        UIButton *button = self.buttonArray[i];
        //动画
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform =CGAffineTransformTranslate(transform, 0, 210-10*i);
        button.transform = transform;
        
        [UIView animateWithDuration:1 delay:i*0.1- i/5*0.5  usingSpringWithDamping:0.45 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            
            button.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)dismissButton{
    
    for (int i = 0; i < self.buttonArray.count; i++) {
        
        UIButton *button = self.buttonArray[self.buttonArray.count-i-1];
        
        [UIView animateWithDuration:0.65 delay:i*0.10- i/5*0.5  usingSpringWithDamping:0.45 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            button.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -70-15*i);
            
        } completion:^(BOOL finished) {
            
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.65 delay:i*0.10- i/5*0.5  usingSpringWithDamping:1 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                
                button.transform = CGAffineTransformIdentity;
                
            } completion:^(BOOL finished) {
                
            }];
        });
    }
}
- (void)show{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.alpha = 1;
        self.contentView.transform = CGAffineTransformMakeTranslation(0, -self.contentView.bounds.size.height);
    }];
}

- (void)dismiss{
    
    [self dismissButton];
    [UIView animateWithDuration:0.9 animations:^{
        
        self.contentView.transform = CGAffineTransformIdentity;
        //       self.contentView.transform = CGAffineTransformMakeTranslation(0, -self.contentView.bounds.size.height);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
    
}

- (void)tapAction:(UIButton *)button{
    
    [self dismiss];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.blockTapAction) {
            self.blockTapAction(button.tag);
        }
    });
}

- (void)addLineWithFrame:(CGRect)frame color:(UIColor *)color{
    
    CALayer *layer = [CALayer layer];
    layer.frame = frame;
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}

//禁止横屏
- (BOOL)shouldAutorotate {
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
