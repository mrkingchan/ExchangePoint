//
//  MineDetailVC.m
//  Demo
//
//  Created by 云笈 on 2018/11/27.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "MineDetailVC.h"
#import "RainbowVC.h"

@interface MineDetailVC () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation MineDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerRefresh = YES;
}

#pragma mark - UITableViewDataSource & delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = [NSString stringWithFormat:@"%@%zd",self.class,indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[RainbowVC new] animated:YES];
}

-(void)headerRefreshAction {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.header endRefreshing];
    });
}
@end
