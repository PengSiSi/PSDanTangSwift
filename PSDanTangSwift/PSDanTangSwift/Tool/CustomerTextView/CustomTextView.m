//
//  CustomTextView.m
//  自定义TextView的实现
//
//  Created by 思 彭 on 16/6/6.
//  Copyright © 2016年 combanc. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setPlaceholderStr:@""];
        [self setPalceHolderColor:[UIColor lightGrayColor]];
        
    }
    return self;
}

// 接收数据

- (void)setPlaceholderStr:(NSString *)placeholderStr{
    
    if (_placeholderStr != placeholderStr) {
        
        _placeholderStr = placeholderStr;
        
        // 防止创建多个
        
        [self.placeHolderLabel removeFromSuperview];
        self.placeHolderLabel = nil;
        
        // 重新绘制  会调用drawRect方法
        
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    if (self.placeholderStr.length > 0) {
        
        if (_placeHolderLabel == nil) {
            _placeHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16, 0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.palceHolderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        _placeHolderLabel.text = self.placeholderStr;
        
        //自适应宽高
        [_placeHolderLabel sizeToFit];
        
    }
    if ([[self text] length] == 0 && [[self placeholderStr] length] >0) {
        [[self viewWithTag:999] setAlpha:1.0];
    }

}

//- (void)textChanged:(NSNotification *)notification{
//    
//    if ([[self placeholderStr] length] == 0) {
//        return;
//    }
//    
//    if ([[self text] length] == 0) {
//        [[self viewWithTag:999] setAlpha:1.0];
//    }
//    
//    else{
//        
//        [[self viewWithTag:999] setAlpha:0];
//    }
//    
//}
//

@end
