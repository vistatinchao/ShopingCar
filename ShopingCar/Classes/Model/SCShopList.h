//
//  SCShopList.h
//  ShopingCar
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//  SCShopList模型

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface SCShopList : NSObject
/**  模型价格 */
@property (copy, nonatomic,nullable) NSString *money;
/**  模型名字 */
@property (copy, nonatomic,nullable) NSString *name;
/**  模型图片 */
@property (copy, nonatomic,nullable) NSString *image;
/**  模型购物车数量 */
@property (nonatomic,assign) NSUInteger count;
/**  模型购物车cell高度 */
@property (nonatomic,assign) CGFloat cellHeight;

@end
NS_ASSUME_NONNULL_END
