//
//  ModuleBannerArrayModel.h
//  Demo
//
//  Created by 云笈 on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModuleBannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModuleBannerArrayModel : NSObject

@property (nonatomic, strong) NSString *ModuleBannerArrayModelId;

@property (nonatomic, strong) NSString *modulename;

@property (nonatomic, strong) NSString *sort;

@property (nonatomic, strong) NSArray <ModuleBannerModel *>*banner;


@end

NS_ASSUME_NONNULL_END
