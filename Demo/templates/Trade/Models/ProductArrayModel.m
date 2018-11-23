//
//  ProductArrayModel.m
//  Demo
//
//  Created by Chan on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "ProductArrayModel.h"

@implementation ProductArrayModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list":NSStringFromClass([ProductModel class])};
}
@end
