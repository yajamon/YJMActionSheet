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
        self.actionList = [[NSMutableArray alloc] init];
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
            self.actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                           delegate:self
                                                  cancelButtonTitle:cancelTitle
                                             destructiveButtonTitle:destructiveTitle
                                                  otherButtonTitles:otherTitle, nil];
            if (destructive) {
                [self.actionList addObject:destructive.actionBlock];
            }
            if (other) {
                [self.actionList addObject:other.actionBlock];
            }
            if (cancel) {
                [self.actionList addObject:cancel.actionBlock];
            }

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

- (void) addAction:(YJMAction *)newAction {
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (iOSVersion >= 8.0f) {
        [self.alertController addAction:[UIAlertAction actionWithTitle:newAction.title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            newAction.actionBlock();
        }]];
    } else {
        [self.actionSheet addButtonWithTitle:newAction.title];
        [self.actionList addObject:newAction.actionBlock];
    }
}

- (void) addCancelAction:(YJMAction *)newAction {
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (iOSVersion >= 8.0f) {
        [self.alertController addAction:[UIAlertAction actionWithTitle:newAction.title style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            newAction.actionBlock();
        }]];
    } else {
        NSInteger buttonIndex = [self.actionSheet addButtonWithTitle:newAction.title];
        [self.actionList addObject:newAction.actionBlock];
        
        self.actionSheet.cancelButtonIndex = buttonIndex;
    }
}


#pragma mark - <UIActionSheetDelegate>
- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    NSInteger actionIndex = self.actionSheet.cancelButtonIndex;
    if (actionIndex < 0) {
        return;
    }
    
    blockButtonTapAction action = (blockButtonTapAction)self.actionList[actionIndex];
    action();
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    blockButtonTapAction action = (blockButtonTapAction)self.actionList[buttonIndex];
    action();
}


@end
