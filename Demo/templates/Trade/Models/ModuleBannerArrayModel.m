//
//  ModuleBannerArrayModel.m
//  Demo
//
//  Created by Chan on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "ModuleBannerArrayModel.h"

@implementation ModuleBannerArrayModel


+(NSDictionary *)mj_objectClassInArray {
    return @{@"banner":
                 NSStringFromClass([ModuleBannerModel class])};
}

@end
