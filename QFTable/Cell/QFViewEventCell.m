//
//  QFViewEventCell.m
//  MGMobileMusic
//
//  Created by dqf on 2017/7/20.
//  Copyright © 2017年 migu. All rights reserved.
//

#import "QFViewEventCell.h"

@implementation QFViewEventCell

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
    self.textLabel.text = @"点击追踪";
    [self addSubview:self.switchButton];
}

-(void)switchAction:(UISwitch *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KQFViewEventCellNoti" object:[NSNumber numberWithBool:sender.isOn]];
}

@end
