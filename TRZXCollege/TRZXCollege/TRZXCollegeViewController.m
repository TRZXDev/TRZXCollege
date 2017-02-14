//
//  OnLineViewController.m
//  kuanjia
//
//  Created by sweet luo on 15/10/3.
//  Copyright © 2015年 KristyFuWa. All rights reserved.
//

#import "TRZXCollegeViewController.h"
#import "TRZXShufflingView.h"
#import "TRZXCollegeCollectionView.h"
#import "TRZXCollegeViewModel.h"
#import "TRZXKit.h"
#import "TRZXCollegeTabSectionHeaderView.h"
#import "MJRefresh.h"
#import "TRZXCollegeCell.h"
#import "UIImageView+AFNetworking.h"

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

    [self sendRequest];



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

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 130;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TRZXCollegeCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TRZXCollegeCell];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeCell owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    TRZXCourse *course = self.viewModel.dataSource[indexPath.row];
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:course.photo] placeholderImage:[UIImage imageNamed:@"展位图"]];


    return cell;


}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    TRZXCollegeTabSectionHeaderView *view=[[[NSBundle mainBundle] loadNibNamed:kCellIdentifier_TRZXCollegeTabSectionHeaderView owner:self options:nil] lastObject];
    view.titleLabel.text = @"推荐课程";
    return view;
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


            switch (type) {
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
