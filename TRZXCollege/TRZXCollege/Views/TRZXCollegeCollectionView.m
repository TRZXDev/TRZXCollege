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
    CGFloat itemW = (self.width) / 4;
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

    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TRZXCollegeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier_TRZXCollegeCollectionCell forIndexPath:indexPath];

    UIColor *color;
    if (indexPath.row==0) {

        cell.titleLabel.text = @"投融课程";
        color =  [UIColor colorWithRed:231/255.0 green:118/255.0 blue:180/255.0 alpha:1];

    }else if (indexPath.row==1){

        cell.titleLabel.text = @"孵化专区";
        color =  [UIColor colorWithRed:157/255.0 green:129/255.0 blue:231/255.0 alpha:1];

    }else if (indexPath.row==2){

        cell.titleLabel.text = @"投融问答";
        color =  [UIColor colorWithRed:68/255.0 green:184/255.0 blue:229/255.0 alpha:1];

    }else if (indexPath.row==3){

        cell.titleLabel.text = @"投融课程";
        color =  [UIColor colorWithRed:231/255.0 green:118/255.0 blue:180/255.0 alpha:1];

    }else if (indexPath.row==4){

        cell.titleLabel.text = @"协议讲解";
        color =  [UIColor colorWithRed:77/255.0 green:140/255.0 blue:231/255.0 alpha:1];

    }else if (indexPath.row==5){

        cell.titleLabel.text = @"直播课堂";
        color =  [UIColor colorWithRed:140/255.0 green:200/255.0 blue:85/255.0 alpha:1];

    }else if (indexPath.row==6){

        cell.titleLabel.text = @"附近专家";
        color =  [UIColor colorWithRed:250/255.0 green:93/255.0 blue:66/255.0 alpha:1];

    }else if (indexPath.row==7){

        cell.titleLabel.text = @"协议讲解";
        color =  [UIColor colorWithRed:77/255.0 green:140/255.0 blue:231/255.0 alpha:1];;

    }

    cell.iconImageView.image = [self imageWithColor:color displayString:[[cell.titleLabel.text substringWithRange:NSMakeRange(0, 1)] capitalizedString]];
    





    return cell;
}



- (UIImage *)imageWithColor:(UIColor *)color displayString:(NSString *)displayString {
    return [self imageWithColor:color string:displayString];
}


- (UIColor *)colorWithString:(NSString *)string {
    NSInteger length = string.length;
    NSInteger partLength = length / 3;

    NSString *part1, *part2, *part3;
    part1 = [string substringWithRange:NSMakeRange(0, partLength)];
    part2 = [string substringWithRange:NSMakeRange(partLength, partLength)];
    part3 = [string substringWithRange:NSMakeRange(partLength * 2, partLength)];
    CGFloat hue = [self hashNumberFromString:part3] % 256 / 256.0;
    CGFloat saturation = [self hashNumberFromString:part2] % 128 / 256.0 + 0.5;
    CGFloat brightness = [self hashNumberFromString:part1] % 128 / 256.0 + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (NSUInteger)hashNumberFromString:(NSString *)string {
    NSInteger hash = string.hash;
    if (hash < 0) {
        return -hash;
    }
    else {
        return hash;
    }
}

- (UIImage *)imageWithColor:(UIColor *)color string:(NSString *)string {
    CGSize size = CGSizeMake(50, 50);
    CGFloat radius = 4;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:rect
                                cornerRadius:radius] addClip];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIFont *font = [UIFont systemFontOfSize:25];
    CGFloat yOffset = (rect.size.height - font.pointSize) / 2.0 - 3;
    CGRect textRect = CGRectMake(0, yOffset, rect.size.width, rect.size.height - yOffset);

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;

    [string drawInRect:textRect withAttributes:@{ NSFontAttributeName: font,                                                           NSParagraphStyleAttributeName: paragraphStyle, NSForegroundColorAttributeName:[UIColor whiteColor] }];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{


    switch (indexPath.row) {
        case CollegeCollectionViewCellTypeCourse:{//直播课程


        }
            break;
        case CollegeCollectionViewCellTypeIncubation:{//孵化专区


        }
            break;
        case CollegeCollectionViewCellTypeQuestion:{//学院问答



        }
            break;
        case CollegeCollectionViewCellTypeAgreement:{//协议讲解





        }
            break;
        case CollegeCollectionViewCellTypeLiveCourses:{//直播课程



        }
            break;
        case CollegeCollectionViewCellTypeExperts:{//附近专家



        }
            break;
        default:
            break;
    }


}


@end









































