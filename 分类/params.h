//
//  params.h
//  pdb
//
//  Created by 朝辉钟 on 16/4/20.
//  Copyright © 2016年 TF. All rights reserved.
//
#import "UIColor+Colours.h"
#ifndef params_h
#define params_h



#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS   [UIScreen mainScreen].bounds
#define SYSTEM_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]
#define THEME_COLOR [UIColor colorFromHexString:@"#f55f0c"]
#define THEME_COLOR_BLACK [UIColor colorFromHexString:@"#363636"]
#define THEME_COLOR_GARY [UIColor colorFromHexString:@"#888888"]
#define THEME_COLOR_BACKGROUND [UIColor colorFromHexString:@"#F4F4F4"]
#define THEME_COLOR_D9D9D9 [UIColor colorFromHexString:@"#D9D9D9"]
#define SYSTEM_FONT(tmp)  [UIFont fontWithName:@"Avenir-Light" size:tmp]


#endif /* params_h */
