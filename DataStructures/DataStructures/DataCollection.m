//
// Created by Raj on 4/1/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "DataCollection.h"
#import "PerformanceTimer.h"

@implementation DataCollectionTest

+ (void) dataCollectionAddTest: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection
{
    PerformanceTimer* performanceTimer = [PerformanceTimer startTimerWithName: @"Add 1,000,000 items"];
    for (int index = 0; index < 1000000; index++)
    {
        [dataCollection addObject: @(index)];
    }
    [performanceTimer stop];
    [dataCollection removeAllObjects];
}

+ (void) dataCollectionRemoveAllTest: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection
{
    for (int index = 0; index < 1000000; index++)
    {
        [dataCollection addObject: @(index)];
    }

    PerformanceTimer *performanceTimer = [PerformanceTimer startTimerWithName: @"Remove all 1,000,000 items"];
    [dataCollection removeAllObjects];
    [performanceTimer stop];
}

+ (void) dataCollectionRemoveMiddleItem: (NSObject<DataCollection, DataCollectionDebug>*) dataCollection
{
    for (int index = 0; index < 1000000; index++)
    {
        [dataCollection addObject: @(index)];
    }

    PerformanceTimer *performanceTimer = [PerformanceTimer startTimerWithName: @"Remove middle item"];
    [dataCollection removeObject: @(500000)];
    [performanceTimer stop];
    [dataCollection removeAllObjects];
}


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