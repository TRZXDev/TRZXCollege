//
//  TRCollegeModel.h
//  TRZX
//
//  Created by N年後 on 16/8/26.
//  Copyright © 2016年 Tiancaila. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"
#import "TRZXCourse.h"
#import "TRZXNetwork.h"


@interface TRZXCollegeViewModel : NSObject
@property (strong, nonatomic) NSDictionary *parameters; ///  配置网络请求参数
@property (strong, nonatomic) RACSignal *requestSignal; ///< 网络请求信号量
@property (strong, nonatomic) NSMutableArray *dataSource; ///< tableView的数据源

@end


