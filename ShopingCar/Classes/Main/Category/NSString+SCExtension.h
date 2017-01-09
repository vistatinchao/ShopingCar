//
//  NSString+SCExtension.h
//  ShopingCar
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SCExtension)
- (CGSize)sizeWithString:(nullable NSString *)string andFontSize:(nullable UIFont *)font andMaxSize:( CGSize)size;
@end
