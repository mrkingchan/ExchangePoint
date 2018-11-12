//
//  ProductArrayModel.h
//  Demo
//
//  Created by 云笈 on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProductModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface ProductArrayModel : NSObject

@property (nonatomic, strong) NSArray <ProductModel *> *list;

@property (nonatomic, strong) NSString *total;

@property (nonatomic, strong) NSString *modulename;  //分区name


@end

NS_ASSUME_NONNULL_END
