//
//  TFTypeFilterViewController.m
//  deng
//
//  Created by 朝辉钟 on 16/5/6.
//  Copyright © 2016年 TF. All rights reserved.
//
#import "params.h"
#import "TFFilterHeaderPriceCell.h"
#import "TFFilterItemCell.h"
#import "TFTypeFilterViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
static NSString * reuseIdentifier1 = @"TFFilterHeaderPriceCell";
static NSString * reuseIdentifier2 = @"TFFilterItemCell";

@interface TFTypeFilterViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_list;
}
@end

@implementation TFTypeFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _list = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        NSMutableDictionary * item = [NSMutableDictionary dictionary];
        NSMutableArray * arr = [NSMutableArray array];
        for (int j = 0; j < 10+i; j++) {
            [arr addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"text":[NSString stringWithFormat:@"测试%i",j],@"isSelected":@(NO)}]];
        }
        [item setObject:arr forKey:@"list"];
        [item setObject:[NSString stringWithFormat:@"类型%i",i] forKey:@"text"];
        [item setObject:@"" forKey:@"value"];
        [item setObject:@(i == 0) forKey:@"isShowAll"];
        [_list addObject:item];
    }
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    [_tableView reloadData];
}
#pragma mark tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            TFFilterHeaderPriceCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier1 forIndexPath:indexPath];
            [self configureCell:cell atIndexPath:indexPath];
            return cell;
        }
            break;
            
        default:
        {
            TFFilterItemCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier2 forIndexPath:indexPath];
            [self configureCell:cell atIndexPath:indexPath];
            return cell;
        }
            break;
    }
   
  
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary * row = _list[indexPath.row];
    switch (indexPath.row) {
        case 0:
        {
            if ([row[@"isShowAll"] boolValue] != NO) {
                return [self.tableView fd_heightForCellWithIdentifier:reuseIdentifier1 cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
                    [self configureCell:cell atIndexPath:indexPath];
                }];
            }else{
                return 45.f;
            }
            
        }
            break;
            
        default:
        {
            if ([row[@"isShowAll"] boolValue] != NO) {
                return [self.tableView fd_heightForCellWithIdentifier:reuseIdentifier2 cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
                    [self configureCell:cell atIndexPath:indexPath];
                }];
             }else{
                 return 45.f;
             }
        }
            break;
    }
   }
- (void)configureCell:(UITableViewCell *)baseCell atIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary * row = _list[indexPath.row];
    switch (indexPath.row) {
        case 0:
        {
            TFFilterHeaderPriceCell * cell = (TFFilterHeaderPriceCell *)baseCell;
            //[cell.tagView removeAllTags];
            if ([cell.tagView.subviews count] > 0) {
                return;
            }
            cell.tagView.preferredMaxLayoutWidth = SCREEN_WIDTH;
            cell.tagView.padding = UIEdgeInsetsMake(5, 5, 5, 5);
            cell.tagView.interitemSpacing = 5;
            cell.tagView.lineSpacing = 5;
            cell.tagView.didTapTagAtIndex = ^(NSUInteger index,UIButton * sender)
            {
               
                [cell.tagView resetAllTags];
                
                [sender.layer setBorderWidth:1.f];
                [sender.layer setBorderColor:THEME_COLOR.CGColor];
                [sender setTitleColor:THEME_COLOR forState:UIControlStateNormal];
                //处理当前行的选中状态
                [row[@"list"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [obj setObject:@(NO) forKey:@"isSelected"];
                    //[obj setObject:@(NO) forKey:@"isCanUse"];
                }];
                [row[@"list"][index] setObject:@(YES) forKey:@"isSelected"];
                
               
                
                
            };

            [row[@"list"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                SKTag *tag = [SKTag tagWithText:[NSString stringWithFormat:@"  %@",obj[@"text"]]];
                tag.font = SYSTEM_FONT(13);
                tag.fontSize = 13;
                tag.padding = UIEdgeInsetsMake(10, 10, 10, 10);
                tag.bgColor = [UIColor whiteColor];
                tag.textColor = THEME_COLOR_GARY;
                tag.cornerRadius = 4.f;
                tag.enable = YES;
                if ([obj[@"isSelected"]boolValue] == NO) {
                    tag.textColor = THEME_COLOR_BLACK;
                }else{
                    tag.textColor = THEME_COLOR;
                    tag.borderColor = THEME_COLOR;
                    tag.borderWidth = 1.f;
                }

                [cell.tagView addTag:tag];
            }];

        }
            break;
            
        default:
        {
            TFFilterItemCell * cell = (TFFilterItemCell *)baseCell;
            [cell setIndexPath:indexPath];
            [cell setBtnClickBlock:^(UIButton *btn, NSIndexPath *indexpath) {
                [_list[indexPath.row] setValue:@(![row[@"isShowAll"] boolValue]) forKey:@"isShowAll"];
                [_tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
            }];
            cell.labTitle.text = row[@"text"];
            cell.labRight.text = row[@"value"];
            [cell.tagView removeAllTags];
            cell.tagView.preferredMaxLayoutWidth = SCREEN_WIDTH;
            cell.tagView.padding = UIEdgeInsetsMake(5, 5, 5, 5);
            cell.tagView.interitemSpacing = 5;
            cell.tagView.lineSpacing = 5;
            
            cell.tagView.didTapTagAtIndex = ^(NSUInteger index,UIButton * sender)
            {
                //处理当前行的选中状态
                [row[@"list"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [obj setObject:@(NO) forKey:@"isSelected"];
                }];
                [row[@"list"][index] setObject:@(YES) forKey:@"isSelected"];
                [row setObject:row[@"list"][index][@"text"] forKey:@"value"];
                [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            };
            
            [row[@"list"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                SKTag *tag = [SKTag tagWithText:[NSString stringWithFormat:@"  %@",obj[@"text"]]];
                tag.font = SYSTEM_FONT(13);
                tag.fontSize = 13;
                tag.cornerRadius = 4.f;
                tag.padding = UIEdgeInsetsMake(10, 10, 10, 10);
                tag.bgColor = [UIColor whiteColor];
                tag.textColor = THEME_COLOR_GARY;
                tag.enable = YES;
                if ([obj[@"isSelected"]boolValue] == NO) {
                    tag.textColor = THEME_COLOR_BLACK;
                }else{
                    tag.textColor = THEME_COLOR;
                    tag.borderColor = THEME_COLOR;
                    tag.borderWidth = 1.f;
                }
                
                [cell.tagView addTag:tag];
            }];

        }
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
   
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

- (IBAction)btnConfirmClick:(UIButton *)sender {
    [_tableView reloadData];
}
@end
