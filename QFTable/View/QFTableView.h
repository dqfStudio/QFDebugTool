//
//  QFTableView.h
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFSectionModel.h"

/**
 *  QFTableView implements some methods in UITableViewDelegate & UITableViewDataSource.
 *  it can be used as the delegate & dataSource of a tableView.
 *  For those methods it doesn't implement, you can implement them in its subclass.
 */
@interface QFTableView : UITableView

//add QFSectionModel
- (void)addModel:(QFSectionModel*)anObject withBlock:(void (^)(BOOL *ended))block;

//clear all model
- (void)clearModel;

@end
