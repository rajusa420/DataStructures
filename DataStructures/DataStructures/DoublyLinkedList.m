//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "DoublyLinkedList.h"

@implementation DoublyLinkedListNode
@synthesize data = data_;
@synthesize next = next_;
@synthesize previous = previous_;
@end

@implementation DoublyLinkedList


- (instancetype) init
{
    if (self = [super init])
    {
        head_ = nil;
        tail_ = nil;
    }

    return self;
}

- (void) dealloc
{
    [self removeAllObjects];
}

@synthesize count = count_;

- (void) addObject: (id) object
{
    DoublyLinkedListNode* newNode = [[DoublyLinkedListNode alloc] init];
    newNode.data = object;

    if (tail_)
    {
        tail_.next = newNode;
        newNode.previous = tail_;
    }

    tail_ = newNode;

    if (!head_)
        head_ = newNode;

    count_++;
}

- (id) removeFirstObject
{
    if (!head_)
        return nil;

    DoublyLinkedListNode* node = head_;
    if (tail_ == head_)
        tail_ = nil;

    head_ = head_.next;

    if (head_)
        head_.previous = nil;

    count_--;
    return node.data;
}

- (id) removeLastObject
{
    if (!head_)
        return nil;

    DoublyLinkedListNode* removedNode = tail_;
    DoublyLinkedListNode* newTail = tail_.previous;
    if (newTail)
    {
        newTail.next = nil;
        tail_ = newTail;
    }
    else
    {
        head_ = nil;
        tail_ = nil;
    }

    count_--;
    return removedNode.data;
}

- (id) removeObject: (id) object
{
    if (!head_)
        return nil;

    DoublyLinkedListNode* current = head_;
    while (current != nil)
    {
        if (current.data == object)
        {
            DoublyLinkedListNode* previous = current.previous;
            if (head_ == current)
            {
                head_ = current.next;
                if (head_)
                    head_.previous = nil;
            }

            if (tail_ == current)
            {
                tail_ = previous;
            }

            if (previous)
                previous.next = current.next;

            count_--;
            return current.data;
        }

        current = current.next;
    }

    return nil;
}

- (void) removeAllObjects
{
    if (!head_)
        return;

    DoublyLinkedListNode* current = head_;
    while (current != nil)
    {
        DoublyLinkedListNode* next = current.next;
        current.data = nil;
        current.next = nil;
        current.previous = nil;
        current = next;
    }

    head_ = nil;
    tail_ = nil;
    count_ = 0;
}

- (BOOL) contains: (id) object
{
    if (!head_)
        return NO;

    DoublyLinkedListNode* current = head_;
    while (current != nil)
    {
        if (current.data == object)
            return YES;

        current = current.next;
    }

    return NO;
}

- (id) getFirstObject
{
    if (head_)
        return head_.data;

    return nil;
}

- (id) getLastObject
{
    if (tail_)
        return tail_.data;

    return nil;
}

- (id) getObjectAtIndex: (NSUInteger) index
{
    if (!head_)
        return nil;

    DoublyLinkedListNode* current = head_;
    NSUInteger position = 0;
    while (current != nil)
    {
        if (position == index)
            return current.data;

        position++;
        current = current.next;
    }
    return nil;
}

- (void) printAllObjectsWithDataType: (Class) dataType
{
    if (!head_)
        return;

    DoublyLinkedListNode* current = head_;
    while (current != nil)
    {
        if ([NSNumber class] == dataType)
        {
            NSNumber* object = (NSNumber*)current.data;
            NSLog(@"%@", [object stringValue]);
        }
        current = current.next;
    }
}
@end