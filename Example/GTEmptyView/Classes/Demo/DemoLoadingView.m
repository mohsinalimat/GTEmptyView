//
//  DemoLoadingView.m
//  GTEmptyView_Example
//
//  Created by liuxc on 2018/6/27.
//  Copyright © 2018年 liuxc123. All rights reserved.
//

#import "DemoLoadingView.h"

@implementation DemoLoadingView

+ (instancetype)diyLoadingView {
    DemoLoadingView *loading = [DemoLoadingView loadingViewWithImageStr:@"loadinggif4.gif" titleStr:@"加载中"];
    loading.imageSize = CGSizeMake(150, 150);
    return loading;
}


@end
