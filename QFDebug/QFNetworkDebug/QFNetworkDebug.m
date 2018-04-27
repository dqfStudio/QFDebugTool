//
//  QFNetworkDebug.m
//  MGMobileMusic
//
//  Created by dqf on 2017/7/18.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFNetworkDebug.h"
#import "QFWeakDefine.h"
#import "AppDelegate.h"
#import "QFButton.h"

@interface QFNetworkDebug ()
@property (nonatomic, assign) BOOL opened;
@property (nonatomic, strong) QFButton *trackBtn;
@end

@implementation QFNetworkDebug

- (QFButton *)trackBtn {
    if (!_trackBtn) {
        _trackBtn = [[QFButton alloc] init];
        [_trackBtn setTitle:@"net" forState:UIControlStateNormal];
        QFWeak(self)
        [_trackBtn setTapedEvent:^{
            QFStrong(self)
            [self logPath];
        }];
    }
    return _trackBtn;
}

+ (QFNetworkDebug *)share {
    static dispatch_once_t predicate;
    static QFNetworkDebug *sm;
    dispatch_once(&predicate, ^{
        sm = [[self alloc] init];
    });
    return sm;
}

- (void)debug:(void(^)())callback {
    if (self.opened) {
        if (callback) {
            callback();
        }
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KQFNetworkDebugCellNotiAction:) name:@"KQFNetworkDebugCellNoti" object:nil];
    }
    return self;
}

- (UIWindow *)rootView {
    return [UIApplication sharedApplication].delegate.window;
}

- (void)KQFNetworkDebugCellNotiAction:(NSNotification *)noti {
    NSNumber *notiValue = noti.object;
    if (notiValue.boolValue) {
        [[self rootView] addSubview:self.trackBtn];
        [[self rootView] bringSubviewToFront:self.trackBtn];
    }else {
        [self.trackBtn removeFromSuperview];
    }
}

- (void)logPath {
    if ([self.trackBtn.backgroundColor isEqual:[UIColor redColor]]) {
        self.opened = YES;
        [self.trackBtn setBackgroundColor:[UIColor greenColor]];
    }else {
        self.opened = NO;
        [self.trackBtn setBackgroundColor:[UIColor redColor]];
    }
}

@end
