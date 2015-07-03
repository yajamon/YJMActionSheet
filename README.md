# YJMActionSheet
UIActionSheet is deprecated in iOS8.3. This class is selectively used UIActionSheet and UIAlertController to see the iOS version.

## Description

## Demo

```bash
$ git clone https://github.com/yajamon/YJMActionSheet.git
$ open YJMActionSheet/Demo/YJMActionSheetDemo/YJMActionSheetDemo.xcodeproj
```

## VS. 

## Requirement

### Frameworks
- Foundation.framework
- UIKit.framework

## Usage

```objective-c
// bound method
- (IBAction)openActionSheet:(id)sender {
    // create title and action
    YJMAction *cancel = [[YJMAction alloc] initWithTitle:@"cancel" action:^(){
        // write processing when the user taps cancel
    }];
    YJMAction *other = [[YJMAction alloc] initWithTitle:@"other" action:^(){
        // write processing when the user taps other
    }];
    
    // create ActionSheet instance
    self.actionSheet = [[YJMActionSheet alloc] initWithTitle:@"Sheet title"
                                                cancelAction:cancel
                                           destructiveAction:nil
                                                 otherAction:other];

    // show ActionSheet
    [self.actionSheet showInViewController:self];
}
```

## Install
Add the following files to your project.
- YJMAction.h
- YJMAction.m
- YJMActionSheet.h
- YJMActionSheet.m

Import header file.
```objective-c
#import "YJMActionSheet.h"
```

## Contribution

## Licence

[MIT](https://github.com/yajamon/YJMActionSheet/blob/master/LICENSE)

## Author

[yajamon](https://github.com/yajamon)
