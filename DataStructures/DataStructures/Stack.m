//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "Stack.h"
#import "DataCollection.h"
#import "LinkedList.h"


@implementation Stack
{

}

- (instancetype) init
{
    LinkedList* collectionObject = [[LinkedList alloc] init];
    return [self initWithCollection: collectionObject];
}

- (instancetype) initWithCollection: (NSObject<DataCollection>*) collectionObject
{
    if (self = [super init])
    {
        stack_ = collectionObject;
    }

    return self;
}

- (void) push: (NSObject*) object
{
    [stack_ addObject: object];
}
- (NSObject*) pop
{
    return [stack_ removeLastObject];
}
- (NSObject*) peek
{
    return [stack_ getLastObject];
}

- (NSUInteger) count
{
    return [stack_ count];
}

- (void) removeAllObjects
{
    [stack_ removeAllObjects];
}
- (void) logStackCollectionObject
{
    NSLog(@"Stack using %@", NSStringFromClass ([stack_ class]));
}
@end