//
//  ProductCell.h
//  Demo
//
//  Created by 云笈 on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductCell : UICollectionViewCell


- (void)configureWithImageUrl:(NSString *)urlStr name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
