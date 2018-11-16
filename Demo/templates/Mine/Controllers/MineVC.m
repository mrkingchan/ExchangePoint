//
//  MineVC.m
//  Demo
//
//  Created by 云笈 on 2018/10/24.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "MineVC.h"

@interface MineVC () <UITableViewDataSource,UITableViewDelegate> {
    UITableView *_tableView;
}

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = kTableViewWithConfiguration(self.view, CGRectZero, UITableViewStyleGrouped, self, self, [UITableViewCell class]);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource &Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = [NSString stringWithFormat:@"cell  section NO.%zd,row NO.%zd",indexPath.section,indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%i",indexPath.row %2 == 0? 1:2]];
    return cell;
}
@end
