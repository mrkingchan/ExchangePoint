//
//  SectionHeaderView.h
//  Demo
//
//  Created by 云笈 on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerModel.h"
#import "ModuleBannerArrayModel.h"
#import "ModuleBannerModel.h"
#import "ProductArrayModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SectionHeaderView : UIView


/**
 sectionHeaderView with given configuration

 @param bannerArray bannerArray description
 @param bannerComplete bannerComplete description
 @param moduleComplete moduleComplete description
 @param complete complete description
 @param model model description
 @return return a sectionHeaderView with given configuration
 */
+ (SectionHeaderView *)sectionHeaderViewWithBannerArray:(NSArray <BannerModel *> *)bannerArray
                                    bannerArrayComplete:(void (^)(NSInteger index,BannerModel *model))bannerComplete
                                            moduleArray:(ModuleBannerArrayModel *)moduleComplete
                                         moduleComplete:(void (^)(NSInteger index,ModuleBannerModel *model))complete productListModel:(ProductArrayModel *)model;


@property(nonatomic,copy)void (^bannerComplete)(NSInteger ,BannerModel *);

@property(nonatomic,copy)void (^moduleComplete)(NSInteger ,ModuleBannerModel *);


@end

NS_ASSUME_NONNULL_END
