//
//  TRZXCollegeLiveCell.m
//  TRZXCollege
//
//  Created by N年後 on 2017/4/11.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXCollegeLiveCell.h"
#import "TRZXKit.h"
#import "TRZXCollegeLiveColumnViewController.h"
#import "TRZXCollegeLiveColumnEnteredViewController.h"
@implementation TRZXCollegeLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];






    // Configure the view for the selected state
}
- (IBAction)toLiveAction:(UIButton *)sender {

    [self.viewController.navigationController pushViewController: [TRZXCollegeLiveColumnViewController alloc] animated:true];
}

@end
