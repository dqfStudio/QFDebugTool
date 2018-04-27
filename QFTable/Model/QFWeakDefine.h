//
//  QFWeakDefine.h
//  TableModel
//
//  Created by dqf on 2017/7/13.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#ifndef QFWeakDefine_h
#define QFWeakDefine_h

#ifndef weakifyObject
#if __has_feature(objc_arc)
#define weakifyObject(object) ext_keywordify __weak __typeof__(object) weak##_##object = object;
#else
#define weakifyObject(object) ext_keywordify __block __typeof__(object) block##_##object = object;
#endif
#endif

#ifndef strongifyObject
#if __has_feature(objc_arc)
#define strongifyObject(object) ext_keywordify __strong __typeof__(object) object = weak##_##object;
#else
#define strongifyObject(object)                                                                    \
    ext_keywordify __strong __typeof__(object) object = block##_##object;
#endif
#endif

#undef QFWeak
#define QFWeak(...) @weakifyObject(__VA_ARGS__)

#undef QFStrong
#define QFStrong(...) @strongifyObject(__VA_ARGS__)

#if DEBUG
#define ext_keywordify                                                                             \
    autoreleasepool {                                                                              \
    }
#else
#define ext_keywordify                                                                             \
    try {                                                                                          \
    } @catch (...) {                                                                               \
    }
#endif

#endif

/* QFWeakDefine_h */

/*
 eg:
     QFWeak(self);
     self.block = ^(NSString *test){
        QFStrong(self);
        self.model = 1;
        void (^inBlock)(void) = ^(){
            QFStrong(self);
            self.model = 3;
     };
        inBlock();
     };

     Demo *model = [[Demo alloc] init];
     QFWeak(model);
     self.modelBlock = ^(NSString *modelStr){
        QFStrong(model);
        QFStrong(self);
        [model modelWithViewController:self];
     };

     self.block(@"sds");

 */
