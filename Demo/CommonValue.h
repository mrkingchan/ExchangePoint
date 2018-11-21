//
//  CommonValue.h
//  Demo
//
//  Created by 云笈 on 2018/11/2.
//  Copyright © 2018年 Chan. All rights reserved.
//

#ifndef CommonValue_h
#define CommonValue_h

CG_INLINE UIFont * kfont(CGFloat  fontSize) {
    return [UIFont systemFontOfSize:fontSize];
}

/**
  build a viewController with given ocnfiguration

 @param class class description
 @param titleStr titleStr description
 @param normalImage normalImage description
 @param selectedImage selectedImage description
 @return return a viewController with configuration
 */
CG_INLINE UIViewController * kbuildViewControllerWithConfiguration(Class class,NSString *titleStr,UIImage *normalImage,UIImage * selectedImage) {
    UIViewController *viewController = [class new];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titleStr
                                                       image:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    viewController.tabBarItem = item;
    return  viewController;
}


#endif /* CommonValue_h */
