//
//  Y-StockChartView.m
//  BTC-Kline
//
//  Created by yate1996 on 16/4/30.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_StockChartView.h"
#import "Y_KLineView.h"
#import "Masonry.h"
#import "Y_StockChartSegmentView.h"
#import "Y_StockChartGlobalVariable.h"
#import "NNKlineSegementView.h"
#import "NNDropListView.h"

@interface Y_StockChartView()

/**
 *  K线图View
 */
@property (nonatomic, strong) Y_KLineView *kLineView;

/**
 *  图表类型
 */
@property(nonatomic,assign) Y_StockChartCenterViewType currentCenterViewType;

/**
 *  当前索引
 */
@property(nonatomic,assign,readwrite) NSInteger currentIndex;

@property (nonatomic, strong) NNKlineSegementView *segementView;


@end


@implementation Y_StockChartView {
     __block NSInteger _selectedIndex;  //选中索引
}

#pragma mark - initialize method
- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.segementView];
        //默认日线
        [self.segementView setSelectedIndex:3];
        _selectedIndex = 3;
    }
    return self;
}

#pragma mark - lazy load
- (Y_KLineView *)kLineView {
    if(!_kLineView) {
        _kLineView = [Y_KLineView new];
        [self addSubview:self.kLineView];
        [_kLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.top.equalTo(self.segementView.mas_bottom);
        }];
    }
    return _kLineView;
}

- (NNKlineSegementView *)segementView{
    if (!_segementView) {
        _segementView = [NNKlineSegementView nKlineSegementViewWithArray:@[@"指标",@"MACD",@"5分",@"日线",@"周线"] complete:^(NSInteger index1) {
            [self removeCurrentDropView];
            if (index1 <=1 ) {
                //主指标和副指标
                [NNDropListView nnDropListViewWithArray:index1 == 0 ?@[@"MA",@"EMA",@"BOLL"] : @[@"MACD",@"KDJ"] complete:^(NSString * _Nonnull subStr, NSInteger index) {
                    [_segementView replaceTagWithContent:subStr index:index1];
                    _selectedIndex = index1 == 0 ? index + 103: 100 + index;
                    if (_selectedIndex == 105 ) {
                        [Y_StockChartGlobalVariable setisBOLLLine:Y_StockChartTargetLineStatusBOLL];
                        self.kLineView.targetLineStatus = 105;
                        [self.kLineView reDraw];
                    } else {
                        [Y_StockChartGlobalVariable setisEMALine:_selectedIndex];
                        self.kLineView.targetLineStatus = _selectedIndex;
                        [self.kLineView reDraw];
                    }
                }];
            } else if (index1>=2) {
                //分时
                if (index1 == 2) {
                    [NNDropListView nnDropListViewWithArray:@[@"1分",@"5分",@"30分",@"60分"]
                                                   complete:^(NSString * _Nonnull subStr, NSInteger index) {
                                                       _selectedIndex = index + 2;
                                                       [_segementView replaceTagWithContent:subStr index:index1];
                                                       [self loadkLineDataAndRefresh];
                                                   }];
                } else if (index1 == 3 || index1 == 4) {
                    //日线 + 周线
                    _selectedIndex = index1 + 3;
                    [self loadkLineDataAndRefresh];
                }     
            }
        }];
    }
    return _segementView;
}

#pragma mark - load kline Data and refresh Kline
- (void)loadkLineDataAndRefresh {
    if (_selectedIndex < 100) {
        if (_dataSource && [_dataSource respondsToSelector:@selector(stockDatasWithIndex:)]) {
            id stockData = [_dataSource stockDatasWithIndex:_selectedIndex];
            if (!stockData) {
                return ;
            }
            Y_StockChartViewItemModel *itemModel = self.itemModels[_selectedIndex];
            Y_StockChartCenterViewType type = itemModel.centerViewType;
            if(type != self.currentCenterViewType) {
                self.currentCenterViewType = type;
                switch (type) {
                    case Y_StockChartcenterViewTypeKline: {
                        self.kLineView.hidden = NO;
                    }
                        break;
                    default:
                        break;
                }
            }
            if(type == Y_StockChartcenterViewTypeOther) {
                
            } else {
                //刷新k线图
                self.kLineView.kLineModels = (NSArray *)stockData;
                self.kLineView.MainViewType = type;
                [self.kLineView reDraw];
            }
        }
    }
}

- (void)setItemModels:(NSArray *)itemModels {
    _itemModels = itemModels;
    if(itemModels){
        /*NSMutableArray *items = [NSMutableArray array];
         for(Y_StockChartViewItemModel *item in itemModels){
         [items addObject:item.title];
         }
         self.segmentView.items = items;
         */
        Y_StockChartViewItemModel *firstModel = itemModels.firstObject;
        self.currentCenterViewType = firstModel.centerViewType;
    }
    
    if(self.dataSource){
//        self.segmentView.selectedIndex = 2;
        _selectedIndex = 6;
        [self loadkLineDataAndRefresh];
    }
}

- (void)setDataSource:(id<Y_StockChartViewDataSource>)dataSource
{
    _dataSource = dataSource;
    if(self.itemModels){
//        self.segmentView.selectedIndex = 2;
        _selectedIndex = 6;
        [self loadkLineDataAndRefresh];
    }
}

- (void)reloadData {
//    self.segmentView.selectedIndex = self.segmentView.selectedIndex;
    [self loadkLineDataAndRefresh];
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

/*
#pragma mark - 代理方法
- (void)y_StockChartSegmentView:(Y_StockChartSegmentView *)segmentView clickSegmentButtonIndex:(NSInteger)index
{
    self.currentIndex = index;
    
    if (index == 105) {
        
        [Y_StockChartGlobalVariable setisBOLLLine:Y_StockChartTargetLineStatusBOLL];
        self.kLineView.targetLineStatus = index;
        [self.kLineView reDraw];
        //        [self bringSubviewToFront:self.segmentView];
        
    } else  if(index >= 100 && index != 105) {
        
        [Y_StockChartGlobalVariable setisEMALine:index];
        self.kLineView.targetLineStatus = index;
        [self.kLineView reDraw];
        //        [self bringSubviewToFront:self.segmentView];
        
    } else {
        if(self.dataSource && [self.dataSource respondsToSelector:@selector(stockDatasWithIndex:)])
        {
            id stockData = [self.dataSource stockDatasWithIndex:index];
            
            if(!stockData) return;
            
            Y_StockChartViewItemModel *itemModel = self.itemModels[index];
            Y_StockChartCenterViewType type = itemModel.centerViewType;
            
            
            if(type != self.currentCenterViewType){
                
                //移除当前View，设置新的View
                self.currentCenterViewType = type;
                switch (type) {
                    case Y_StockChartcenterViewTypeKline:{
                        self.kLineView.hidden = NO;
                        //                        [self bringSubviewToFront:self.segmentView];
                        
                    }
                        break;
                        
                    default:
                        break;
                }
            }
            
            if(type == Y_StockChartcenterViewTypeOther){
                
            } else {
                self.kLineView.kLineModels = (NSArray *)stockData;
                self.kLineView.MainViewType = type;
                
                // 设置当前选中种类
                if (index == 5) {
                    self.kLineView.kLineType = KLineType1Week;
                }else if (index == 3) {
                    self.kLineView.kLineType = KLineType30Min;
                }else if (index == 4) {
                    self.kLineView.kLineType = KLineType1Day;
                }else{
                    self.kLineView.kLineType = KLineType1Min;
                }
                
                [self.kLineView reDraw];
            }
            //            [self bringSubviewToFront:self.segmentView];
        }
    }
    
}
 */

@end


/************************ItemModel类************************/
@implementation Y_StockChartViewItemModel

+ (instancetype)itemModelWithTitle:(NSString *)title type:(Y_StockChartCenterViewType)type
{
    Y_StockChartViewItemModel *itemModel = [Y_StockChartViewItemModel new];
    itemModel.title = title;
    itemModel.centerViewType = type;
    return itemModel;
}

@end
