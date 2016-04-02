//
// Created by Raj on 4/2/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PerformanceTimer : NSObject
{
@private
    NSTimeInterval startTime_;
    NSString* timerName_;
}
- (void)start: (NSString *) timerName;
- (void)stop;
+ (PerformanceTimer*) startTimerWithName: (NSString*) timerName;
@end