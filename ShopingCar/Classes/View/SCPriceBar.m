//
//  SCPriceBar.m
//  ShopingCar
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
// 底部结算购物车栏

#import "SCPriceBar.h"

@implementation SCPriceBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

+(instancetype)priceBar
{
    return [[self alloc]init];
}

@end
