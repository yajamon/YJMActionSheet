//
//  ViewController.m
//  YJMActionSheetDemo
//
//  Created by yajamon on 2015/07/01.
//  Copyright (c) 2015年 yajamon. All rights reserved.
//

#import "ViewController.h"
#import "YJMActionSheet.h"

@interface ViewController ()

@property (nonatomic) YJMActionSheet *actionSheet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openActionSheet:(id)sender {
    YJMAction *destructive = [[YJMAction alloc] initWithTitle:@"destructive" action:^(){
        NSLog(@"destructive tapped");
    }];
    YJMAction *cancel = [[YJMAction alloc] initWithTitle:@"cancel" action:^(){
        NSLog(@"cancel tapped");
    }];
    YJMAction *other = [[YJMAction alloc] initWithTitle:@"other" action:^(){
        NSLog(@"other tapped");
    }];
    self.actionSheet = [[YJMActionSheet alloc] initWithTitle:@"Sheet title"
                                                           cancelAction:nil
                                                      destructiveAction:nil
                                                            otherAction:other];
    
    YJMAction *addAction = [[YJMAction alloc] initWithTitle:@"add button" action:^(){
        NSLog(@"add tapped");
    }];
    [self.actionSheet addAction:addAction];
    
    [self.actionSheet addDestructiveAction:destructive];
    
    [self.actionSheet addCancelAction:cancel];
    
    [self.actionSheet showInViewController:self];
}

@end
