//
//  SCViewController.m
//  ShopingCar
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//  SCViewController

#import "SCViewController.h"
#import "SCShopList.h"
#import "SCTableViewCell.h"
#import "SCPriceBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCViewController ()<UITableViewDelegate,UITableViewDataSource,SCPriceBarDelegate>

/** 商品模型数组 */
@property (nonatomic,strong)NSMutableArray<SCShopList *> *shops;
/** 商品tableview */
@property (nonatomic,weak)UITableView *scTableView;
/** 商品购物车结算栏 */
@property (nonatomic,weak)SCPriceBar *priceBar;

@end

@implementation SCViewController


#pragma mark 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"ShopingCar";
    [self initSubView];
}

#pragma mark 布局子控件
- (void)initSubView{

    self.automaticallyAdjustsScrollViewInsets = NO;
    // tableview
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:tableView];
    tableView.contentInset = UIEdgeInsetsMake(SCNavBarHeight, 0, SCPriceTabBarHeight, 0);
    tableView.scrollIndicatorInsets = tableView.contentInset;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[SCTableViewCell class] forCellReuseIdentifier:SCCellID];
    self.scTableView = tableView;

    // priceBar
    SCPriceBar *priceBar = [SCPriceBar priceBar];
    [self.view addSubview:priceBar];
    priceBar.delegate = self;
    priceBar.height = SCPriceTabBarHeight;
    priceBar.width = SCScreenW;
    priceBar.y = self.view.height-SCPriceTabBarHeight;
    self.priceBar = priceBar;
}

#pragma mark tableView --Datasource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.shops.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SCTableViewCell *cell = [SCTableViewCell cellWithTableView:tableView andIndexPath:indexPath];
    cell.shopList = self.shops[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return self.shops[indexPath.row].cellHeight;
}
#pragma mark priceBarDelegate
- (void)priceBarDidClearShopCar:(SCPriceBar *)priceBar{
    // 清空数据源
    for (SCShopList *shop in self.shops) {
        shop.count=0;
    }
    // 刷新表格
    [self.scTableView reloadData];
}


#pragma mark lazy
- (NSMutableArray<SCShopList *> *)shops{
    if (!_shops) {
        _shops = [SCShopList mj_objectArrayWithFilename:@"wine.plist"];

    }
    return _shops;
}
@end
NS_ASSUME_NONNULL_END
