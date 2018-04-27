//
//  QFTableView.m
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFTableView.h"
#import "QFHeader.h"

@interface QFTableView ()

@property (nonatomic, strong) QFTableModel *tableModel;

@end

@implementation QFTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableModel = [[QFTableModel alloc] init];
        self.delegate = self.tableModel;
        self.dataSource = self.tableModel;
    }
    return self;
}

//add QFSectionModel
- (void)addModel:(QFSectionModel*)anObject withBlock:(void (^)(BOOL *ended))block {
    if ([anObject isKindOfClass:[QFSectionModel class]]) {
        [self.tableModel.sectionModelArray addObject:anObject];
        if (block) {
            BOOL ended = NO;
            block(&ended);
            if (ended) {
                [self refreshModel];                
            }
        }
    }
}

//clear all model
- (void)clearModel {
    if (self.tableModel.sectionModelArray.count > 0) {
        [self.tableModel.sectionModelArray removeAllObjects];
        [self refreshModel];
    }
}

//refresh model
- (void)refreshModel {
    [self reloadData];
}

@end

