//
//  TRZXCollegeLiveColumnEnteredViewController.m
//  TRZXCollege
//
//  Created by N年後 on 2017/4/18.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXCollegeLiveColumnEnteredViewController.h"
#import "TRZXCollegeLiveColumnEnteredTopCell.h"
#import "TRZXKit.h"
#import "TRZXDIYRefresh.h"

@interface TRZXCollegeLiveColumnEnteredViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TRZXCollegeLiveColumnEnteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"直播报名";

    [self.view addSubview:self.tableView];

    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


    TRZXCollegeLiveColumnEnteredTopCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeLiveColumnEnteredTopCell];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeLiveColumnEnteredTopCell owner:self options:nil] lastObject];
    }

    return cell;



}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return self.view.height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 30.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.000001f;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //行被选中后，自动变回反选状态的方法
    [tableView deselectRowAtIndexPath:indexPath animated:YES];


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


-(UITableView *)tableView{
    if (!_tableView) {
        // 内容视图
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 194;  //  随便设个不那么离谱的值
        _tableView.rowHeight = UITableViewAutomaticDimension;


        // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
        _tableView.mj_header = [TRZXGifHeader headerWithRefreshingBlock:^{
            // 刷新数据

            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));

            dispatch_after(delayTime, dispatch_get_main_queue(), ^{

                [ self.tableView.mj_header endRefreshing];

            });



        }];
//        [ self.collegeTableView.mj_header beginRefreshing];



        
        
    }
    return _tableView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
