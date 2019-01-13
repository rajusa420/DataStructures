//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataCollection.h"

@interface DoublyLinkedListNode : NSObject
{
@protected
    NSObject* data_;
    DoublyLinkedListNode* next_;
    DoublyLinkedListNode* previous_;
}

@property (atomic, retain) NSObject* data;
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