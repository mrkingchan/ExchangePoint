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
    self.collectionView = kCollectionViewWithConfiguraiton(self.view, CGRectZero, kLayoutWithCongiguration((kScreenWidth - 25)/4.0, (kScreenWidth - 25)/4.0, 5, 5, UIEdgeInsetsMake(5, 5, 5, 5)), [UICollectionViewCell class], self, self);
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.headerRefresh = YES;
}

#pragma mark - UICollectionViewDataSource &Delefgate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = kRandomColor;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
-(void)headerRefreshAction {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView.header endRefreshing];
    });
}

@end
