//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "PerformanceTimer.h"


@implementation PerformanceTimer

- (void) start: (NSString*) timerName
{
    timerName_ = timerName;
    startTime_ = [[NSDate date] timeIntervalSinceReferenceDate];
}

- (void) stop
{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - startTime_;
    NSLog(@"%@: %.2f ms", timerName_, timeInterval * 1000);
}

+ (PerformanceTimer*) startTimerWithName: (NSString*) timerName
{
    PerformanceTimer* performanceTimer = [[PerformanceTimer alloc] init];
    [performanceTimer start: timerName];
    return performanceTimer;
}
@end