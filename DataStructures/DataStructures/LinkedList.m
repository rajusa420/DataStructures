//
// Created by Raj on 4/1/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedListNode
@synthesize data = data_;
@synthesize next = next_;
@end

@implementation LinkedList

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

- (void) addObject: (NSObject*) object
{
    LinkedListNode* newNode = [[LinkedListNode alloc] init];
    newNode.data = object;

    if (tail_)
        tail_.next = newNode;
    tail_ = newNode;

    if (!head_)
        head_ = newNode;

    count_++;
}

- (NSObject*) removeFirstObject
{
    if (!head_)
        return nil;

    LinkedListNode* node = head_;
    if (tail_ == head_)
        tail_ = nil;
    head_ = head_.next;

    count_--;
    return node.data;
}

- (NSObject*) removeLastObject
{
    if (!head_)
        return nil;

    LinkedListNode* current = head_;
    if (current == tail_)
    {
        head_ = nil;
        tail_ = nil;
        count_--;
        return current.data;
    }

    while (current != nil)
    {
        if (current.next == tail_)
        {
            LinkedListNode* lastNode = current.next;
            current.next = nil;
            tail_ = current;
            count_--;
            return lastNode.data;
        }
        current = current.next;
    }

    return nil;
}

- (NSObject*) removeObject: (NSObject*) object
{
    if (!head_)
        return nil;

    LinkedListNode* previous = nil;
    LinkedListNode* current = head_;
    while (current != nil)
    {
        if (current.data == object)
        {
            if (head_ == current)
                head_ = current.next;

            if (tail_ == current)
                tail_ = previous;

            if (previous)
                previous.next = current.next;

            count_--;
            return current.data;
        }

        previous = current;
        current = current.next;
    }

    return nil;
}

- (void) removeAllObjects
{
    if (!head_)
        return;

    LinkedListNode* current = head_;
    while (current != nil)
    {
        LinkedListNode* next = current.next;
        current.data = nil;
        current.next = nil;
        current = next;
    }

    head_ = nil;
    tail_ = nil;
    count_ = 0;
}

- (BOOL) contains: (NSObject*) object
{
    if (!head_)
        return NO;

    LinkedListNode* current = head_;
    while (current != nil)
    {
        if (current.data == object)
            return YES;

        current = current.next;
    }

    return NO;
}

- (NSObject*) getFirstObject
{
    if (head_)
        return head_.data;

    return nil;
}

- (NSObject*) getLastObject
{
    if (tail_)
        return tail_.data;

    return nil;
}

- (NSObject*) getObjectAtIndex: (NSUInteger) index
{
    if (!head_)
        return nil;

    LinkedListNode* current = head_;
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

    LinkedListNode* current = head_;
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