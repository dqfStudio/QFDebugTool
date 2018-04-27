//
//  QFBaseCell.h
//  TableModel
//
//  Created by dqf on 2017/7/14.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KGetClassInterface + (Class)getClass;

#define KGetClassImplementation + (Class)getClass {\
    return self.class;\
}

@interface QFBaseCell : UITableViewCell

KGetClassInterface

+ (id)registerTable:(UITableView *)table;

//子类覆盖
- (void)initUI;

@end
