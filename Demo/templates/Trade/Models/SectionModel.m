//
//  SectionModel.m
//  Demo
//
//  Created by 云笈 on 2018/11/13.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "SectionModel.h"

@implementation SectionModel

+ (NSDictionary *)mj_objectClassInArray {
    return  @{@"banner":NSStringFromClass([BannerModel class])};
    
}
@end
