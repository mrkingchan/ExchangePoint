//
//  BaseCollectionVC.h
//  Demo
//
//  Created by 云笈 on 2018/11/28.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionVC : UIViewController

@property (nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic,assign) BOOL headerRefresh;

@property(nonatomic,assign) BOOL footerRefresh;


/**
 交给子类重写
 */
- (void)headerRefreshAction;

- (void)footerRefreshAction;

@end

NS_ASSUME_NONNULL_END
