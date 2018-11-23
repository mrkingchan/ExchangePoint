//
//  ProductCell.h
//  Demo
//
//  Created by Chan on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductCell : UICollectionViewCell


- (void)configureWithImageUrl:(NSString *)urlStr name:(NSString *)name;

- (void)configureCellWithData:(ProductModel *)model;

+ (NSString *)cellIdentifier;

- (void)configure;
@end

NS_ASSUME_NONNULL_END
