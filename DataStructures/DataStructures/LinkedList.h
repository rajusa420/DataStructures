//
// Created by Raj on 4/1/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataCollection.h"

@interface LinkedListNode : NSObject
{
@protected
    id data_;
    LinkedListNode* next_;
}

@property (atomic, retain) NSObject* data;
@property (atomic, retain) LinkedListNode* next;
@end

@interface LinkedList : NSObject<DataCollection, DataCollectionDebug>
{
@protected
    LinkedListNode* head_;
    LinkedListNode* tail_;
    NSUInteger count_;
}
- (instancetype)init;

- (void)addObject: (NSObject*) object;
- (NSObject*)removeFirstObject;
- (NSObject*)removeObject: (NSObject*) object;
- (NSObject*)removeLastObject;
- (void)removeAllObjects;
- (BOOL)contains: (NSObject*) object;
- (NSObject*)getFirstObject;
- (NSObject*)getLastObject;

- (void)printAllObjectsWithDataType: (Class) dataType;

@property (atomic, assign) NSUInteger count;
@end