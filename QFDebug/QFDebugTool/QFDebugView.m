//
//  QFDebugView.m
//  T4est
//
//  Created by dqf on 2017/7/19.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFDebugView.h"
#import "QFHeader.h"
#import "QFTableView.h"
#import "QFNetworkDebugCell.h"
#import "QFTrackingPathCell.h"
#import "QFViewEventCell.h"

@implementation QFDebugView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imgView = [[UIImageView alloc] init];
        [imgView setFrame:self.frame];
        [imgView setImage:[UIImage imageNamed:@"qfLaunchImage.jpg"]];
        [self addSubview:imgView];
        
        QFTableView *table = [[QFTableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-40)];
        [table setBackgroundColor:[UIColor clearColor]];
        [self addSubview:table];
        [table addModel:[self tableSection]  withBlock:^(BOOL *ended) {
            *ended = YES;
        }];
        
        _lineView = [[UIControl alloc] init];
        [_lineView setFrame:CGRectMake(0, CGRectGetHeight(self.frame)-40, CGRectGetWidth(self.frame), 40)];
        [_lineView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        [self addSubview:_lineView];
    }
    return self;
}

- (QFSectionModel *)tableSection {
    //QFWeak(self);
    QFSectionModel *sectionModel = [QFSectionModel section];
    sectionModel.headerHeight = 22;
    sectionModel.footerHeight = 1;
    // tracking path cell
    QFCellModel *cellModel = [QFCellModel cell];
    cellModel.height = 55;
    [sectionModel addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFTrackingPathCell *cell = [QFTrackingPathCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    // network debug cell
    cellModel = [QFCellModel cell];
    cellModel.height = 55;
    [sectionModel addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFNetworkDebugCell *cell = [QFNetworkDebugCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    // view event cell
    cellModel = [QFCellModel cell];
    cellModel.height = 55;
    [sectionModel addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *table) {
        QFViewEventCell *cell = [QFViewEventCell registerTable:table];
        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.35]];
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *table) {
        [table deselectRowAtIndexPath:indexPath animated:YES];
    };
    return sectionModel;
}

@end
