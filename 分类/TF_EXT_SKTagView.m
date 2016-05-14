//
//  TF_EXT_SKTagView.m
//  deng
//
//  Created by 朝辉钟 on 16/3/11.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "TF_EXT_SKTagView.h"

@implementation TF_EXT_SKTagView





-(SKTagButton *)buttonWithIndex:(NSInteger)buttonIndex
{
    SKTagButton *btn = self.subviews[buttonIndex];
    return btn;
}

-(void)resetAllTags
{
    [self.tags enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SKTagButton *btn = self.subviews[idx];
        [btn.layer setBorderWidth:0.f];
        [btn.layer setBorderColor:[UIColor redColor].CGColor];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }];
}







@end
