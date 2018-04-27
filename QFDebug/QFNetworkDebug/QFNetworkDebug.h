//
//  QFNetworkDebug.h
//  MGMobileMusic
//
//  Created by dqf on 2017/7/18.
//  Copyright © 2017年 migu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QFNetworkDebug : NSObject

+ (QFNetworkDebug *)share;
- (void)debug:(void(^)())callback;

@end
