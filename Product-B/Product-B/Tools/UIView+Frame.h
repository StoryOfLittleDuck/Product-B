//
//  UIView+Frame.h
//  Product-B
//
//  Created by 林建 on 16/7/11.
//  Copyright © 2016年 林建. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface UIView (Frame)
@property (nonatomic , assign) CGFloat left;

@property (nonatomic , assign, readonly) CGFloat right;

@property (nonatomic , assign) CGFloat width;

@property (nonatomic , assign) CGFloat height;

@property (nonatomic , assign) CGFloat top;

@property (nonatomic , assign ,readonly) CGFloat bottom;

@property (nonatomic , assign) CGFloat centerX;

@property (nonatomic , assign) CGFloat centerY;
@end
