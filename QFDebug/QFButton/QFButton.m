//
//  QFButton.m
//  MGMobileMusic
//
//  Created by dqf on 2017/7/20.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFButton.h"

#define KWidth   50
#define KHeight  50
#define KRadius  25

@implementation QFButton

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(0, 64, KWidth, KHeight)];
        [self.layer setCornerRadius:KRadius];
        [self setBackgroundColor:[UIColor redColor]];
        [self addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestures:)];
        //无论最大还是最小都只允许一个手指
        panGestureRecognizer.minimumNumberOfTouches = 1;
        panGestureRecognizer.maximumNumberOfTouches = 1;
        [self addGestureRecognizer:panGestureRecognizer];
    }
    return self;
}

- (void)action:(id)sender {
    if (self.tapedEvent) {
        self.tapedEvent();
    }
}

- (void)handlePanGestures:(UIPanGestureRecognizer*)paramSender {
    if (paramSender.state != UIGestureRecognizerStateEnded && paramSender.state != UIGestureRecognizerStateFailed){
        //通过使用 locationInView 这个方法,来获取到手势的坐标
        
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        CGPoint location = [paramSender locationInView:paramSender.view.superview];
        
        if (location.x <=KRadius) {
            location.x = KRadius;
        }else if (location.x>= screenSize.width-KRadius) {
            location.x = screenSize.width - KRadius;
        }
        
        if (location.y <=KRadius) {
            location.y = KRadius;
        }else if (location.y>= screenSize.height-KRadius) {
            location.y = screenSize.height - KRadius;
        }
        
        paramSender.view.center = location;
    }
}

@end
