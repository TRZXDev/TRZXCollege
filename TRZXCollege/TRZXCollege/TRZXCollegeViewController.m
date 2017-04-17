//
//  OnLineViewController.m
//  kuanjia
//
//  Created by sweet luo on 15/10/3.
//  Copyright © 2015年 KristyFuWa. All rights reserved.
//

#import "TRZXCollegeViewController.h"
#import "TRZXWavesView.h"
#import "TRZXDIYRefresh.h"

@interface TRZXCollegeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIView *topView; //顶部轮播UView
@property (nonatomic, strong) TRZXWavesView *wavesView; //水波纹UView

@property (nonatomic, strong) TRZXShufflingView *shufflingView;
@property (nonatomic, strong) UIView *collegeHeaderView;
@property (nonatomic, strong) TRZXCollegeCollectionView *collegeCollectionView;
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) TRZXCollegeViewModel *viewModel;

@end

@implementation TRZXCollegeViewController


//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return self.navigationController.navigationBar.barStyle == UIBarStyleBlack?UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
//}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    // 设置状态栏的样式
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
        // 设置回状态栏的样式
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投融学院";

    [self.view addSubview:self.tableView];

//    [self sendRequest];



}

// 发起请求
- (void)sendRequest {

    NSDictionary *params = @{@"requestType":@"New_Schoole_Api",
                             @"apiType":@"homeV2"};
     self.viewModel.parameters = params;
    [self.viewModel.requestSignal subscribeNext:^(NSMutableArray *lists) {

        // 请求完成后，更新UI

        [self.tableView reloadData];


    } error:^(NSError *error) {
        // 如果请求失败，则根据error做出相应提示
        
    }];
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    switch (section) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            return 1;
            break;
            
        default:
            return 10;
            break;
    }
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{



    switch (indexPath.section) {
        case 0:
        {

            TRZXCollegeLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeLiveCell];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeLiveCell owner:self options:nil] lastObject];
            }

            return cell;
        }
            break;
        case 1:
        {
            TRZXCollegeNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeNewsCell];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeNewsCell owner:self options:nil] lastObject];
            }

            return cell;

        }
            break;
        case 2:
        {

            TRZXCollegeRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeRecommendCell];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeRecommendCell owner:self options:nil] lastObject];
            }

            return cell;

        }
            break;
        case 3:
        {

            TRZXCollegeProductsRecommendedCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeProductsRecommendedCell];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeProductsRecommendedCell owner:self options:nil] lastObject];
            }

            return cell;

        }
            break;
        case 4:
        {

            TRZXCollegeLiveClassroomCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeLiveClassroomCell];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeLiveClassroomCell owner:self options:nil] lastObject];
            }

            return cell;

        }
            break;
        case 5:
        {
            TRZXCollegeAskTheExpertsCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeAskTheExpertsCell];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeAskTheExpertsCell owner:self options:nil] lastObject];
            }

            return cell;

        }
            break;

        default:
        {
            TRZXCollegeTopRankingCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeTopRankingCell];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeTopRankingCell owner:self options:nil] lastObject];
            }
            return cell;
        }
            break;
    }


}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 10;
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

//view 不显示的时候删除数据 
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];


}



#pragma mark - properties

-(UIView *)collegeHeaderView{
    if (!_collegeHeaderView) {
        _collegeHeaderView = [[UIView alloc]init];
        [_collegeHeaderView addSubview:self.shufflingView];
        [_collegeHeaderView addSubview:self.wavesView];
        [_collegeHeaderView addSubview:self.collegeCollectionView];
        _collegeHeaderView.frame = CGRectMake(0, 0, self.view.width, self.collegeCollectionView.bottom);
    }
    return _collegeHeaderView;
}



-(UITableView *)tableView{
    if (!_tableView) {
        // 内容视图
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableHeaderView = self.collegeHeaderView;
        _tableView.estimatedRowHeight = 316;  //  随便设个不那么离谱的值
        _tableView.rowHeight = UITableViewAutomaticDimension;



        // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
        _tableView.mj_header = [TRZXGifHeader headerWithRefreshingBlock:^{
            // 刷新数据

            __block TRZXCollegeViewController/*主控制器*/ *weakSelf = self;

            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));

            dispatch_after(delayTime, dispatch_get_main_queue(), ^{

                [ self.tableView.mj_header endRefreshing];

            });



        }];
//        [ self.tableView.mj_header beginRefreshing];


        // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadLastData方法）
        _tableView.mj_footer = [TRZXGifFooter footerWithRefreshingBlock:^{


            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));

            dispatch_after(delayTime, dispatch_get_main_queue(), ^{

                [ self.tableView.mj_footer endRefreshing];
                
                
            });


        }];
        _tableView.mj_footer.automaticallyHidden = YES;


    }
    return _tableView;
}




-(TRZXShufflingView *)shufflingView{
    if (!_shufflingView) {
        _shufflingView = [[TRZXShufflingView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.width*9/16)];

        NSString *path = @"http://upload-images.jianshu.io/upload_images/119178-9ca70abd076bdf64.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240";
        [_shufflingView images:@[path,path,path]];

    }
    return _shufflingView;
}

-(TRZXCollegeCollectionView *)collegeCollectionView{
    if (!_collegeCollectionView) {

        // 底部入口View
        _collegeCollectionView = [TRZXCollegeCollectionView collegeCollectionViewCellWithBlock:^(CollegeCollectionViewCellType type) {
            
        }];
        _collegeCollectionView.frame = CGRectMake(0, _shufflingView.bottom, self.view.width, 149);
    }
    return _collegeCollectionView;
}

-(UIView *)topView{
    if (!_topView) {

        _topView.frame = CGRectMake(0, -self.view.height, self.view.width, self.view.height);
    }
    return _topView;
}

-(TRZXWavesView *)wavesView{
    if (!_wavesView) {
        _wavesView  = [[TRZXWavesView alloc] initWithFrame:CGRectMake(0, self.shufflingView.bottom-20, self.view.width, 20)];
        [_wavesView startWaveAnimation];
    }
    return _wavesView;
}

- (TRZXCollegeViewModel *)viewModel {

    if (!_viewModel) {
        _viewModel = [TRZXCollegeViewModel new];
    }
    return _viewModel;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    CGFloat offsetY = scrollView.contentOffset.y;
//
//    if (offsetY >= 0) {
//        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//
//
//    } else {
//        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//
//    }
//


    
}



@end






