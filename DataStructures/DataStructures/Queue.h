//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FIFOCollection.h"

@protocol DataCollection;

@interface Queue : NSObject<FIFOCollection, FIFOCollectionDebug>
{
@protected
    NSObject<DataCollection>* queue_;
}

- (instancetype) init;
- (instancetype) initWithCollection: (NSObject<DataCollection>*) collectionObject;

- (void) push: (NSObject*) object;
- (NSObject*) pop;
- (NSObject*) peek;
- (void) removeAllObjects;
- (NSUInteger) count;

- (void) logQueueCollectionObject;
@end