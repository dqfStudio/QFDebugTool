//
//  QFSectionModel.m
//  TableModel
//
//  Created by dqf on 2017/7/13.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFSectionModel.h"

@implementation QFSectionModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _headerHeight = UITableViewAutomaticDimension;
        _footerHeight = UITableViewAutomaticDimension;
        _cellModelArray = [NSMutableArray array];
    }
    return self;
}

+ (QFSectionModel *)section {
    return [[self alloc] init];
}

- (void)addObject:(QFCellModel *)anObject {
    if ([anObject isKindOfClass:[QFCellModel class]]) {
        [self.cellModelArray addObject:anObject];
    }
}

- (void)clearModel {
    if (self.cellModelArray.count > 0) {
        [self.cellModelArray removeAllObjects];
    }
}

@end
