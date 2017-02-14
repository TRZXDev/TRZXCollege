//
//  TRCollegeModel.m
//  TRZX
//
//  Created by N年後 on 16/8/26.
//  Copyright © 2016年 Tiancaila. All rights reserved.
//

#import "TRZXCollegeViewModel.h"
#import "MJExtension.h"

@implementation TRZXCollegeViewModel

// 采用懒加载的方式来配置网络请求
- (RACSignal *)requestSignal {

    if (!_requestSignal) {

        _requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {


            [TRZXNetwork requestWithUrl:nil params:self.parameters method:GET cachePolicy:NetworkingReloadIgnoringLocalCacheData callbackBlock:^(id response, NSError *error) {

                if (response) {

                    self.dataSource = [TRZXCourse mj_objectArrayWithKeyValuesArray:response[@"course"]];
                    [subscriber sendNext:self.dataSource];
                    [subscriber sendCompleted];

                }else{
                    [subscriber sendError:error];
                }
            }];

            // 在信号量作废时，取消网络请求
            return [RACDisposable disposableWithBlock:^{

                [TRZXNetwork cancelRequestWithURL:nil];
            }];
        }];
    }
    return _requestSignal;
}


@end







