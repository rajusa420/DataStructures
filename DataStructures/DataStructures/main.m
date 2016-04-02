//
//  main.m
//  DataStructures
//
//  Created by Raj on 4/1/16.
//  Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"
#import "Stack.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        LinkedList* linkedList = [[LinkedList alloc] init];
        // [DataCollectionTest dataCollectionAddRemoveTests: linkedList];
        // [DataCollectionTest dataCollectionReturnObjectTest: linkedList];
        // [DataCollectionTest basicDataCollectionTest: linkedList];
        Stack* stack = [[Stack alloc] initWithCollection: linkedList];
        [LIFOCollectionTests LIFOCollectionPushPopTest: stack];
    }

    return 0;
}