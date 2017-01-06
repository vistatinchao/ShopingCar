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


@end

@implementation SCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
    sc_nameLabel.font = [UIFont boldSystemFontOfSize:20];
    self.sc_nameLabel = sc_nameLabel;

    /** 商品cell价格 */
    UILabel *sc_priceLabel = [[UILabel alloc]init];
    [self.contentView addSubview:sc_priceLabel];
    sc_priceLabel.font = [UIFont systemFontOfSize:16];
    sc_priceLabel.textColor = [UIColor orangeColor];
    self.sc_priceLabel = sc_priceLabel;

    /** 商品cell+按钮 */
    SCCircleButton *sc_plusBtn = [SCCircleButton circleButton];
    [self.contentView addSubview:sc_plusBtn];
    [sc_plusBtn setTitle:@"+" forState:UIControlStateNormal];
    [sc_plusBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.sc_plusBtn = sc_plusBtn;

    /** 商品cell——按钮 */
    SCCircleButton *sc_minBtn = [SCCircleButton circleButton];
    [self.contentView addSubview:sc_minBtn];
    [sc_minBtn setTitle:@"-" forState:UIControlStateNormal];
    [sc_minBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.sc_minBtn = sc_minBtn;

    /** 商品cell数量 */
    UILabel *sc_countLabel = [[UILabel alloc]init];
    [self.contentView addSubview:sc_countLabel];
    self.sc_countLabel = sc_countLabel;
}


+ (SCTableViewCell *)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath{
    SCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SCCellID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SCCellID];
    }
    return cell;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cellMargin = 15;
    /** 商品cell图片 */
    CGFloat sc_imageX = cellMargin;
    CGFloat sc_imageY = cellMargin;
    CGFloat sc_imageWH = 40;
    self.sc_imageView.frame = CGRectMake(sc_imageX, sc_imageY, sc_imageWH, sc_imageWH);
    self.sc_imageView.centerY = self.sc_imageView.superview.centerY;

     /** 商品cell名字 */
    CGFloat sc_nameX = CGRectGetMaxX(self.sc_imageView.frame)+cellMargin;
    CGFloat sc_nameY = sc_imageY;
//    CGFloat sc_nameW = 100;
//    CGFloat sc_nameH = 40;
    self.sc_nameLabel.x = sc_nameX;
    self.sc_nameLabel.y = sc_nameY;
    [self.sc_nameLabel sizeToFit];
 //   self.sc_nameLabel.frame = CGRectMake(sc_nameX, sc_nameY, sc_nameW, sc_nameH);

     /** 商品cell价格 */
    CGFloat sc_priceX = sc_nameX;
    CGFloat sc_priceY = CGRectGetMaxY(self.sc_nameLabel.frame)+cellMargin;
    CGFloat sc_priceW = 100;
    CGFloat sc_priceH = 40;
    self.sc_priceLabel.frame = CGRectMake(sc_priceX, sc_priceY, sc_priceW, sc_priceH);

     /** 商品cell+按钮 */
    CGFloat sc_plusBtnWH = 30;
    self.sc_plusBtn.x = SCScreenW-cellMargin-sc_plusBtnWH;
    self.sc_plusBtn.width = self.sc_plusBtn.height = sc_plusBtnWH;
    self.sc_plusBtn.centerY = self.sc_imageView.centerY;

    /** 商品cellCount */
    self.sc_countLabel.centerY = self.sc_plusBtn.centerY;
    self.sc_countLabel.right = CGRectGetMinX(self.sc_plusBtn.frame)-cellMargin;
    self.sc_countLabel.width = self.sc_countLabel.height = 30;

    /** 商品cell-按钮 */
    self.sc_minBtn.right = CGRectGetMinX(self.sc_countLabel.frame)-cellMargin;
    self.sc_minBtn.width = self.sc_minBtn.height = sc_plusBtnWH;
    self.sc_minBtn.centerY = self.sc_imageView.centerY;

}

- (void)setShopList:(SCShopList *)shopList{

    _shopList = shopList;
    self.sc_imageView.image = [UIImage imageNamed:shopList.image];
    self.sc_nameLabel.text = shopList.name;
    self.sc_priceLabel.text = shopList.money;
    self.sc_countLabel.text = [NSString stringWithFormat:@"%zd",shopList.count];
    
}


@end
