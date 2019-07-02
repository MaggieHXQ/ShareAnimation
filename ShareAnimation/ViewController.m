//
//  ViewController.m
//  ShareAnimation
//
//  Created by 侯雪晴 on 2019/7/2.
//  Copyright © 2019 侯雪晴. All rights reserved.
//

#import "ViewController.h"
#import "ShareView.h"
#import "SystemEnum.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake((KSWidth-50)/2, 200, 50, 25);
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareBtn];
}
- (void)shareClick
{
    [ShareView showMoreWithTitle:@[@"微信好友",@"朋友圈",@"QQ好友",@"QQ空间",@"复制链接"] imgNameArray:@[@"share_icon_wechat",@"share_icon_circle",@"share_icon_QQ",@"share_icon_Qzone",@"share_icon_copy"] blockTapAction:^(NSInteger index) {
        
    }];
}

@end
