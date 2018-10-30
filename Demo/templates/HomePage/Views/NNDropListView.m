//
//  NNDropListView.m
//  DMHCExchange
//
//  Created by 云笈 on 2018/10/26.
//  Copyright © 2018年 超级钱包. All rights reserved.
//

#import "NNDropListView.h"
#import "NNTagCell.h"

@interface NNDropListView () <UICollectionViewDataSource,UICollectionViewDelegate> {
    UICollectionView *_collectionView;
    NSArray *_dataArray;
}

@end
@implementation NNDropListView

+ (instancetype)nnDropListViewWithArray:(NSArray *)titles complete:(void (^)(NSString * _Nonnull, NSInteger))complete {
    return [[NNDropListView alloc] initWithArray:titles complete:complete];
}

- (instancetype)initWithArray:(NSArray *)titles complete:(void (^)(NSString * _Nonnull, NSInteger))complete {
    if (self = [super initWithFrame:CGRectMake(0, isiPhoneX ? 88 + 90 + 45 : 64 + 135 + 24 , [UIScreen mainScreen].bounds.size.width, titles.count %4 == 0 ? titles.count /4 * 44:((titles.count / 4) + 1) * 44)]) {
        _complete = complete;
        _dataArray = titles;
        self.backgroundColor = [UIColor clearColor];
        [self setUpChildViews];
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

- (void)setUpChildViews {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 5.0;
    layout.minimumInteritemSpacing = 5.0;
    layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 25)/4.0, 44);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _dataArray.count %4 == 0 ? -44 *(_dataArray.count / 4): -(_dataArray.count / 4 +1 ) * 44, 0, 0) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:21/255.0 green:31/255.0 blue:47/255.0 alpha:1.0];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.scrollEnabled = NO;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[NNTagCell class] forCellWithReuseIdentifier:NSStringFromClass([NNTagCell class])];
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.1 animations:^{
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf->_collectionView.frame = self.bounds;
    }];
}

#pragma mark - UICollectionViewDatasource &Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NNTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NNTagCell class]) forIndexPath:indexPath];
    [cell setTagContent:_dataArray[indexPath.row]];
    return  cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [UIView animateWithDuration:0.1 animations:^{
        [self removeFromSuperview];
    } completion:^(BOOL finished) {
        
    }];
    if (_complete) {
        _complete(_dataArray[indexPath.row],indexPath.row);
    }
    
}

@end
