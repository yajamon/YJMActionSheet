//
//  YJMActionSheet.h
//  YJMActionSheetDemo
//
//  Created by yajamon on 2015/07/01.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJMAction.h"

@interface YJMActionSheet : NSObject<UIActionSheetDelegate>

@property (nonatomic) UIActionSheet *actionSheet;
@property (nonatomic) UIAlertController *alertController;
@property (nonatomic) NSMutableArray *actionList;
@property (nonatomic) NSMutableArray *cancelAction;

- (instancetype)init __attribute__((unavailable("init is not available")));

@end
