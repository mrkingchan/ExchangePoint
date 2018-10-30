//
//  NNTradeDetailView.m
//  DMHCExchange
//
//  Created by 云笈 on 2018/10/26.
//  Copyright © 2018年 超级钱包. All rights reserved.
//

#import "NNTradeDetailView.h"
#define kAppTextColor   [UIColor akext_colorWithHex:@"#637794"]
@interface NNTradeDetailView()

@property (nonatomic, strong) UILabel *currentPrice;

@property (nonatomic, strong) UILabel  *priceRate;

@property (nonatomic, strong) UILabel *dealCount;

@property (nonatomic, strong) UILabel *open;

@property (nonatomic, strong) UILabel *high;

@property (nonatomic, strong) UILabel *recieve;

@property (nonatomic, strong) UILabel *low;



@end

@implementation NNTradeDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =[UIColor colorWithRed:21/255.0 green:31/255.0 blue:47/255.0 alpha:1.0];
        [self setUpChildViews];
    }
    return self;
}

- (void)setUpChildViews {
    //当前价格
    [self addSubview:self.currentPrice];
    [_currentPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(15);
    }];
    
    //涨幅
    [self addSubview:self.priceRate];
    [_priceRate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_currentPrice);
        make.top.equalTo(_currentPrice.mas_bottom).offset(15);
        make.height.equalTo(@15);
        make.width.equalTo(@45);
    }];
    
    //成交量
    
    [self addSubview:self.dealCount];
    [_dealCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceRate.mas_right).offset(8);
        make.centerY.equalTo(_priceRate);
    }];
    
    NSArray *titles = @[@"开",@"高",@"低",@"收"];
    UILabel *preLabel = nil;
    for (int i = 0; i < 4; i ++) {
        UILabel *label = [UILabel NNHWithTitle:titles[i]
                                    titleColor:kAppTextColor font:[UIFont systemFontOfSize:12]];
        [self addSubview:label];
        if (preLabel == nil) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top).offset(12);
                make.height.width.equalTo(@15);
                make.left.equalTo(self.mas_centerX).offset(50);
            }];
            
        } else {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(preLabel.mas_bottom).offset(5);
                make.height.width.equalTo(@15);
                make.left.equalTo(self.mas_centerX).offset(50);
            }];
        }
        preLabel = label;
    }
    
    //开
    [self addSubview:self.open];
    [self.open
     mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-20);
        make.left.equalTo(preLabel.mas_right);
        make.height.equalTo(@15);
        make.top.equalTo(self.mas_top).offset(15);
    }];
    
    
    //高
    [self addSubview:self.high];
    [self.high mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.open);
        make.left.equalTo(preLabel.mas_right);
        make.height.equalTo(@15);
        make.top.equalTo(self.open.mas_bottom).offset(5);
    }];
    

    //低
    [self addSubview:self.low];
    [self.low mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.open);
        make.left.equalTo(preLabel.mas_right);
        make.height.equalTo(@15);
        make.top.equalTo(self.high.mas_bottom).offset(5);
    }];
    
    
    //收
    
    [self addSubview:self.recieve];
    [self.recieve mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.open);
        make.left.equalTo(preLabel.mas_right);
        make.height.equalTo(@15);
        make.top.equalTo(self.low.mas_bottom).offset(5);
    }];
}

- (void)refreshWithData:(NSDictionary *)dic {
    _currentPrice.text = dic[@"new_price"];
    _low.text = dic[@"min_price"];
    _high.text = dic[@"max_price"];
    _dealCount.text = dic[@"volume"];
    _priceRate.text = dic[@"changestr"];
    _open.text = dic[@"open_price"];
    _recieve.text = dic[@"qc_price"];
}

#pragma mark - lazy Load

- (UILabel *)currentPrice{
    if (!_currentPrice) {
        _currentPrice = [UILabel NNHWithTitle:@""
                                   titleColor:[UIColor akext_colorWithHex:@"#3fbe72"] font:[UIFont boldSystemFontOfSize:28]];
        _currentPrice.textAlignment = 0;
    }
    return _currentPrice;
}

- (UILabel *)priceRate{
    if (!_priceRate) {
        _priceRate = [UILabel NNHWithTitle:@""
                                titleColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:10]];
        _priceRate.backgroundColor =[UIColor colorWithRed:102/255.0 green:187/255.0 blue:121/255.0 alpha:1.0];
        _priceRate.textAlignment = 1;
    }
    return _priceRate;
}

- (UILabel *)dealCount{
    if (!_dealCount) {
        _dealCount = [UILabel NNHWithTitle:@""
                                titleColor:kAppTextColor font:[UIFont systemFontOfSize:14]];
        _dealCount.textAlignment= 2;
    }
    return _dealCount;
}

//开 高 低 收
- (UILabel *)open{
    if (!_open) {
        _open = [UILabel NNHWithTitle:@""
                           titleColor:kAppTextColor font:[UIFont systemFontOfSize:12]];
        _open.textAlignment = 2;
    }
    return _open;
}

- (UILabel *)high{
    if (!_high) {
        _high = [UILabel NNHWithTitle:@""
                           titleColor:kAppTextColor font:[UIFont systemFontOfSize:12]];
        _high.textAlignment = 2;
    }
    return _high;
}

- (UILabel *)low{
    if (!_low) {
        _low = [UILabel NNHWithTitle:@""
                           titleColor:kAppTextColor font:[UIFont systemFontOfSize:12]];
        _low.textAlignment = 2;
    }
    return _low;
}

- (UILabel *)recieve{
    if (!_recieve) {
        _recieve = [UILabel NNHWithTitle:@""
                           titleColor:kAppTextColor font:[UIFont systemFontOfSize:12]];
        _recieve.textAlignment = 2;
    }
    return _recieve;
}


@end
