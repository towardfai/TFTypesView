//
//  TFFilterItemCell.h
//  deng
//
//  Created by 朝辉钟 on 16/5/6.
//  Copyright © 2016年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TF_EXT_SKTagView.h"





@interface TFFilterItemCell : UITableViewCell
@property(nonatomic,strong)NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labRight;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet TF_EXT_SKTagView *tagView;
- (IBAction)btnClick:(UIButton *)sender;
@property(nonatomic,copy)void(^btnClickBlock)(UIButton * btn,NSIndexPath* indexPath);
@end
