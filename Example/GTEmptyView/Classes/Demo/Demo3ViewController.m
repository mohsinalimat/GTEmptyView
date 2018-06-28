//
//  Demo3ViewController.m
//  GTEmptyView_Example
//
//  Created by liuxc on 2018/6/27.
//  Copyright © 2018年 liuxc123. All rights reserved.
//

#import "Demo3ViewController.h"
#import "DemoLoadingView.h"
#import "DemoEmptyView.h"

@interface Demo3ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) DemoEmptyView *noDataView;
@property (nonatomic, strong) DemoEmptyView *noNetworkView;

@property (nonatomic, assign) NSInteger index;

@end

@implementation Demo3ViewController

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
    self.tableView.backgroundColor = MainColor(240, 240, 240);
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

    DemoLoadingView *loading = [DemoLoadingView diyLoadingView];
    self.tableView.gt_loadingView = loading;
}

- (DemoEmptyView *)noDataView{
    if (!_noDataView) {
        _noDataView = [DemoEmptyView diyEmptyView];
    }
    return _noDataView;
}
- (DemoEmptyView *)noNetworkView{
    if (!_noNetworkView) {
        _noNetworkView = [DemoEmptyView diyEmptyActionViewWithTarget:self action:@selector(loadTestData)];
    }
    return _noNetworkView;
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

        sleep(1);

        [self.dataArray removeAllObjects];

        NSArray *arr = @[@"数据1", @"数据2", @"数据3", @"数据4", @"数据5"];
        [self.dataArray addObjectsFromArray:arr];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView gt_endLoading];
        });
    });
}


- (IBAction)loadData:(id)sender {
    [self requestData];
}

- (IBAction)clearData:(id)sender {
    _index ++;

    if (_index%2==0) {//模拟无数据
        self.tableView.gt_emptyView = self.noDataView;

    }else{//模拟无网络

        //打开注释，可修改指定的属性
        //        self.noNetworkView.imageStr = @"noData";
        //        self.noNetworkView.titleStr = @"没有网络连接啦";
        //        self.noNetworkView.detailStr = @"请检查你的手机联网情况，你手机的系统设置情况，是否关闭了数据访问！";
        //        self.noNetworkView.btnTitleStr = @"检查好了，加载吧";

        self.tableView.gt_emptyView = self.noNetworkView;
    }
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
    [self.tableView gt_endLoading];
}


- (void)loadTestData{

    [self.tableView gt_startLoading];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self clearData:nil];
        });
    });

}

@end
