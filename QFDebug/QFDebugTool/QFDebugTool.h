//
//  QFDebugTool.h
//  T4est
//
//  Created by dqf on 2017/7/19.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFDebugTool : NSObject

+ (QFDebugTool *)share;

- (void)hideDebugView;
- (void)displayDebugView;

@end
