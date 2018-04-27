//
//  QFTableModel.h
//  TableModel
//
//  Created by dqf on 2017/7/13.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QFSectionModel.h"

/**
 *  QFTableModel implements some methods in UITableViewDelegate & UITableViewDataSource.
 *  it can be used as the delegate & dataSource of a tableView.
 *  For those methods it doesn't implement, you can implement them in its subclass.
 */
@interface QFTableModel : NSObject <UITableViewDelegate, UITableViewDataSource>
/** table view's section model array */
@property (nonatomic, strong, readonly) NSMutableArray<QFSectionModel *> *sectionModelArray;

//实例化对象
+ (QFTableModel *)table;

//向model添加对象数据
- (void)addObject:(QFSectionModel *)anObject;

//clear all model
- (void)clearModel;

@end
