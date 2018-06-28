//
//  MyDIYEmpty.h
//  GTEmptyView_Example
//
//  Created by liuxc on 2018/6/28.
//  Copyright © 2018年 liuxc123. All rights reserved.
//

#import <GTEmptyView/GTEmptyView.h>

@interface MyDIYEmpty : GTEmptyView

+ (instancetype)diyNoDataEmpty;

+ (instancetype)diyNoNetworkEmptyWithTarget:(id)target action:(SEL)action;

+ (instancetype)diyCustomEmptyViewWithTarget:(id)target action:(SEL)action;

@end
