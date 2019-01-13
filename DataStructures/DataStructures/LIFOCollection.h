//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LIFOCollection <NSObject>
@required
- (void) push: (NSObject*) object;
- (NSObject*) pop;
- (NSObject*) peek;
- (void) removeAllObjects;
- (NSUInteger) count;
@end

@protocol LIFOCollectionDebug <NSObject>
@required
- (void) logStackCollectionObject;
@end

@interface LIFOCollectionTests : NSObject
+ (void) LIFOCollectionPushPopTest: (NSObject<LIFOCollection, LIFOCollectionDebug>*) lifoCollection;
@end