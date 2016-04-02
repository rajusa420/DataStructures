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
#import "DoublyLinkedList.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        LinkedList* linkedList = [[LinkedList alloc] init];
        DoublyLinkedList* doublyLinkedList = [[DoublyLinkedList alloc] init];
        [DataCollectionTest dataCollectionAddRemoveTests: doublyLinkedList];
        [DataCollectionTest dataCollectionReturnObjectTest: doublyLinkedList];
        // [DataCollectionTest basicDataCollectionTest: doublyLinkedList];

        Stack* stack = [[Stack alloc] initWithCollection: doublyLinkedList];
        [LIFOCollectionTests LIFOCollectionPushPopTest: stack];
    }

    return 0;
}