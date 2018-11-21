//
//  UIViewController+Toast.m
//  Demo
//
//  Created by 云笈 on 2018/11/20.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "UIViewController+Toast.h"

@implementation UIViewController (Toast)

- (void)showMessage:(NSString *)message {
    UILabel *textLabel = kLabelWithConfiguration(self.view, CGRectMake(0, -kScreenHeight, kScreenWidth, kScreenHeight), [UIColor clearColor], [UIColor whiteColor], 1, kfont(14), message);
    textLabel.userInteractionEnabled = YES;
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
        CGRect frame = textLabel.frame;
        frame.origin.y = 0;
        textLabel.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}

@end
