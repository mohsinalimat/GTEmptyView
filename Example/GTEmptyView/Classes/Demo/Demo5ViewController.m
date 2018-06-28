//
//  Demo5ViewController.m
//  GTEmptyView_Example
//
//  Created by liuxc on 2018/6/27.
//  Copyright © 2018年 liuxc123. All rights reserved.
//

#import "Demo5ViewController.h"
#import "DemoEmptyView.h"

@interface Demo5ViewController ()

@end

@implementation Demo5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MainColor(247, 247, 247);


    self.view.gt_emptyView = [DemoEmptyView emptyViewWithImageStr:@"noData" titleStr:@"啥都没有" detailStr:@"直接为VC的View添加占位图"];

    GTLoadingView *loadingView = [GTLoadingView loadingViewWithImageStr:@"loadinggif4.gif" titleStr:@"加载中"];
    loadingView.imageSize = CGSizeMake(150, 150);
    self.view.gt_loadingView = loadingView;

    //显示加载
    [self.view gt_startLoading];

    //关闭加载
    [self.view gt_endLoading];

    //    //显示占位图
    // [self.view gt_showEmptyView];


    //    //隐藏占位图
    //    [self.view gt_hideEmptyView];
}



@end
