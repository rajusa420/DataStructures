//
// Created by Raj on 4/3/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TreeCollection <NSObject>
@required
- (void)addObject: (id) data;
- (void)removeObject: (id) data;
- (BOOL)contains: (id) data;
@end

@protocol TreeCollectionDebug <NSObject>
- (void) printAllObjectsPreOrderWithDataType: (Class) dataType;
- (void) printAllObjectsInOrderWithDataType: (Class) dataType;
- (void) printAllObjectsPostOrderWithDataType: (Class) dataType;
@end

@interface TreeCollectionTests : NSObject
+ (void) addRemoveTest: (NSObject<TreeCollection, TreeCollectionDebug>*) treeCollection;
@end