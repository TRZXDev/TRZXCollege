//
//  OnLineViewController.m
//  kuanjia
//
//  Created by sweet luo on 15/10/3.
//  Copyright © 2015年 KristyFuWa. All rights reserved.
//

#import "TRZXCollegeViewController.h"


@interface TRZXCollegeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIView *collegeHeaderView;
@property (nonatomic, strong) TRZXShufflingView *shufflingView;
@property (nonatomic, strong) TRZXCollegeCollectionView *collegeCollectionView;
@property (nonatomic, strong) UITableView *collegeTableView;
@property (strong, nonatomic) TRZXCollegeViewModel *viewModel;

@end

@implementation TRZXCollegeViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投融学院";
    [self.view addSubview:self.collegeTableView];

//    [self sendRequest];



}

// 发起请求
- (void)sendRequest {

    NSDictionary *params = @{@"requestType":@"New_Schoole_Api",
                             @"apiType":@"homeV2"};
     self.viewModel.parameters = params;
    [self.viewModel.requestSignal subscribeNext:^(NSMutableArray *lists) {

        // 请求完成后，更新UI

        [self.collegeTableView reloadData];


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

    return 20;
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
        [_collegeHeaderView addSubview:self.collegeCollectionView];
        _collegeHeaderView.frame = CGRectMake(0, 0, self.view.width, self.collegeCollectionView.bottom);
    }
    return _collegeHeaderView;
}



-(UITableView *)collegeTableView{
    if (!_collegeTableView) {
        // 内容视图
        _collegeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _collegeTableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        _collegeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _collegeTableView.dataSource = self;
        _collegeTableView.delegate = self;
        _collegeTableView.tableHeaderView = self.collegeHeaderView;
        _collegeTableView.estimatedRowHeight = 316;  //  随便设个不那么离谱的值
        _collegeTableView.rowHeight = UITableViewAutomaticDimension;

    }
    return _collegeTableView;
}




-(TRZXShufflingView *)shufflingView{
    if (!_shufflingView) {
        _shufflingView = [[TRZXShufflingView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.width*9/16)];
        [_shufflingView images:@[@"http://kipo-att-img.img-cn-beijing.aliyuncs.com/201702/dc4e87fde4fe45d298604ef716626daf.jpg@!750x422",@"http://kipo-att-img.img-cn-beijing.aliyuncs.com/201702/dc4e87fde4fe45d298604ef716626daf.jpg@!750x422",@"http://kipo-att-img.img-cn-beijing.aliyuncs.com/201702/dc4e87fde4fe45d298604ef716626daf.jpg@!750x422"]];

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

- (TRZXCollegeViewModel *)viewModel {

    if (!_viewModel) {
        _viewModel = [TRZXCollegeViewModel new];
    }
    return _viewModel;
}

@end






