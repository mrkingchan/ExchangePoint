//
//  HeaderView.m
//  Demo
//
//  Created by 云笈 on 2018/11/12.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}
@end
