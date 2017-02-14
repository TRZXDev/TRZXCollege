//
//  MarketEntranceIconsView.h
//  Wuxianda
//
//  Created by MichaelPPP on 16/7/12.
//  Copyright © 2016年 michaelhuyp. All rights reserved.
//  入口图标View

#import <UIKit/UIKit.h>
#import "TRZXKit.h"
/**
 *  投融市场Cell入口
 */
typedef NS_ENUM(NSInteger, CollegeCollectionViewCellType) {
    /**
     *  投融课程
     */
    CollegeCollectionViewCellTypeCourse = 0,
    /**
     *  孵化专区
     */
    CollegeCollectionViewCellTypeIncubation = 1,
    /**
     *  学院问答
     */
    CollegeCollectionViewCellTypeQuestion = 2,
    /**
     *  协议讲解
     */
    CollegeCollectionViewCellTypeAgreement = 3,
    /**
     *  直播课程
     */
    CollegeCollectionViewCellTypeLiveCourses = 4,
    /**
     *  附近专家
     */
    CollegeCollectionViewCellTypeExperts = 5,

};

typedef void(^CollegeCollectionViewCellBlock)(CollegeCollectionViewCellType type);

@interface TRZXCollegeCollectionView : UIView


+ (instancetype)collegeCollectionViewCellWithBlock:(CollegeCollectionViewCellBlock)block;

/** 入口图标视图 */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

















































