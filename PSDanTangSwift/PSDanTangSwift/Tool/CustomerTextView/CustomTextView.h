//
//  CustomTextView.h
//  自定义TextView的实现
//
//  Created by 思 彭 on 16/6/6.
//  Copyright © 2016年 combanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTextView : UITextView

@property (nonatomic , strong) UILabel *placeHolderLabel; // 默认的Label
@property (nonatomic , strong) NSString *placeholderStr;  // 默认的文字显示
@property (nonatomic , strong) UIColor *palceHolderColor;  //默认文字显示的颜色

@end
