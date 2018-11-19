//
//  FranceCoinVC.m
//  Demo
//
//  Created by 云笈 on 2018/10/24.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "FranceCoinVC.h"
#import "ProductCell.h"

@interface FranceCoinVC () <UICollectionViewDataSource,UICollectionViewDelegate> {
    UICollectionView *_collectionView;
}

@end

@implementation FranceCoinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = layout.minimumInteritemSpacing = 5.0;
    layout.sectionInset = UIEdgeInsetsMake(5,5,5,5);
    layout.itemSize = CGSizeMake((kScreenWidth - 15)/2.0, (kScreenWidth - 15)/2.0);
    _collectionView = kCollectionViewWithConfiguraiton(self.view, CGRectZero, layout, [ProductCell class], self, self);
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    _collectionView.backgroundColor = [UIColor whiteColor];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ProductCell cellIdentifier] forIndexPath:indexPath];
    [cell configure];
    return cell;
}

@end
