//
// Created by Raj on 4/3/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "TreeCollection.h"

@implementation TreeCollectionTests
+ (void) addRemoveTest: (NSObject<TreeCollection, TreeCollectionDebug>*) treeCollection
{
    for (int index = 0; index < 15; index++)
        [treeCollection addObject: @(index)];

    for (int j = 0; j < 5; j++)
    {
        int random = arc4random_uniform(25);
        [treeCollection addObject: @(random)];
    }

    if (![treeCollection contains: @(12)])
    {
        NSLog(@"Error finding element in TreeCollectionTests");
    }

    [treeCollection printAllObjectsPreOrderWithDataType: [NSNumber class]];
    [treeCollection printAllObjectsInOrderWithDataType: [NSNumber class]];
    [treeCollection printAllObjectsPostOrderWithDataType: [NSNumber class]];
}

@end