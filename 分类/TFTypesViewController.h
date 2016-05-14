//
//  TFTypesViewController.h
//  deng
//
//  Created by 朝辉钟 on 16/5/4.
//  Copyright © 2016年 TF. All rights reserved.
//



@interface TFTypesViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property(nonatomic,assign)BOOL isShowBackButton;//传递  默认不显示
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *brandTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIView *filterContainerView;
@property (weak, nonatomic) IBOutlet UIView *contentBoxView;//右侧box


- (IBAction)btnBackClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;

- (IBAction)segementValueChanged:(UISegmentedControl *)sender;

@property (weak, nonatomic) IBOutlet UIView *titleview;

@end
