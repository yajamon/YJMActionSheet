//
//  YJMAction.m
//  YJMActionSheetDemo
//
//  Created by yajamon on 2015/07/01.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import "YJMAction.h"

@implementation YJMAction

- (instancetype)initWithTitle:(NSString *)title action:(blockButtonTapAction) action
{
    self = [super init];
    if (self) {
        self.title = title;
        self.actionBlock = action;
    }
    return self;
}

@end
