//
//  QFViewEvent.h
//  MGMobileMusic
//
//  Created by dqf on 2017/7/20.
//  Copyright © 2017年 migu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFViewEvent : UIView

+ (QFViewEvent *)share;
- (void)debug:(void(^)())callback;

@end
