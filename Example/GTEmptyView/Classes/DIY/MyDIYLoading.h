//
//  MyDIYLoading.h
//  GTEmptyView_Example
//
//  Created by liuxc on 2018/6/28.
//  Copyright © 2018年 liuxc123. All rights reserved.
//

#import <GTEmptyView/GTEmptyView.h>

@interface MyDIYLoading : GTLoadingView

+ (instancetype)diyNormalLoading;

+ (instancetype)diyGifLoading;

+ (instancetype)diyImageLoading;

+ (instancetype)diyImageArrayLoading;

@end
