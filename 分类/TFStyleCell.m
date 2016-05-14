//
//  TFStyleCell.m
//  deng
//
//  Created by 朝辉钟 on 16/3/5.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "TFStyleCell.h"

@implementation TFStyleCell

- (void)awakeFromNib {
    // Initialization code
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)btnClick:(UIButton *)sender {
    //[_leftView setHidden:NO];
    //[sender setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}
@end
