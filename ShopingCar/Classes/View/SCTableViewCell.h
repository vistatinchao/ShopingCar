//
//  SCTableViewCell.h
//  ShopingCar
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SCShopList;
@interface SCTableViewCell : UITableViewCell

/** 商品模型属性 */
@property (nonatomic,strong,nullable) SCShopList *shopList;

+(__kindof SCTableViewCell *)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath;
@end
NS_ASSUME_NONNULL_END
