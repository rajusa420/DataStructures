//
// Created by Raj on 4/1/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataCollection <NSObject>
@required
- (void)addObject: (id) object;
- (id)removeFirstObject;
- (id)removeObject: (id) object;
- (id)removeLastObject;
- (void)removeAllObjects;
- (BOOL)contains: (id) object;
@end

@protocol DataCollectionDebug <NSObject>
- (void) printAllObjectsWithDataType: (Class) dataType;
@end

@interface DataCollectionTest : NSObject
+ (void)basicDataCollectionTest: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection;
@end