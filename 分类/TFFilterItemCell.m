//
//  TFFilterItemCell.m
//  deng
//
//  Created by 朝辉钟 on 16/5/6.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "TFFilterItemCell.h"

@implementation TFFilterItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnClick:(UIButton *)sender {
    if (_btnClickBlock) {
        _btnClickBlock(sender,_indexPath);
    }
}
@end
