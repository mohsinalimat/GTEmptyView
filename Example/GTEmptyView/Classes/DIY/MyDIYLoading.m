//
//  MyDIYLoading.m
//  GTEmptyView_Example
//
//  Created by liuxc on 2018/6/28.
//  Copyright © 2018年 liuxc123. All rights reserved.
//

#import "MyDIYLoading.h"

@implementation MyDIYLoading

+ (instancetype)diyNormalLoading {
    return [MyDIYLoading loadingViewWithLoadingAnimationType:GTLoadingAnimationTypeDot titleStr:@"加载中"];
}

+ (instancetype)diyGifLoading {
    MyDIYLoading *loading = [MyDIYLoading loadingViewWithImageStr:@"loadinggif2.gif" titleStr:@"加载中"];
    loading.imageSize = CGSizeMake(150, 150);
    return loading;
}

+ (instancetype)diyImageLoading {
    MyDIYLoading *loading = [MyDIYLoading loadingViewWithImageStr:@"loadinggif.gif" titleStr:@"加载中"];
    loading.imageSize = CGSizeMake(150, 150);
    return loading;
}


+ (instancetype)diyImageArrayLoading {
    NSArray *array = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19"];
    MyDIYLoading *loading = [MyDIYLoading loadingViewWithImageStrArray:array titleStr:@"加载中"];
    loading.imageSize = CGSizeMake(150, 150);
    return loading;
}

@end
