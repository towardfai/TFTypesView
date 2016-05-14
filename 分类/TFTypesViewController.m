//
//  TFTypesViewController.m
//  deng
//
//  Created by 朝辉钟 on 16/5/4.
//  Copyright © 2016年 TF. All rights reserved.
//
#import "params.h"
#import "TFStyleCell.h"
#import "TFTypesViewController.h"
#import "TFTypeItemCell.h"
#import "TFTypesHeaderView.h"
#import "TFTypesFooterView.h"
#import "TFBrandCell.h"


static NSString * reuseIdentifier = @"TFStyleCell";
static NSString * reuseIdentifier2 = @"TFTypeItemCell";
static NSString * reuseHeaderIdentifier = @"TFTypesHeaderView";
static NSString * reuseFooterIdentifier = @"TFTypesFooterView";
static NSString * reuseBrandIdentifier = @"TFBrandCell";

@interface TFTypesViewController ()
{
    NSMutableArray * _list;//左侧菜单，
    NSMutableArray * _itemList;//右侧数据(collectionview)
    NSMutableArray * _brandList;//右侧品牌列表
    NSArray * _sortList;//排序用  abcd
    NSInteger _currentIndex;//左侧菜单选中项
}
@end

@implementation TFTypesViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _list = [NSMutableArray array];
    _itemList = [NSMutableArray array];
    _brandList =[NSMutableArray array];
    _sortList  = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    NSMutableDictionary * item ;
    for (int i = 0 ; i < _sortList.count; i ++) {
        item = [NSMutableDictionary dictionary];
        [item setObject:_sortList[i] forKey:@"text"];
        [item setObject:[self tmpFunc:_sortList[i]] forKey:@"list"];
        [_brandList addObject:item];
    }
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:reuseHeaderIdentifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:reuseFooterIdentifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:reuseFooterIdentifier];
    
    [self retryRequest];
    [_brandTableView setHidden:YES];
    //改变索引的颜色
   // _brandTableView.sectionIndexColor = [UIColor blueColor];
    //改变索引选中的背景颜色
    _brandTableView.sectionIndexTrackingBackgroundColor = [UIColor whiteColor];
    _brandTableView.sectionIndexBackgroundColor = [UIColor clearColor];
   TFTypesHeaderView * brandHeaderView =  [[NSBundle mainBundle] loadNibNamed:@"TFTypesHeaderView" owner:nil options:nil][0];
    [brandHeaderView.iconBtn setImage:[UIImage imageNamed:@"sort_brands"] forState:UIControlStateNormal];
    [brandHeaderView.iconBtn setTitle:@"品牌" forState:UIControlStateNormal];
    _brandTableView.tableHeaderView = brandHeaderView;
    [self tableView:_tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    [_btnBack setHidden:!_isShowBackButton];
}
-(NSMutableArray *)tmpFunc:(NSString *)str
{
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i< 10; i++) {
        [arr addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"icon":@"brand.png",@"text":[NSString stringWithFormat:@"品牌%@%i",str,i]}]];
    }
    return arr;
}

#pragma mark ----------------- 重新加载（loading）
-(void)retryRequest{
    [self getDataWithdatatype:@"123"];
}

#pragma mark -  获取左侧风格菜单数据
-(void)getDataWithdatatype:(NSString *)requestString
{
    
    NSMutableDictionary * item;
    item = [NSMutableDictionary dictionary];
    [item setObject:@"类型" forKey:@"text"];
    [item setObject:@"sort_1" forKey:@"icon"];
    [item setObject:@(NO) forKey:@"isSelected"];
    [item setObject:@"" forKey:@"type"];
    [item setObject:[self createRowData:@"类型"] forKey:@"list"];
    [_list addObject:item];
    
    
    item = [NSMutableDictionary dictionary];
    [item setObject:@"风格" forKey:@"text"];
    [item setObject:@"sort_style" forKey:@"icon"];
    [item setObject:@(NO) forKey:@"isSelected"];
    [item setObject:@"" forKey:@"type"];
    [item setObject:[self createRowData:@"风格"] forKey:@"list"];
    [_list addObject:item];
    
    item = [NSMutableDictionary dictionary];
    [item setObject:@"空间" forKey:@"text"];
    [item setObject:@"sort_space" forKey:@"icon"];
    [item setObject:@(NO) forKey:@"isSelected"];
    [item setObject:@"" forKey:@"type"];
    [item setObject:[self createRowData:@"空间"] forKey:@"list"];
    [_list addObject:item];
    
    item = [NSMutableDictionary dictionary];
    [item setObject:@"品牌" forKey:@"text"];
    [item setObject:@"sort_brands" forKey:@"icon"];
    [item setObject:@(NO) forKey:@"isSelected"];
    [item setObject:@"brand" forKey:@"type"];
    [item setObject:[self createRowData:@"品牌"] forKey:@"list"];
    [_list addObject:item];
    
    item = [NSMutableDictionary dictionary];
    [item setObject:@"价格" forKey:@"text"];
    [item setObject:@"price" forKey:@"icon"];
    [item setObject:@(NO) forKey:@"isSelected"];
    [item setObject:@"price" forKey:@"type"];
    [item setObject:[self createRowData:@"价格"] forKey:@"list"];
    [_list addObject:item];
    
    item = [NSMutableDictionary dictionary];
    [item setObject:@"sort_material" forKey:@"icon"];
    [item setObject:@"材质" forKey:@"text"];
    [item setObject:@(NO) forKey:@"isSelected"];
    [item setObject:@"" forKey:@"type"];
    [item setObject:[self createRowData:@"材质"] forKey:@"list"];
    [_list addObject:item];
    
    item = [NSMutableDictionary dictionary];
    [item setObject:@"sort_colour" forKey:@"icon"];
    [item setObject:@"工艺" forKey:@"text"];
    [item setObject:@(NO) forKey:@"isSelected"];
    [item setObject:@"" forKey:@"type"];
    [item setObject:[self createRowData:@"工艺"] forKey:@"list"];
    [_list addObject:item];

    
    
    
}
#pragma 组合数据
-(void)rebuildData
{
    [_list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setObject:@(NO) forKey:@"isSelected"];
    }];
}


-(void)rebuildData2
{
    [_list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setObject:[self createRowData:obj[@"Name"]] forKey:@"List"];
    }];
}

-(NSMutableArray *)createRowData:(NSString *)str
{
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i< 20; i++) {
        [arr addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"icon":@"price_1000",@"text":[NSString stringWithFormat:@"%@%i",str,i]}]];
    }
    return arr;
}
#pragma mark tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _tableView) {
        return 1;
    }else if(tableView == _brandTableView){
        return _brandList.count;
    }else
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView== _tableView) {
        return _list.count;
    }else if (tableView == _brandTableView){
        return [_brandList[section][@"list"] count];
    }else{
        return 0;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView) {
        NSMutableDictionary * row = _list[indexPath.row];
        TFStyleCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
        if ([row[@"isSelected"] boolValue] !=NO) {
            [[cell leftView] setHidden:NO];
            [[cell btnText] setBackgroundColor:THEME_COLOR_BACKGROUND];
            [[cell btnText] setTitleColor:THEME_COLOR forState:UIControlStateNormal];
        }else{
            [cell.leftView setHidden:YES];
            [[cell btnText] setTitle:row[@"text"] forState:UIControlStateNormal];
            [[cell btnText] setBackgroundColor:[UIColor whiteColor]];
            [[cell btnText] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        [[cell btnText] setTitle:row[@"text"] forState:UIControlStateNormal];
        return cell;
    }else if (tableView== _brandTableView){
        NSMutableDictionary * row = _brandList[indexPath.section][@"list"][indexPath.row];
        TFBrandCell * cell  =[tableView dequeueReusableCellWithIdentifier:reuseBrandIdentifier forIndexPath:indexPath];
        [cell.iconImage setImage:[UIImage imageNamed:row[@"icon"]]];
        [cell.labtext setText:row[@"text"]];
        return cell;
    }else{
        return nil;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _tableView) {
        return 0.01f;
    }
    else{
        return 20.f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView) {
        return 44.f;
    }else{
        return 60.f;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView== _tableView) {
        return nil;
    }else{
     return  _sortList[section];
    }
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == _tableView) {
        return nil;
    }
    return _sortList;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (tableView == _brandTableView) {
        [_brandTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0  inSection:index] atScrollPosition: UITableViewScrollPositionTop     animated:NO];
        NSLog(@"index = %ld",(long)index);
        return index;
    }else
    {
        return index;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (tableView == _tableView) {
        _currentIndex = indexPath.row;
         NSMutableDictionary * row = _list[indexPath.row];
        [self rebuildData];
        [_list[indexPath.row] setObject:@(YES) forKey:@"isSelected"];
        [tableView reloadData];

        if ([row[@"type"] isEqualToString:@"brand"]) {
            [_brandTableView setHidden:NO];
            [_brandTableView reloadData];
        }else{
              [_brandTableView setHidden:YES];
             _itemList = _list[indexPath.row][@"list"];
            [_collectionView reloadData];
        }
      
    }else{
         NSLog(@"didSelectRowAtIndexPath");
    }
   
}
#pragma mark - collection delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _itemList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *row = _itemList[indexPath.row];
    TFTypeItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier2    forIndexPath:indexPath];
    [cell.btn setTitle:row[@"text"] forState:UIControlStateNormal];
    [[cell.btn titleLabel] setNumberOfLines:0];
    [[cell iconimage] setImage:[UIImage imageNamed:row[@"icon"]]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row %2 == 0) {
         return CGSizeMake((SCREEN_WIDTH-100-5-7)/2 , SCREEN_HEIGHT * 0.104947526);   //左侧菜单100，leading5 trailing6
    }else{
         return CGSizeMake((SCREEN_WIDTH-100-5-5)/2 , SCREEN_HEIGHT * 0.104947526);   //左侧菜单100，leading5 trailing6
    }
   
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
     if ([kind isEqualToString: UICollectionElementKindSectionHeader]){
         
         TFTypesHeaderView *view =  (TFTypesHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseHeaderIdentifier   forIndexPath:indexPath];
         NSMutableDictionary * row = _list[_currentIndex];
         [view.iconBtn setImage:[UIImage imageNamed:row[@"icon"]] forState:UIControlStateNormal];
         [view.iconBtn setTitle:row[@"text"] forState:UIControlStateNormal];

       
         return view;
     }else if ([kind isEqualToString: UICollectionElementKindSectionFooter]){
         NSMutableDictionary * row = _list[_currentIndex];
         if ([row[@"type"] isEqualToString:@"price"]) {
             TFTypesFooterView *view =  (TFTypesFooterView *)[collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseFooterIdentifier   forIndexPath:indexPath];
             return view;
         }else{
             return nil;
         }

     }else{
         return nil;
    }
   
    
    
    
    
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={SCREEN_WIDTH,45};
    return size;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    NSMutableDictionary * row = _list[_currentIndex];
    if ([row[@"type"] isEqualToString:@"price"]) {
        return CGSizeMake(SCREEN_WIDTH, 145);
    }else{
        return CGSizeZero;
    }
   
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

- (IBAction)btnBackClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)segementValueChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [_filterContainerView setHidden:YES];
    }else{
        [_filterContainerView setHidden:NO];
    }
}

@end
