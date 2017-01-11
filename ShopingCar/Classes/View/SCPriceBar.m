//
//  SCPriceBar.m
//  ShopingCar
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
// 底部结算购物车栏

#import "SCPriceBar.h"
#import "SCShopList.h"
@interface SCPriceBar()
@property (weak, nonatomic) IBOutlet UILabel *totalMoneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *shopBtn;
@end

@implementation SCPriceBar
#pragma mark 系统方法
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (void)dealloc{
    [SCNotiCenter removeObserver:self];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.8];
    [SCNotiCenter addObserver:self selector:@selector(plusUpdateTotalMoney:) name:SCCellDidClickPlusBtnUpdatePriceBar object:nil];
    [SCNotiCenter addObserver:self selector:@selector(minUpdateTotalMoney:) name:SCCellDidClickMinBtnUpdatePriceBar object:nil];

}
#pragma mark 接受通知回调

/**
 点击了plusBtn
 */
- (void)plusUpdateTotalMoney:(NSNotification *)noti{
    SCShopList *shop =noti.userInfo[SCKeyCellDidClickPlusBtnOrMinBtnUpdatePriceBar];
    NSInteger totalCount = self.totalMoneyLabel.text.integerValue;
    totalCount+=shop.money.integerValue;
     // 更新总价状态
    self.totalMoneyLabel.text = [NSString stringWithFormat:@"%zd",totalCount];
    // 更新购买按钮状态
    self.shopBtn.enabled = YES;
}

/**
 点击了minBtn
 */
- (void)minUpdateTotalMoney:(NSNotification *)noti{
    SCShopList *shop =noti.userInfo[SCKeyCellDidClickPlusBtnOrMinBtnUpdatePriceBar];
    NSInteger totalCount = self.totalMoneyLabel.text.integerValue;
    totalCount-=shop.money.integerValue;
    // 更新总价状态
    self.totalMoneyLabel.text = [NSString stringWithFormat:@"%zd",totalCount];
    // 更新购买按钮状态
    self.shopBtn.enabled = totalCount>0;

}


/**
 初始化
 */
+(instancetype)priceBar{

    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil ] lastObject];
}

#pragma mark 清除购物车
- (IBAction)clearShopingCar:(UIButton *)sender {
    if ([self.totalMoneyLabel.text isEqualToString:@"0"]) {
        return;
    }
    // 更新总价状态
    self.totalMoneyLabel.text = @"0";
    // 更新购买按钮状态
    self.shopBtn.enabled = NO;
    //通知代理刷新ui
    if ([self.delegate respondsToSelector:@selector(priceBarDidClearShopCar:)]) {
        [self.delegate priceBarDidClearShopCar:self];
    }
}
#pragma mark 购买按钮
- (IBAction)shop:(UIButton *)sender {
    SCLogFunc;
}

@end
