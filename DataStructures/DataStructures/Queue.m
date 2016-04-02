//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "Queue.h"
#import "DataCollection.h"
#import "LinkedList.h"

@implementation Queue

- (instancetype) init
{
    LinkedList* collectionObject = [[LinkedList alloc] init];
    return [self initWithCollection: collectionObject];
}

- (instancetype) initWithCollection: (NSObject<DataCollection>*) collectionObject
{
    if (self = [super init])
    {
        queue_ = collectionObject;
    }

    return self;
}

- (void) push: (id) object
{
    [queue_ addObject: object];
}

- (id) pop
{
    return [queue_ removeFirstObject];
}

- (id) peek
{
    return [queue_ getFirstObject];
}

- (void) removeAllObjects
{
    [queue_ removeAllObjects];
}

- (NSUInteger) count
{
    return queue_.count;
}

- (void) logQueueCollectionObject
{
    NSLog(@"Queue using %@", NSStringFromClass ([queue_ class]));
}

@end