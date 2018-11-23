//
//  SectionHeaderView.m
//  Demo
//
//  Created by Chan on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "SectionHeaderView.h"
#import "SDCycleScrollView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface SectionHeaderView () <SDCycleScrollViewDelegate> {
    SDCycleScrollView *_bannerView;
    NSArray <BannerModel *> *_bannerArray;
    ModuleBannerArrayModel *_moduleModel;
    ProductArrayModel *_productArrayModel;
    UILabel *_sectionHeaderTitlte;
}

@end
@implementation SectionHeaderView

+ (SectionHeaderView *)sectionHeaderViewWithBannerArray:(NSArray <BannerModel *> *)bannerArray
                                    bannerArrayComplete:(void (^)(NSInteger index,BannerModel *model))bannerComplete
                                            moduleArray:(ModuleBannerArrayModel *)moduleModel
                                         moduleComplete:(void (^)(NSInteger index,ModuleBannerModel *model))moduleComplete productListModel:(ProductArrayModel *)model {
    return [[SectionHeaderView alloc] initWithFrame:CGRectMake(0,0,kScreenWidth, 325) WithBannerArray:bannerArray bannerArrayComplete:bannerComplete moduleArray:moduleModel moduleComplete:moduleComplete productListModel:model];
}

- (instancetype)initWithFrame:(CGRect)frame
              WithBannerArray:(NSArray <BannerModel *> *)bannerArray
                    bannerArrayComplete:(void (^)(NSInteger index,BannerModel *model))bannerComplete
                            moduleArray:(ModuleBannerArrayModel *)moduleModel
                         moduleComplete:(void (^)(NSInteger index,ModuleBannerModel *model))moduleComplete productListModel:(ProductArrayModel *)model {
    if (self = [super initWithFrame:frame]) {
        _bannerArray = bannerArray;
        _moduleModel = moduleModel;
        _productArrayModel = model;
        
        _bannerComplete = bannerComplete;
        _moduleComplete = moduleComplete;
        
       __block NSMutableArray *temArray = [NSMutableArray new];
        [bannerArray enumerateObjectsUsingBlock:^(BannerModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [temArray addObject:obj.thumb];
        }];
        _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageURLStringsGroup:temArray];
        _bannerView.clipsToBounds = YES;
        _bannerView.delegate = self;
        _bannerView.layer.cornerRadius = 4.0;
        [self addSubview:_bannerView];
        [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
            make.height.equalTo(@150);
        }];
        
        UIView *containerView = [UIView new];
        [self addSubview:containerView];
        [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(_bannerView.mas_bottom);
            make.height.equalTo(@150);
        }];
        CGFloat itemW = (kScreenWidth - 15)/2.0;
        for (int i = 0 ; i < _moduleModel.banner.count; i ++) {
            UIImageView *productView = [UIImageView new];
            productView.clipsToBounds = YES;
            productView.layer.cornerRadius = 4.0;
            [containerView addSubview:productView];
            containerView.userInteractionEnabled = YES;
            [productView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(containerView.mas_left).offset(i == 0 ?5:itemW + 10);
                make.top.equalTo(containerView.mas_top).offset(i<2? 0:75);
                make.width.equalTo(@(itemW));
                make.height.equalTo(i == 0 ? @(150):@(75));
            }];
            ModuleBannerModel *temModel = moduleModel.banner[i];
            [productView  sd_setImageWithURL:[NSURL URLWithString:temModel.thumb] placeholderImage:[UIImage imageNamed:@"tabbar_4"]];
            productView.userInteractionEnabled = YES;
            productView.tag = 10000 + i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonAction:)];
            [productView addGestureRecognizer:tap];
            
        }
        _sectionHeaderTitlte = [UILabel new];
        _sectionHeaderTitlte.font = [UIFont systemFontOfSize:16];
        _sectionHeaderTitlte.textColor = [UIColor blackColor];
        [self addSubview:_sectionHeaderTitlte];
        [_sectionHeaderTitlte mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(20);
            make.right.equalTo(self);
            make.top.equalTo(containerView.mas_bottom);
            make.height.equalTo(@25);
        }];
        _sectionHeaderTitlte.text = model.modulename;
    }
    return self;
}

#pragma mark - private Method
- (void)buttonAction:(UITapGestureRecognizer *)tap {
    UIImageView *imageView = (UIImageView *)tap.view;
    NSInteger index = imageView.tag -10000;
    if (_moduleComplete) {
        _moduleComplete(index,_moduleModel.banner[index]);
    }
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if (_bannerComplete) {
        _bannerComplete(index,_bannerArray[index]);
    }
}
@end
