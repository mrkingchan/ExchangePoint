//
//  TabbarVC.m
//  Demo
//
//  Created by 云笈 on 2018/10/24.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "TabbarVC.h"
#import "HomePageVC.h"
#import "TradeVC.h"
#import "FranceCoinVC.h"
#import "PropertyVC.h"
#import "MineVC.h"

@interface TabbarVC ()

@end

@implementation TabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titles = @[@"首页",@"交易",@"法币",@"资产",@"我的"];
    NSArray *classNames = @[[HomePageVC class],
                            [TradeVC class],
                            [FranceCoinVC class],
                            [PropertyVC class],
                            [MineVC class]];
    NSMutableArray *navis = [NSMutableArray new];
    for (int i = 0 ; i < classNames.count; i ++) {
        /*UIViewController *viewController = [self buildControllerWithClass:classNames[i]
                                                                 titleStr:titles[i]
                                                              normalImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d",i + 1]] selectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d_s",i + 1]]];
         */
        UIViewController *viewController = kbuildViewControllerWithConfiguration(classNames[i], titles[i], [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d",i + 1]], [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d_s",i + 1]]);
        
        UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [navis addObject:naviController];
    }
    self.viewControllers = navis;
    
    //导航栏设置
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    
    //底部栏设置
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
      [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    
}

- (UIViewController *)buildControllerWithClass:(Class)className
                                      titleStr:(NSString *)title
                                   normalImage:(UIImage *)normalImage
                                 selectedImage:(UIImage *)selectedImage {
//    NSAssert([className isSubclassOfClass:[UIViewController class]], @"className must be a subClass of UIViewController!");
    UIViewController *viewController = [className new];
    viewController.navigationItem.title = title;
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title
                                                       image:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    viewController.tabBarItem = item;
    return viewController;
}
@end
