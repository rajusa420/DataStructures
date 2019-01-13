//
// Created by Raj on 4/1/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataCollection <NSObject>
@required
- (void)addObject: (NSObject*) object;
- (NSObject*)removeFirstObject;
- (NSObject*)removeObject: (NSObject*) object;
- (NSObject*)removeLastObject;
- (void)removeAllObjects;
- (BOOL)contains: (NSObject*) object;
- (NSUInteger) count;
- (NSObject*)getFirstObject;
- (NSObject*)getLastObject;
- (NSObject*)getObjectAtIndex: (NSUInteger) index;
@end

@protocol DataCollectionDebug <NSObject>
- (void) printAllObjectsWithDataType: (Class) dataType;
@end

@interface DataCollectionTest : NSObject
+ (void) dataCollectionAddRemoveTests: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection;
+ (void) dataCollectionAddTest: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection;
+ (void)dataCollectionRemoveAllTest: (NSObject <DataCollection, DataCollectionDebug> *) dataCollection;
+ (void)dataCollectionRemoveMiddleItem: (NSObject <DataCollection, DataCollectionDebug> *) dataCollection;
+ (void) dataCollectionContainsMiddleItem: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection;
+ (void) dataCollectionReturnObjectTest: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection;
+ (void)basicDataCollectionTest: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection;
@end