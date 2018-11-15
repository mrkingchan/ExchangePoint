//
//  InitMethod.h
//  Demo
//
//  Created by 云笈 on 2018/11/14.
//  Copyright © 2018年 Chan. All rights reserved.
//

#ifndef InitMethod_h
#define InitMethod_h


/**
 return a common UIView with given configuration
 
 @param superView superView description
 @param rect rect description
 @param backgroundColor backgroundColor description
 @param clipToBounds clipToBounds description
 @param radius radius description
 @return  a common UIView with given configuration
 */
CG_INLINE UIView *kViewWithConfiguraion(id superView,
                                        CGRect rect,
                                        UIColor *backgroundColor,
                                        BOOL clipToBounds,
                                        CGFloat radius) {
    UIView *subView = [[UIView alloc] initWithFrame:rect];
    subView.backgroundColor = backgroundColor;
    subView.clipsToBounds  = clipToBounds;
    if (clipToBounds) {
        subView.layer.cornerRadius = radius;
    }
    if (superView) {
        [superView addSubview:subView];
    }
    return subView;
}

/**
 return imageView with given configuration
 
 @param superView superView description
 @param rect rect description
 @param image image description
 @param contentModel contentModel description
 @return imageView with given configration
 */
CG_INLINE UIImageView *kImageViewWithConfiguration(id superView,CGRect rect,UIImage *image,UIViewContentMode contentModel) {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = image;
    imageView.contentMode = contentModel;
    if (superView) {
        [superView addSubview:imageView];
    }
    return imageView;
}

/**
 return button With radius
 
 @param superView superView description
 @param rect rect description
 @param textColor textColor description
 @param backgroundColor backgroundColor description
 @param content content description
 @param textFont textFont description
 @param radius radius description
 @return button With radius
 */
CG_INLINE UIButton *kButtonWithRadiusConfiguration(id superView,CGRect rect,UIColor *textColor,UIColor *backgroundColor,NSString *content,UIFont *textFont,CGFloat radius) {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    button.titleLabel.font = textFont;
    button.titleLabel.textAlignment = 1;
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitle:content forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    if (superView) {
        [superView addSubview:button];
    }
    button.clipsToBounds = YES;
    button.layer.cornerRadius = radius;
    return button;
}


/**
 return a button With given configuration
 
 @param superView superView description
 @param rect rect description
 @param textColor textColor description
 @param backgroundColor backgroundColor description
 @param content content description
 @param textFont textFont description
 @return  return a button With given configuration
 
 */
CG_INLINE UIButton *kButtonWithCommonConfiguration(id superView,CGRect rect,UIColor *textColor,UIColor *backgroundColor,NSString *content,UIFont *textFont) {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    button.titleLabel.font = textFont;
    button.titleLabel.textAlignment = 1;
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitle:content forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    if (superView) {
        [superView addSubview:button];
    }
    return button;
}


/**
 return the label with radiuds
 
 @param superView superView description
 @param rect rect description
 @param backgroundColor backgroundColor description
 @param textColor textColor description
 @param textAlignment textAlignment description
 @param font font description
 @param text text description
 @param cornerRadius cornerRadius description
 @return return the label with radiuds
 */
CG_INLINE  UILabel *kLabelWithCornerRadius(id superView,
                                           CGRect rect,
                                           UIColor *backgroundColor,
                                           UIColor *textColor,
                                           NSTextAlignment textAlignment,
                                           UIFont *font,
                                           NSString *text,CGFloat cornerRadius) {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.font = font;
    label.textColor = textColor;
    label.text = text;
    label.textAlignment = textAlignment;
    label.backgroundColor = backgroundColor;
    if (superView) {
        [superView addSubview:label];
    }
    label.clipsToBounds = YES;
    label.layer.cornerRadius = cornerRadius;
    return label;
}


/**
 return the label with given configuration
 
 @param superView superView description
 @param rect rect description
 @param backgroundColor backgroundColor description
 @param textColor textColor description
 @param textAlignment textAlignment description
 @param font font description
 @param text text description
 @return the label with given configuration
 */
CG_INLINE UILabel *kLabelWithConfiguration(id superView,
                                            CGRect rect,
                                            UIColor *backgroundColor,
                                            UIColor *textColor,
                                            NSTextAlignment textAlignment,
                                            UIFont *font,
                                            NSString *text) {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.font = font;
    label.textColor = textColor;
    label.text = text;
    label.textAlignment = textAlignment;
    label.backgroundColor = backgroundColor;
    if (superView) {
        [superView addSubview:label];
    }
    return label;
    
}
CG_INLINE UICollectionView *kCollectionViewWithConfiguraiton(id superView,CGRect rect,UICollectionViewFlowLayout *layout,Class cellClass,id <UICollectionViewDataSource>dataSource,id  <UICollectionViewDelegate>delegate) {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    if (dataSource) {
        collectionView.dataSource = dataSource;
    }
    if (delegate) {
        collectionView.delegate = delegate;
    }
    if (cellClass) {
        [collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    }
    if (superView) {
        [superView addSubview:collectionView];
    }
    return collectionView;
}

/**
 create tableView with given configuration
 @param superView superView
 @param rect rect description
 @param style style description
 @param <UITableViewDataSource>dataSource <UITableViewDataSource>dataSource description
 @param <UITableViewDelegate>delegate <UITableViewDelegate>delegate description
 @param cellClass cellClass description
 @return tableView with the given configuration
 */
CG_INLINE  UITableView *kTableViewWithConfiguration(id superView,
                                                    CGRect rect,
                                                    UITableViewStyle style,
                                                    id <UITableViewDataSource>dataSource,
                                                    id <UITableViewDelegate>delegate,
                                                    Class cellClass) {
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:style];
    if (delegate) {
        tableView.delegate = delegate;
    }
    if (dataSource) {
        tableView.dataSource = dataSource;
    }
    if (superView) {
        [superView addSubview:tableView];
    }
    tableView.tableFooterView = [UIView new];
    tableView.backgroundColor = [UIColor whiteColor];
    [tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    return tableView;
}
#endif /* InitMethod_h */
