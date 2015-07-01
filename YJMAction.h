//
//  YJMAction.h
//  YJMActionSheetDemo
//
//  Created by yajamon on 2015/07/01.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^blockButtonTapAction) ();

@interface YJMAction : NSObject

@property (nonatomic) NSString *title;
@property (copy) blockButtonTapAction actionBlock;

- (instancetype)init __attribute__((unavailable("init is not available")));

@end
