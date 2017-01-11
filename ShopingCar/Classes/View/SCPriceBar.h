//
//  SCPriceBar.h
//  ShopingCar
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCPriceBar;
@protocol SCPriceBarDelegate<NSObject>
@optional

/**
 清除购物车
 */
-(void)priceBarDidClearShopCar:(SCPriceBar *)priceBar;
@end
@interface SCPriceBar : UIView
/**
 初始化
 */
+(instancetype)priceBar;
/**
 代理属性
 */
@property (nonatomic,weak)id<SCPriceBarDelegate>delegate;

@end
