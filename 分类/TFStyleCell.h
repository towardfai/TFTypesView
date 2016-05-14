//
//  TFStyleCell.h
//  deng
//
//  Created by 朝辉钟 on 16/3/5.
//  Copyright © 2016年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFStyleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btnText;

@property (weak, nonatomic) IBOutlet UIView *leftView;
- (IBAction)btnClick:(UIButton *)sender;


@end
