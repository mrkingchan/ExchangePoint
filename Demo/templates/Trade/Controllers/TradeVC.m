//
//  TradeVC.m
//  Demo
//
//  Created by 云笈 on 2018/10/24.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import"TradeVC.h"
#import "SDCycleScrollView.h"
#import "UIImageView+WebCache.h"
#import "ProductCell.h"
#import "HeaderView.h"

@interface TradeVC () <UICollectionViewDelegate,UICollectionViewDataSource> {
    NSMutableDictionary *_jsonDic;
    UIView *_headerView;
    UICollectionView *_collectionView;
}

@end

@implementation TradeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _jsonDic = [NSMutableDictionary dictionaryWithDictionary:@{
       @"code":@"200",
       @"msg":@"success",
       @"data":@{
           @"banner": @[
                       @{
                          @"id":@"2",
                          @"type":@"1",
                          @"bname":@"中秋佳节",
                          @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/wfcc_mall/images/2018-09-14/1536907126bk861.jpg",
                          @"urltype":@"2",
                          @"url":@"http: //www.niuniuhuiapp.net: 31014/active/active/zhongqiu",
                          @"addtime":@"2018-09-14 14: 38: 57",
                          @"sort":@"1",
                          @"menuid":@"1"
                       },
                       @{
                          @"id":@"1",
                          @"type":@"1",
                          @"bname":@"中秋佳节",
                          @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/wfcc_mall/images/2018-09-14/1536907126bk861.jpg",
                          @"urltype":@"2",
                          @"url":@"http: //www.niuniuhuiapp.net: 31014/active/active/zhongqiu",
                          @"addtime":@"2018-09-14 14: 38: 57",
                          @"sort":@"1",
                          @"menuid":@"1"
                       }
                       ],
           @"proData":@{
               @"list": @[
                        @{
                            @"prouctprice":@"0.02",
                            @"productname":@"liudan002-测试",
                            @"id":@"15316",
                            @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/wfcc_mall/images/2018-10-15/1539571375au206.png?x-oss-process=image/quality,q_80",
                            @"follow_num":@""
                         },
                        @{
                            @"prouctprice":@"6000.00",
                            @"productname":@"雲牛汇一日游",
                            @"id":@"15267",
                            @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/NNH/images/2018-01-22/1516611212gn599.png?x-oss-process=image/quality,q_80",
                            @"follow_num":@""
                         },
                        @{
                            @"prouctprice":@"2200.00",
                            @"productname":@"牛牛汇特殊商品",
                            @"id":@"327",
                            @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/NNH/images/2018-01-23/1516688054qw762.png?x-oss-process=image/quality,q_80",
                            @"follow_num":@""
                         },
                        @{
                            @"prouctprice":@"100.00",
                            @"productname":@"旅游商品",
                            @"id":@"325",
                            @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/NNH/images/2018-01-22/1516610115ph553.png?x-oss-process=image/quality,q_80",
                            @"follow_num":@""
                         },
                        @{
                            @"prouctprice":@"230.00",
                            @"productname":@"分销上传",
                            @"id":@"323",
                            @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/NNH/images/2018-01-22/1516591430zr766.png?x-oss-process=image/quality,q_80",
                            @"follow_num":@""
                         },
                        @{
                            @"prouctprice":@"599.00",
                            @"productname":@"牛比特币",
                            @"id":@"320",
                            @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/NNH/images/2018-01-17/1516177648fv860.jpg?x-oss-process=image/quality,q_80",
                            @"follow_num":@""
                         },
                        @{
                            @"prouctprice":@"118.00",
                            @"productname":@"添加分销商品佣金比例为87的分销商品",
                            @"id":@"314",
                            @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/NNH/images/2018-01-11/1515663455zd605.jpg?x-oss-process=image/quality,q_80",
                            @"follow_num":@""
                         },
                        @{
                            @"prouctprice":@"100.00",
                            @"productname":@"测试新分润6",
                            @"id":@"288",
                            @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/NNH/images/2017-09-26/1506393414cu725.jpg?x-oss-process=image/quality,q_80",
                            @"follow_num":@""
                         }],
               @"total":@"8",
               @"modulename":@"精品推荐"
            },
           @"modulebanner":@[
                            @{
                                @"id":@"1",
                                @"modulename":@"活动图片",
                                @"modulecode":@"threeethum",
                                @"sort":@"1",
                                @"banner": @[
                                           @{
                                               @"bname":@"近期拍卖",
                                               @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/wfcc_mall/images/2018-08-14/1534258725ec925.jpg",
                                               @"urltype":@"-1",
                                               @"url":@"#",
                                               @"sort":@"1"
                                            },
                                           @{
                                               @"bname":@"展览活动",
                                               @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/wfcc_mall/images/2018-08-14/1534258725ec925.jpg",
                                               @"urltype":@"-1",
                                               @"url":@"#",
                                               @"sort":@"2"
                                            },
                                           @{
                                               @"bname":@"艺术品投资",
                                               @"thumb":@"https: //wfcc.oss-cn-shenzhen.aliyuncs.com/wfcc_mall/images/2018-08-14/1534258725ec925.jpg",
                                               @"urltype":@"-1",
                                               @"url":@"#",
                                               @"sort":@"3"
                                            }
                                            ]
                             }
                             ]
        }
       }];
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    NSMutableArray *imageArray = [NSMutableArray new];
    [imageArray addObjectsFromArray:[_jsonDic[@"data"][@"banner"] valueForKey:@"thumb"]];
    SDCycleScrollView *bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageURLStringsGroup:imageArray];
    bannerView.clipsToBounds = YES;
    bannerView.delegate = self;
    bannerView.layer.cornerRadius = 4.0;
    [_headerView addSubview:bannerView];
    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(_headerView);
        make.height.equalTo(@150);
    }];
    
    UIView *containerView = [UIView new];
    [_headerView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_headerView);
        make.top.equalTo(bannerView.mas_bottom);
        make.height.equalTo(@150);
    }];
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
    for (int i = 0 ; i < 3; i ++) {
        UIImageView *productView = [UIImageView new];
        productView.clipsToBounds = YES;
        productView.layer.cornerRadius = 4.0;
        [containerView addSubview:productView];
        [productView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(containerView.mas_left).offset(i == 0 ? kScreenWidth/ 2.0:0);
            make.top.equalTo(containerView.mas_top).offset(i<2? 0:75);
            make.width.equalTo(@(kScreenWidth/2));
            make.height.equalTo(i == 0 ? @(150):@(75));
        }];
        [productView sd_setImageWithURL:[NSURL URLWithString:_jsonDic[@"data"][@"modulebanner"][0][@"banner"][i][@"thumb"]] placeholderImage:[UIImage  imageNamed:@"tabbar_4"]];
    }
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = layout.minimumInteritemSpacing = 5.0;
    layout.sectionInset = UIEdgeInsetsMake(5,5,5,5);
    layout.itemSize = CGSizeMake((kScreenWidth - 15)/2.0, (kScreenWidth - 15)/2.0);
    layout.headerReferenceSize = CGSizeMake(kScreenWidth, 300);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:ProductCell.class forCellWithReuseIdentifier:NSStringFromClass(ProductCell.class)];
    [_collectionView  registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HeaderView class])];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
#pragma mark - UIColectionViewDataSource &Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_jsonDic[@"data"][@"proData"][@"list"] count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind  isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([HeaderView class]) forIndexPath:indexPath];
        [header addSubview:_headerView];
        return header;
    }else {
        return nil;
    }
    return nil;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(ProductCell.class) forIndexPath:indexPath];
    [cell configureWithImageUrl:_jsonDic[@"data"][@"proData"][@"list"][indexPath.row][@"thumb"]];
    return cell;
}
@end
