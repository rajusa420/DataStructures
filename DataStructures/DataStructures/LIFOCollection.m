//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//
#import "LIFOCollection.h"
#import "PerformanceTimer.h"

@implementation LIFOCollectionTests
+ (void) LIFOCollectionPushPopTest: (NSObject<LIFOCollection, LIFOCollectionDebug>*) lifoCollection
{
    [lifoCollection logStackCollectionObject];
    PerformanceTimer* performanceTimer = [PerformanceTimer startTimerWithName: @"Push 10,000 items"];
    for (int index = 0; index < 10000; index++)
    {
        [lifoCollection push: @(index)];
    }
    [performanceTimer stop];

    PerformanceTimer* performanceTimer2 = [PerformanceTimer startTimerWithName: @"Pop 10,000 items"];
    for (int index = 0; index < 10000; index++)
    {
        [lifoCollection pop];
    }
    [performanceTimer2 stop];

    if (lifoCollection.count != 0)
        NSLog(@"Error popping all items in LIFOCollectionPushPopTest");
    [lifoCollection removeAllObjects];
}

@end