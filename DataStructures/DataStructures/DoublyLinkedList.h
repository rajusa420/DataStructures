//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataCollection.h"

@interface DoublyLinkedListNode : NSObject
{
@protected
    id data_;
    DoublyLinkedListNode* next_;
    DoublyLinkedListNode* previous_;
}

@property (atomic, retain) id data;
@property (atomic, retain) DoublyLinkedListNode* next;
@property (atomic, retain) DoublyLinkedListNode* previous;
@end

@interface DoublyLinkedList : NSObject<DataCollection, DataCollectionDebug>
{
@protected
    DoublyLinkedListNode* head_;
    DoublyLinkedListNode* tail_;
    NSUInteger count_;
}

- (void)addObject: (id) object;
- (id)removeFirstObject;
- (id)removeObject: (id) object;
- (id)removeLastObject;
- (void)removeAllObjects;
- (BOOL)contains: (id) object;
- (id)getFirstObject;
- (id)getLastObject;

- (void)printAllObjectsWithDataType: (Class) dataType;

@property (atomic, assign) NSUInteger count;

@end