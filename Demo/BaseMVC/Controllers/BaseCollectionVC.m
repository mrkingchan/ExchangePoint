//
//  BaseCollectionVC.m
//  Demo
//
//  Created by 云笈 on 2018/11/28.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "BaseCollectionVC.h"

@interface BaseCollectionVC () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation BaseCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView = kCollectionViewWithConfiguraiton(self.view, CGRectZero, kLayoutWithCongiguration((kScreenWidth - 20)/3.0, (kScreenWidth - 20)/3.0, 5, 5, UIEdgeInsetsMake(5, 5, 5, 5)), [UICollectionViewCell class], self, self);
    [_collectionView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}


#pragma mark - setter Method

-(void)setHeaderRefresh:(BOOL)headerRefresh {
    if (headerRefresh) {
        _collectionView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
            [self headerRefreshAction];
        }];
    } else {
        _collectionView.mj_header = nil;
    }
}


-(void)setFooterRefresh:(BOOL)footerRefresh {
    if (footerRefresh) {
        _collectionView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
            [self footerRefreshAction];
        }];
    } else {
        _collectionView.mj_footer = nil;
    }
}

#pragma mark - 交给子类去重写


-(void)headerRefreshAction {
    
}

-(void)footerRefreshAction {
    
}

#pragma mark - UICollectionViewDataSource &Delefgate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = kRandomColor;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}
@end
