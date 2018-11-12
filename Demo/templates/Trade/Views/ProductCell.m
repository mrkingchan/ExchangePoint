//
//  ProductCell.m
//  Demo
//
//  Created by 云笈 on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "ProductCell.h"
#import "UIImageView+WebCache.h"

@interface ProductCell() {
    UIImageView *_productImage;
}

@end
@implementation ProductCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _productImage = [UIImageView new];
        [self addSubview:_productImage];
        [_productImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

#pragma mark - private Method

-(void)configureWithImageUrl:(NSString *)urlStr {
    [_productImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"tabbar_4"]];
}
@end
