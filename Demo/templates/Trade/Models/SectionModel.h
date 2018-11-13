//
//  SectionModel.h
//  Demo
//
//  Created by 云笈 on 2018/11/13.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BannerModel.h"
#import "ProductArrayModel.h"
#import "ModuleBannerArrayModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SectionModel : NSObject

@property (nonatomic, strong) NSArray <BannerModel*> *banner;

@property (nonatomic, strong) ProductArrayModel * prodata;

@property (nonatomic, strong) ModuleBannerArrayModel *modulebanner;

@end

NS_ASSUME_NONNULL_END
