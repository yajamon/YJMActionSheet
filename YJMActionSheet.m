//
//  YJMActionSheet.m
//  YJMActionSheetDemo
//
//  Created by yajamon on 2015/07/01.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import "YJMActionSheet.h"

@implementation YJMActionSheet

- (instancetype)initWithTitle:(NSString *)title cancelAction:(YJMAction *)cancel destructiveAction:(YJMAction *)destructive otherAction:(YJMAction *)other
{
    self = [super init];
    if (self) {
        NSString *cancelTitle = nil;
        NSString *destructiveTitle = nil;
        NSString *otherTitle = nil;
        if (cancel) {
            cancelTitle = cancel.title;
        }
        if (destructive) {
            destructiveTitle = destructive.title;
        }
        if (other) {
            otherTitle = other.title;
        }
        float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
        if (iOSVersion >= 8.0f) {
            self.alertController = [UIAlertController alertControllerWithTitle:title
                                                                       message:nil
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
            if (cancel) {
                [self.alertController addAction:[UIAlertAction actionWithTitle:cancel.title style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                    cancel.actionBlock();
                }]];
            }
            if (destructive) {
                [self.alertController addAction:[UIAlertAction actionWithTitle:destructive.title style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                    destructive.actionBlock();
                }]];
            }
            if (other) {
                [self.alertController addAction:[UIAlertAction actionWithTitle:other.title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                    other.actionBlock();
                }]];
            }
            
        } else {
            __weak YJMActionSheet *wself = self;
            self.actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                           delegate:wself
                                                  cancelButtonTitle:cancelTitle
                                             destructiveButtonTitle:destructiveTitle
                                                  otherButtonTitles:otherTitle, nil];
        }
    }
    return self;
}

- (void) showInViewController:(UIViewController *)target
{
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (iOSVersion >= 8.0f) {
        [target presentViewController:self.alertController animated:YES completion:nil ];
    } else {
        [self.actionSheet showInView:target.view];
    }
}

@end
