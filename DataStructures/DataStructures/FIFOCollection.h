//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FIFOCollection <NSObject>
@required
- (void) push: (NSObject*) object;
- (NSObject*) pop;
- (NSObject*) peek;
- (void) removeAllObjects;
- (NSUInteger) count;
@end

@protocol FIFOCollectionDebug <NSObject>
@required
- (void) logQueueCollectionObject;
@end

@interface FIFOCollectionTests : NSObject
+ (void) FIFOCollectionPushPopTest: (NSObject<FIFOCollection, FIFOCollectionDebug>*) fifoCollection;
@end