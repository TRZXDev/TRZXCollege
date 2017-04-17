//
//  MarketCollectionViewCell.m
//  Wuxianda
//
//  Created by MichaelPPP on 16/7/12.
//  Copyright © 2016年 michaelhuyp. All rights reserved.
//

#import "TRZXCollegeCollectionCell.h"
#import "TRZXKit.h"


@interface TRZXCollegeCollectionCell ()

@end

@implementation TRZXCollegeCollectionCell

#pragma mark - Override
- (void)awakeFromNib {
    [super awakeFromNib];
    // self
    self.autoresizingMask = UIViewAutoresizingNone;

    self.iconImageView.layer.cornerRadius =   25;
    self.iconImageView.layer.masksToBounds = YES;

}



@end
