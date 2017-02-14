//
//  MarketEntranceIconsView.m
//  Wuxianda
//
//  Created by MichaelPPP on 16/7/12.
//  Copyright © 2016年 michaelhuyp. All rights reserved.
//

#import "TRZXCollegeCollectionView.h"
#import "TRZXCollegeCollectionCell.h"
#import "TRZXKit.h"
@interface TRZXCollegeCollectionView () <UICollectionViewDataSource,UICollectionViewDelegate>


@property (nonatomic, copy) CollegeCollectionViewCellBlock block;
@end

@implementation TRZXCollegeCollectionView



#pragma mark - Public
+ (instancetype)collegeCollectionViewCellWithBlock:(CollegeCollectionViewCellBlock)block
{
    TRZXCollegeCollectionView *view = [TRZXCollegeCollectionView viewFromXib];
    view.block = block;
    return view;
}

#pragma mark - Override

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // self
    self.autoresizingMask = UIViewAutoresizingNone;

    _collectionView.scrollsToTop = NO;

    // layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat itemW = (self.width) / 3;
    CGFloat itemH = 74;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _collectionView.collectionViewLayout = layout;
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);


    // register cell

//    [_collectionView registerClass:[MarketCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier_MarketCollectionViewCell];

    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([TRZXCollegeCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:kCellIdentifier_TRZXCollegeCollectionCell];
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TRZXCollegeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier_TRZXCollegeCollectionCell forIndexPath:indexPath];

    if (indexPath.row==0) {

        cell.titleLabel.text = @"投融课程";
        cell.iconImageView.image = [UIImage imageNamed:@"投融课程"];

    }else if (indexPath.row==1){

        cell.titleLabel.text = @"融资辅导";
        cell.iconImageView.image = [UIImage imageNamed:@"孵化专区"];

    }else if (indexPath.row==2){

        cell.titleLabel.text = @"投融问答";
        cell.iconImageView.image = [UIImage imageNamed:@"学院问答"];

    }else if (indexPath.row==3){

        cell.titleLabel.text = @"协议讲解";
        cell.iconImageView.image = [UIImage imageNamed:@"协议讲解"];

    }else if (indexPath.row==4){

        cell.titleLabel.text = @"直播课堂";
        cell.iconImageView.image = [UIImage imageNamed:@"直播课堂"];
        
    }else if (indexPath.row==5){

        cell.titleLabel.text = @"附近专家";
        cell.iconImageView.image = [UIImage imageNamed:@"附近专家"];

    }

    





    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.block) {
        self.block(indexPath.row);
    }

}


@end









































