//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//
#import "FIFOCollection.h"
#import "PerformanceTimer.h"

@implementation FIFOCollectionTests

+ (void) FIFOCollectionPushPopTest: (NSObject<FIFOCollection, FIFOCollectionDebug>*) fifoCollection
{
    [fifoCollection logQueueCollectionObject];
    PerformanceTimer* performanceTimer = [PerformanceTimer startTimerWithName: @"Push 10,000 items"];
    for (int index = 0; index < 10000; index++)
    {
        [fifoCollection push: @(index)];
    }
    [performanceTimer stop];

    PerformanceTimer* performanceTimer2 = [PerformanceTimer startTimerWithName: @"Pop 10,000 items"];
    for (int index = 0; index < 10000; index++)
    {
        [fifoCollection pop];
    }
    [performanceTimer2 stop];

    if (fifoCollection.count != 0)
        NSLog(@"Error popping all items in FIFOCollectionPushPopTest");
    [fifoCollection removeAllObjects];
}

@end