//
//  UINavigationBar+XFNavigationbar.m
//  XFNavigationBarDemo
//
//  Created by mc on 2017/5/19.
//  Copyright © 2017年 科大讯飞. All rights reserved.
//

#import "UINavigationBar+XFNavigationbar.h"
#import <objc/runtime.h>

static const char * key = "overLayer";

@implementation UINavigationBar (XFNavigationbar)


- (void)setOverLayer:(UIView *)overLayer{
    objc_setAssociatedObject(self, key, overLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)overLayer{
    return objc_getAssociatedObject(self, key);
}




@end
