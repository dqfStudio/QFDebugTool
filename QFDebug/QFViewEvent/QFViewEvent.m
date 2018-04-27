//
//  QFViewEvent.m
//  MGMobileMusic
//
//  Created by dqf on 2017/7/20.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFViewEvent.h"
#import "QFWeakDefine.h"
#import "AppDelegate.h"
#import "QFButton.h"

@interface QFViewEvent ()
@property (nonatomic, strong) QFButton *trackBtn;
@property (nonatomic, assign) BOOL opened;
@end

@implementation QFViewEvent

- (QFButton *)trackBtn {
    if (!_trackBtn) {
        _trackBtn = [[QFButton alloc] init];
        [_trackBtn setTitle:@"tap" forState:UIControlStateNormal];
        QFWeak(self)
        [_trackBtn setTapedEvent:^{
            QFStrong(self)
            [self logPath];
        }];
    }
    return _trackBtn;
}

+ (QFViewEvent *)share
{
    static QFViewEvent *shareInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KQFViewEventCellNotiAction:) name:@"KQFViewEventCellNoti" object:nil];
    }
    return self;
}

- (UIWindow *)rootView {
    return [UIApplication sharedApplication].delegate.window;
}

- (void)KQFViewEventCellNotiAction:(NSNotification *)noti {
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
