//
//  NSString+SCExtension.m
//  ShopingCar
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "NSString+SCExtension.h"

@implementation NSString (SCExtension)

#pragma mark  根据文字自适应尺寸
- (CGSize)sizeWithString:(nullable NSString *)string andFontSize:(nullable UIFont *)font andMaxSize:( CGSize)size{
    
    NSMutableDictionary *attributeDict = [NSMutableDictionary dictionary];
    attributeDict[NSFontAttributeName] = font;
    return [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeDict context:nil].size;
}
@end
