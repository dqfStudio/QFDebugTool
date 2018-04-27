//
//  QFTrackingPath.m
//  Review
//
//  Created by dqf on 2017/7/18.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFTrackingPath.h"
#import "QFWeakDefine.h"
#import "AppDelegate.h"
#import "QFButton.h"

@interface QFTrackingPath ()
@property (nonatomic, strong) QFButton *trackBtn;
@end

@implementation QFTrackingPath

- (QFButton *)trackBtn {
    if (!_trackBtn) {
        _trackBtn = [[QFButton alloc] init];
        [_trackBtn setTitle:@"path" forState:UIControlStateNormal];
        [_trackBtn setBackgroundColor:[UIColor greenColor]];
        QFWeak(self)
        [_trackBtn setTapedEvent:^{
            QFStrong(self)
            [self logPath];
        }];
    }
    return _trackBtn;
}

+ (QFTrackingPath *)share {
    static dispatch_once_t predicate;
    static QFTrackingPath *sm;
    dispatch_once(&predicate, ^{
        sm = [[self alloc] init];
    });
    return sm;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KQFTrackingPathCellNotiAction:) name:@"KQFTrackingPathCellNoti" object:nil];
    }
    return self;
}

- (UIWindow *)rootView {
    return [UIApplication sharedApplication].delegate.window;
}

- (void)KQFTrackingPathCellNotiAction:(NSNotification *)noti {
    NSNumber *notiValue = noti.object;
    if (notiValue.boolValue) {
        [[self rootView] addSubview:self.trackBtn];
        [[self rootView] bringSubviewToFront:self.trackBtn];
    }else {
        [self.trackBtn removeFromSuperview];
    }
}

- (void)logPath {
    
    UINavigationController *navi = (UINavigationController *)[CoordinatingController sharedInstance].rootNavController;
    
    NSMutableString *mutableStr = [[NSMutableString alloc] init];
    NSUInteger count = navi.viewControllers.count;
    for (int i=0; i<count; i++) {
        UIViewController *vc = navi.viewControllers[i];
        [mutableStr appendFormat:@"%@->",NSStringFromClass([vc class])];
        
        NSUInteger count2 = vc.childViewControllers.count;
        for (int j=0; j<count2; j++) {
            UIViewController *tmpVC = vc.childViewControllers[j];
            if (tmpVC.isViewLoaded && tmpVC.view.window && !tmpVC.view.hidden) {
                [mutableStr appendFormat:@"%@->",NSStringFromClass([tmpVC class])];
            }
        }
    }
    NSLog(@"StackInfo: \n\n%@\n",mutableStr);
//    [self saveToFile:mutableStr];

}

- (void)saveToFile:(NSString *)str {
    NSString *path = @"/Users/issuser/Desktop/WorkPlace/日志/日志.txt";
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        [fileManager createFileAtPath:path contents:nil attributes:nil];
    }
    
    NSString *contentStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:contentStr];
    [mutableStr appendFormat:@"%@\n\n",str];
    
    [mutableStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}

@end
