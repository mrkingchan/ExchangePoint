//
//  BaseTableVC.m
//  Demo
//
//  Created by 云笈 on 2018/11/27.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "BaseTableVC.h"

@interface BaseTableVC () <UITableViewDelegate,UITableViewDataSource>
@end

@implementation BaseTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _tableView = kTableViewWithConfiguration(self.view, CGRectZero, 0, self, self, [UITableViewCell class]);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    kAdjustsScrollViewInsets_NO(_tableView, self);
}

- (void)setHeaderRefresh:(BOOL)headerRefresh {
    if (headerRefresh) {
        [_tableView  addLegendHeaderWithRefreshingBlock:^{
            [self headerRefreshAction];
        }];
    } else {
        
    }
}

-(void)setFooterRefresh:(BOOL)footerRefresh {
    if (footerRefresh) {
      
        [_tableView addLegendFooterWithRefreshingBlock:^{
            [self footerRefreshAction];
        }];
    }else {
    }
}

- (void)headerRefreshAction {
    
}

- (void)footerRefreshAction {
    
}

#pragma mark - UITableViewDataSource & delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
@end
