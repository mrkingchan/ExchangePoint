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
    UILabel *_name;
}

@end
@implementation ProductCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _productImage = [UIImageView new];
        [self addSubview:_productImage];
        [_productImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self);
            make.height.equalTo(@(self.frame.size.height - 30));
        }];
        _productImage.clipsToBounds = YES;
        _productImage.layer.cornerRadius = 5.0;
        _name = [UILabel new];
        _name.textAlignment = 1;
        _name.textColor = [UIColor blackColor];
        _name.font = [UIFont systemFontOfSize:15];
        [self addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(_productImage.mas_bottom);
            make.height.equalTo(@30);
        }];
        
    }
    return self;
}

#pragma mark - private Method

-(void)configureWithImageUrl:(NSString *)urlStr name:(NSString *)name{
    [_productImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"tabbar_4"]];
    _name.text = name;
}

- (void)configureCellWithData:(ProductModel *)model {
    [_productImage sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[[self class] imageWithColor:kRandomColor size:self.frame.size]];
    _name.text = model.productname;
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)configure {
    _productImage.backgroundColor = kRandomColor;
    _name.text =@"";
    _name.backgroundColor = kRandomColor;
}
@end
