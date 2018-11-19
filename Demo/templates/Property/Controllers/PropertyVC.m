//
//  PropertyVC.m
//  Demo
//
//  Created by 云笈 on 2018/10/24.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "PropertyVC.h"
#import "ProductCell.h"

@interface PropertyVC () <UICollectionViewDataSource,UICollectionViewDelegate> {
    UICollectionView *_collectionView;
}

@end

@implementation PropertyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat itemW = (kScreenWidth - 15.0)/2.0;
    _collectionView = kCollectionViewWithConfiguraiton(self.view, CGRectZero,kLayoutWithCongiguration(itemW, itemW, 5.0, 5.0, UIEdgeInsetsMake(5, 5, 5, 5)) , [ProductCell class], self, self);
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UICollectionViewDataSource &Delefgate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ProductCell cellIdentifier] forIndexPath:indexPath];
    [cell configure];
    return cell;
}
@end
