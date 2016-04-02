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

@property (atomic, retain) id data;
@property (atomic, retain) LinkedListNode* next;
@end

@interface LinkedList : NSObject<DataCollection, DataCollectionDebug>
{
@protected
    LinkedListNode* head_;
    LinkedListNode* tail_;
}
- (instancetype)init;

- (void)addObject: (id) object;
- (id)removeFirstObject;
- (id)removeObject: (id) object;
- (id)removeLastObject;
- (void)removeAllObjects;
- (BOOL)contains: (id) object;

- (void)printAllObjectsWithDataType: (Class) dataType;
@end