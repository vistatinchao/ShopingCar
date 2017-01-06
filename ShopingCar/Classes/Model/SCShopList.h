//
//  SCShopList.h
//  ShopingCar
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
// SCShopList模型

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface SCShopList : NSObject
/**  模型价格 */
@property (copy, nonatomic) NSString *money;
/**  模型名字 */
@property (copy, nonatomic) NSString *name;
/**  模型图片 */
@property (copy, nonatomic) NSString *image;
/**  模型购物车数量 */
@property (nonatomic,assign) NSUInteger count;


@end
NS_ASSUME_NONNULL_END
