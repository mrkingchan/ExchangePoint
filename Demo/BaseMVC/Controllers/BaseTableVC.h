//
//  BaseTableVC.h
//  Demo
//
//  Created by 云笈 on 2018/11/27.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableVC : UIViewController

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,assign) BOOL headerRefresh;

@property(nonatomic,assign) BOOL footerRefresh;


/**
 交给子类重写
 */
- (void)headerRefreshAction;

- (void)footerRefreshAction;

//- (void)setFooterRefresh:(BOOL)footerRefresh;

//- (void)setHeaderRefresh:(BOOL)headerRefresh;


@end

NS_ASSUME_NONNULL_END
