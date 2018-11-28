//
//  RainbowVC.m
//  Demo
//
//  Created by 云笈 on 2018/11/28.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "RainbowVC.h"

@interface RainbowVC ()

@end

@implementation RainbowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.headerRefresh = YES;
}

-(void)headerRefreshAction {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView.mj_header endRefreshing];
    });
}

@end
