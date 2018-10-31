//
//  HomePageVC.m
//  Demo
//
//  Created by 云笈 on 2018/10/24.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "HomePageVC.h"

#import "Y_StockChartView.h"
#import "Y_KLineGroupModel.h"
#import "UIColor+Y_StockChart.h"
#import "NNTradeDetailView.h"
#import "NNDropListView.h"
#import "UIColor+NNHExtension.h"
#import "AFNetworking.h"

#define kKlineBackColor [UIColor colorWithRed:21/255.0 green:31/255.0 blue:47/255.0 alpha:1.0]

@interface HomePageVC () <Y_StockChartViewDataSource>


@property (nonatomic, strong) Y_StockChartView *chartView;  // K线图

@property (nonatomic, strong) NNTradeDetailView *tradeDetailView;  //顶部数据详情图

@property (nonatomic, strong) NSMutableDictionary<NSString *,Y_KLineGroupModel *> *modelsDic;  //k线图数据源

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, strong) NSTimer *timer;  //定时器 刷新k线图数据

@end

@implementation HomePageVC

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeCurrentDropView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kKlineBackColor ;
    self.navigationItem.title =@"ATA/USDT";
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self setUpChildViews];
    
    
    self.type = @"1min";
    _timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(reloadData) userInfo:nil repeats:YES];
}

- (void)setUpChildViews {
    [self.view addSubview:self.tradeDetailView];
    [self.view addSubview:self.chartView];
    //买入买出
    UIButton *preButton = nil;
    for (int i = 0 ; i < 2; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont  systemFontOfSize:14];
        [button setTitleColor: [UIColor akext_colorWithHex:@"#ffffff"] forState:UIControlStateNormal];
        [button setBackgroundColor:i == 0 ?[UIColor akext_colorWithHex:@"#3fbe72"]:[UIColor akext_colorWithHex:@"#f0252a"] ];
        [button setTitle:[NSString stringWithFormat:@"%@%@",i == 0 ? @"买入":@"买出",@"BTC/USDT"]forState:UIControlStateNormal];
        [button  addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.textAlignment = 1;
        button.tag = 201810 + i;
        [self.view addSubview:button];
        if (preButton == nil) {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view);
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width/2.0));
                make.bottom.equalTo(self.view.mas_bottom).offset(0);
                make.height.equalTo(@40);
            }];
        } else {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.view);
                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width/2.0));
                make.height.equalTo(@40);
                make.bottom.equalTo(self.view.mas_bottom).offset(0);
            }];
        }
        preButton = button;
    }
}

#pragma mark - private Method
- (void)buttonAction:(UIButton *)button {
#warning  TO DO ......
}

#pragma mark - lazy Load

- (NSMutableDictionary <NSString *,Y_KLineGroupModel *> *)modelsDic{
    if (!_modelsDic) {
        _modelsDic = @{}.mutableCopy;
    }
    return _modelsDic;
}

- (Y_StockChartView *)chartView{
    if (!_chartView) {
        _chartView = [Y_StockChartView new];
        [self.view addSubview:_chartView];
        _chartView.dataSource = self;
        _chartView.itemModels = @[
                                  [Y_StockChartViewItemModel itemModelWithTitle:@"指标" type:Y_StockChartcenterViewTypeOther],
                                  [Y_StockChartViewItemModel itemModelWithTitle:@"分时" type:Y_StockChartcenterViewTypeTimeLine],
                                  [Y_StockChartViewItemModel itemModelWithTitle:@"1分" type:Y_StockChartcenterViewTypeKline],
                                  [Y_StockChartViewItemModel itemModelWithTitle:@"5分" type:Y_StockChartcenterViewTypeKline],
                                  [Y_StockChartViewItemModel itemModelWithTitle:@"30分" type:Y_StockChartcenterViewTypeKline],
                                  [Y_StockChartViewItemModel itemModelWithTitle:@"60分" type:Y_StockChartcenterViewTypeKline],
                                  [Y_StockChartViewItemModel itemModelWithTitle:@"日线" type:Y_StockChartcenterViewTypeKline],
                                  [Y_StockChartViewItemModel itemModelWithTitle:@"周线" type:Y_StockChartcenterViewTypeKline],
                                  ];
        [_chartView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.tradeDetailView.mas_bottom);
            if (isiPhoneX) {
                make.bottom.equalTo(self.view.mas_bottom).offset(0);
            } else {
                make.bottom.equalTo(self.view.mas_bottom).offset(0);
            }
        }];
    }
    return _chartView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self removeCurrentDropView];
}

- (void)removeCurrentDropView {
    [[UIApplication sharedApplication].keyWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NNDropListView class]]) {
            [obj removeFromSuperview];
        }
    }];
}

- (NNTradeDetailView *)tradeDetailView{
    if (!_tradeDetailView) {
        _tradeDetailView = [[NNTradeDetailView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 90)];
    }
    return _tradeDetailView;
}

#pragma mark - Y_StockChartViewDataSource
- (id)stockDatasWithIndex:(NSInteger)index {
    NSString *type;
    switch (index) {
        case 0: {
            type = @"1min";
        }
            break;
        case 1:
        {
            type = @"1min";
        }
            break;
        case 2:
        {
            type = @"1min";
        }
            break;
        case 3:
        {
            type = @"5min";
        }
            break;
        case 4:
        {
            type = @"30min";
        }
            break;
        case 5:
        {
            type = @"1hour";
        }
            break;
        case 6:
        {
            type = @"1day";
        }
            break;
        case 7:
        {
            type = @"1week";
        }
            break;
            
        default:
            type = @"1min";
            break;
    }
    self.currentIndex = index;
    self.type = type;
    if(![self.modelsDic objectForKey:type]) {
        [self reloadData];
    } else {
        return [self.modelsDic objectForKey:type].models;
    }
    return nil;
}

#pragma mark - load k_Line data
- (void)reloadData {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
     param[@"type"] = self.type;
     param[@"market"] = @"btc_usdt";
     param[@"size"] = @"10000";
     [[AFHTTPSessionManager manager] GET:@"http://api.bitkk.com/data/v1/kline" parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     Y_KLineGroupModel *groupModel = [Y_KLineGroupModel objectWithArray:responseObject[@"data"]];
     [self.modelsDic setObject:groupModel forKey:self.type];
     NSLog(@"%@",groupModel);
     [self.chartView reloadData];
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     
     }];

   /* NSString *period = @"";
    switch (self.currentIndex) {
        case 0:
            period = @"1";
            break;
        case 1:
            period = @"1";
            break;
        case 2:
            period = @"1";
            break;
        case 3:
            period = @"5";
            break;
        case 4:
            period = @"30";
            break;
        case 5:
            period = @"60";
            break;
        case 6:
            period = @"1440";
            break;
        case 7:
            period = @"10080";
            break;
        default:
            break;
    }
    NNHWeakSelf(self);
    [[[NNAPIKlineTool alloc] initWithMarketCoinID:@"2" period:period] nnh_StartRequestWithSucBlock:^(NSDictionary *responseDic) {
        [weakself.tradeDetailView refreshWithData:responseDic[@"data"][@"coin_price"]];
        Y_KLineGroupModel *groupModel = [Y_KLineGroupModel objectWithArray:responseDic[@"data"][@"list"]];
        [self.modelsDic setObject:groupModel forKey:self.type];
        NNHLog(@"%@",groupModel);
        [self.chartView reloadData];
    } failBlock:^(NNHRequestError *error) {
        
    } isCached:NO];
    */
    
}

@end
