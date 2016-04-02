//
// Created by Raj on 4/1/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "DataCollection.h"

@implementation DataCollectionTest

+ (void)basicDataCollectionTest: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection
{
    for (int index = 0; index < 20; index++)
    {
        [dataCollection addObject: @(index)];
    }

    [dataCollection removeObject: @(5)];
    [dataCollection removeObject: @(6)];
    [dataCollection removeFirstObject];
    [dataCollection addObject: @(100)];
    [dataCollection removeLastObject];
    [dataCollection removeLastObject];
    [dataCollection addObject: @(101)];

    [dataCollection printAllObjectsWithDataType: [NSNumber class]];

    if (![dataCollection contains: @(101)])
    {
        NSLog(@"Error: Didn't find expected data");
    }

    [dataCollection removeAllObjects];
    [dataCollection printAllObjectsWithDataType: [NSNumber class]];
}
@end