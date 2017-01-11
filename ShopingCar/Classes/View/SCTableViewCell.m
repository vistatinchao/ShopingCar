//
//  SCTableViewCell.m
//  ShopingCar
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//  SCTableViewCell

#import "SCTableViewCell.h"
#import "SCShopList.h"
#import "SCCircleButton.h"

@interface SCTableViewCell()
/** 商品cell图片 */
@property (nonatomic,weak)UIImageView *sc_imageView;
/** 商品cell名字 */
@property (nonatomic,weak)UILabel *sc_nameLabel;
/** 商品cell价格 */
@property (nonatomic,weak)UILabel *sc_priceLabel;
/** 商品cell+按钮 */
@property (nonatomic,weak)SCCircleButton *sc_plusBtn;
/** 商品cell——按钮 */
@property (nonatomic,weak)SCCircleButton *sc_minBtn;
/** 商品cell数量 */
@property (nonatomic,weak)UILabel *sc_countLabel;
/** 所在的tableview */
@property (nonatomic,weak)UITableView *tableView;
@end

@implementation SCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 布局子空间
        [self sc_layoutSubView];
    }
    return self;
}
#pragma mark private--  add子控件
- (void)sc_layoutSubView{

    /** 商品cell图片 */
    UIImageView *sc_imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:sc_imageView];
   // sc_imageView.contentMode = UIViewContentModeCenter;
    self.sc_imageView = sc_imageView;

    /** 商品cell名字 */
    UILabel *sc_nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:sc_nameLabel];
    sc_nameLabel.numberOfLines = 0;
    sc_nameLabel.font = [UIFont boldSystemFontOfSize:SCCellNameFontSize];
    self.sc_nameLabel = sc_nameLabel;

    /** 商品cell价格 */
    UILabel *sc_priceLabel = [[UILabel alloc]init];
    [self.contentView addSubview:sc_priceLabel];
    sc_priceLabel.font = [UIFont systemFontOfSize:18];
    sc_priceLabel.textColor = [UIColor orangeColor];
    self.sc_priceLabel = sc_priceLabel;

    /** 商品cell+按钮 */
    SCCircleButton *sc_plusBtn = [SCCircleButton circleButton];
    [self.contentView addSubview:sc_plusBtn];
    [sc_plusBtn setTitle:@"+" forState:UIControlStateNormal];
    [sc_plusBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:30]];
    [sc_plusBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [sc_plusBtn addTarget:self action:@selector(countChange:) forControlEvents:UIControlEventTouchUpInside];
    self.sc_plusBtn = sc_plusBtn;

    /** 商品cell——按钮 */
    SCCircleButton *sc_minBtn = [SCCircleButton circleButton];
    [self.contentView addSubview:sc_minBtn];
    [sc_minBtn setTitle:@"-" forState:UIControlStateNormal];
    [sc_minBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:30]];
    [sc_minBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [sc_minBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [sc_minBtn addTarget:self action:@selector(countChange:) forControlEvents:UIControlEventTouchUpInside];
   // sc_minBtn.enabled = NO;
    self.sc_minBtn = sc_minBtn;

    /** 商品cell数量 */
    UILabel *sc_countLabel = [[UILabel alloc]init];
    [self.contentView addSubview:sc_countLabel];
    sc_countLabel.textAlignment = NSTextAlignmentCenter;
    sc_countLabel.font = [UIFont systemFontOfSize:25];
    self.sc_countLabel = sc_countLabel;
}
#pragma mark 监听按钮点击
- (void)countChange:(UIButton *)btn{
    // 发通知更新购物栏
    NSDictionary *dictParama = nil;

    if (btn==self.sc_plusBtn) {// 点击了加号按钮
        self.shopList.count++;
        dictParama = @{SCKeyCellDidClickPlusBtnOrMinBtnUpdatePriceBar:self.shopList};
         [SCNotiCenter postNotificationName:SCCellDidClickPlusBtnUpdatePriceBar object:nil userInfo:dictParama];
       // self.sc_minBtn.enabled = YES;
    }else if (btn==self.sc_minBtn){// 点击了➖号按钮
        self.shopList.count--;
        dictParama = @{SCKeyCellDidClickPlusBtnOrMinBtnUpdatePriceBar:self.shopList};
         [SCNotiCenter postNotificationName:SCCellDidClickMinBtnUpdatePriceBar object:nil userInfo:dictParama];
    }
    //更新sc_minBtn状态
    self.sc_minBtn.enabled = self.shopList.count>0;


    //刷新表格
    [self.tableView reloadData];
}


+ (SCTableViewCell *)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath{
    SCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SCCellID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SCCellID];
    }
    cell.tableView = tableView;
    return cell;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cellMargin = SCCellMargin;
    /** 商品cell图片 */
    CGFloat sc_imageX = cellMargin;
    CGFloat sc_imageY = cellMargin;
    CGFloat sc_imageWH = SCCellImageWH;
    self.sc_imageView.frame = CGRectMake(sc_imageX, sc_imageY, sc_imageWH, sc_imageWH);
    self.sc_imageView.centerY = self.sc_imageView.superview.centerY;

     /** 商品cell名字 */
    CGFloat sc_nameX = CGRectGetMaxX(self.sc_imageView.frame)+cellMargin;
    CGFloat sc_nameY = sc_imageY;
    CGFloat sc_nameW = SCScreenW-sc_nameX-cellMargin;
    CGSize sc_nameSize = [self.shopList.name sizeWithString:self.shopList.name andFontSize:self.sc_nameLabel.font andMaxSize:CGSizeMake(sc_nameW, MAXFLOAT)];
   self.sc_nameLabel.frame = CGRectMake(sc_nameX, sc_nameY, sc_nameSize.width, sc_nameSize.height);

     /** 商品cell价格 */
    CGFloat sc_priceX = sc_nameX;
    CGFloat sc_priceY = CGRectGetMaxY(self.sc_nameLabel.frame)+cellMargin;
    self.sc_priceLabel.x =sc_priceX;
    self.sc_priceLabel.y = sc_priceY;
    [self.sc_priceLabel sizeToFit];

     /** 商品cell+按钮 */
    CGFloat sc_plusBtnWH = SCCellPlusBtnAndMinBtnWH;
    self.sc_plusBtn.x = SCScreenW-cellMargin-sc_plusBtnWH;
    self.sc_plusBtn.width = self.sc_plusBtn.height = sc_plusBtnWH;
    self.sc_plusBtn.centerY = self.sc_priceLabel.centerY;

    /** 商品cellCount */

    self.sc_countLabel.width = 50;
    self.sc_countLabel.height = 30;
    self.sc_countLabel.x = self.sc_plusBtn.x-self.sc_countLabel.width;
    self.sc_countLabel.centerY = self.sc_plusBtn.centerY;

    /** 商品cell-按钮 */

    self.sc_minBtn.width = self.sc_minBtn.height = sc_plusBtnWH;
    self.sc_minBtn.centerY = self.sc_priceLabel.centerY;
    self.sc_minBtn.right = self.sc_countLabel.x;
    
    self.shopList.cellHeight = CGRectGetMaxY(self.sc_minBtn.frame)+cellMargin;

}

- (void)setShopList:(SCShopList *)shopList{

    _shopList = shopList;
    self.sc_imageView.image = [UIImage imageNamed:shopList.image];
    self.sc_nameLabel.text = shopList.name;
    self.sc_priceLabel.text = [NSString stringWithFormat:@"￥%@",shopList.money];
    self.sc_countLabel.text = [NSString stringWithFormat:@"%zd",shopList.count];
    self.sc_minBtn.enabled = shopList.count>0;
}


@end
