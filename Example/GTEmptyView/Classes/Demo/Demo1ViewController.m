//
//  Demo1ViewController.m
//  GTEmptyView_Example
//
//  Created by liuxc on 2018/6/27.
//  Copyright © 2018年 liuxc123. All rights reserved.
//

#import "Demo1ViewController.h"

@interface Demo1ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation Demo1ViewController
{
    NSInteger IndexNumber;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.barTintColor = MainColor(240, 240, 240);
    self.navigationController.navigationBar.tintColor = MainColor(70, 70, 70);

    [self.navigationController.navigationBar setTitleTextAttributes: @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName:MainColor(70, 70, 70)}];

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = MainColor(240, 240, 240);
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.dataArray = [NSMutableArray array];

    [self setupUI];

    [self requestData];
}

- (void)setupUI{

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = MainColor(247, 247, 247);
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

    //1 使用框架UI样式，直接调用
    self.tableView.gt_emptyView = [GTEmptyView emptyViewWithImageStr:@"noData"
                                                            titleStr:@"暂无数据，点击重新加载"
                                                           detailStr:@""];

    self.tableView.gt_loadingView = [GTLoadingView loadingViewWithLoadingAnimationType:GTLoadingAnimationTypeDot
                                                                              titleStr:@"加载中"];

//    GTLoadingView *loadingView = [GTLoadingView loadingViewWithImageStr:@"loadinggif4.gif" titleStr:@"加载中"];

    NSArray *array = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19"];
    GTLoadingView *loadingView = [GTLoadingView loadingViewWithImageStrArray:array titleStr:@"加载中..."];
    loadingView.imageSize = CGSizeMake(100, 100);
    self.tableView.gt_loadingView = loadingView;


    //2 使用自定义UI样式，MyDIYEmpty 是继承自LYEmptyView 的自定义的 empty
    //2-1
//    self.tableView.gt_emptyView = [MyDIYEmpty emptyViewWithImageStr:@"noData"
//                                                           titleStr:@"暂无数据"
//                                                          detailStr:@"请检查您的网络连接是否正确!"];
//
//    //2-2 和2-1方式一样效果,只是多封装了一下
//    //    self.tableView.gt_emptyView = [MyDIYEmpty diyNoDataEmpty];
//
//    //emptyView内容上的点击事件监听
    __weak typeof(self)weakSelf = self;
    [self.tableView.gt_emptyView setTapContentViewBlock:^(){
        [weakSelf requestData];
    }];
}

#pragma mark - -------------- TableView DataSource -----------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 52;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kStatusBarHeight + 44 + 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *iden = @"cellIden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }

    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)requestData{

    [self.tableView gt_startLoading];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        sleep(3);

        [self.dataArray removeAllObjects];

        NSArray *arr = @[@"数据1", @"数据2", @"数据3"];
        [self.dataArray addObjectsFromArray:arr];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView gt_endLoading];
        });
    });
}

- (IBAction)loadData:(id)sender {
//    [self.dataArray addObject:@"数据"];
//    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];

    [self requestData];

}
- (IBAction)clearData:(id)sender {
    if (self.dataArray.count) {
        [self.dataArray removeObjectAtIndex:0];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];

        //    [self.dataArray removeAllObjects];
        //    [self.tableView reloadData];
    }
}



@end
