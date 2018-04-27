//
//  QFNetworkDebugCell.m
//  T4est
//
//  Created by dqf on 2017/7/19.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFNetworkDebugCell.h"

@implementation QFNetworkDebugCell

KGetClassImplementation

- (UISwitch *)switchButton {
    if (!_switchButton) {
        _switchButton = [[UISwitch alloc] init];
        _switchButton.center = CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds)-CGRectGetWidth(_switchButton.frame), self.center.y);
        [_switchButton addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchButton;
}

- (void)initUI {
    self.textLabel.text = @"网络调试";
    [self addSubview:self.switchButton];
}

-(void)switchAction:(UISwitch *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KQFNetworkDebugCellNoti" object:[NSNumber numberWithBool:sender.isOn]];
}

@end
