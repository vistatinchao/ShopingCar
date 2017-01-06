//
//  SCCircleButton.m
//  ShopingCar
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//  SCCircleButton

#import "SCCircleButton.h"

@implementation SCCircleButton


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化操作
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor redColor].CGColor;

    }
    return self;
}

+ (SCCircleButton *)circleButton{

    return [[self alloc]init];
}


- (void)layoutSubviews{

    [super layoutSubviews];
    self.layer.cornerRadius = self.width*0.5;
}

@end
