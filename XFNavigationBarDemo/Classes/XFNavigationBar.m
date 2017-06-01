//
//  XFNavigationBar.m
//  XFNavigationBarDemo
//
//  Created by mc on 2017/5/17.
//  Copyright © 2017年 科大讯飞. All rights reserved.
//

#import "XFNavigationBar.h"

@interface XFNavigationBar ()


@end

@implementation XFNavigationBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.backBtn];
    }
    return self;
}

- (UIButton *)backBtn{
    if(!_backBtn){
        _backBtn = [[UIButton alloc] init];
        _backBtn.frame = CGRectMake(10, 20, 30, 30);
        [_backBtn setImage:[UIImage imageNamed:@"icon 返回 白"] forState:UIControlStateNormal];
        
    }
    return _backBtn;
}

@end
