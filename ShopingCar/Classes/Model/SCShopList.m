//
//  SCShopList.m
//  ShopingCar
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "SCShopList.h"

@implementation SCShopList

- (CGFloat)cellHeight{

    return SCCellMargin+[self.name sizeWithString:self.name andFontSize:[UIFont boldSystemFontOfSize:SCCellNameFontSize] andMaxSize:CGSizeMake(SCScreenW-3*SCCellMargin-SCCellImageWH, CGFLOAT_MAX)].height+SCCellMargin+SCCellPlusBtnAndMinBtnWH+SCCellMargin;
}

@end
