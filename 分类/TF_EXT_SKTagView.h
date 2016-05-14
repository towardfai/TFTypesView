//
//  TF_EXT_SKTagView.h
//  deng
//
//  Created by 朝辉钟 on 16/3/11.
//  Copyright © 2016年 TF. All rights reserved.
//

#import <SKTagView/SKTagView.h>
#import "SKTagButton.h"


@interface TF_EXT_SKTagView : SKTagView
-(SKTagButton *)buttonWithIndex:(NSInteger)buttonIndex;








-(void)resetAllTags;
@end
