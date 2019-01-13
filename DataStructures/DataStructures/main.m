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
#import "Queue.h"
#import "BinaryTree.h"
#import <DataStructures-Swift.h>

int main(int argc, const char * argv[])
{
    NSLog(@"Test");
    @autoreleasepool
    {
        LinkedList* linkedList = [[LinkedList alloc] init];
        DoublyLinkedList* doublyLinkedList = [[DoublyLinkedList alloc] init];
        SwLinkedList* swLinkedList = [[SwLinkedList alloc] init];
        [DataCollectionTest dataCollectionAddRemoveTests: linkedList];
        [DataCollectionTest dataCollectionReturnObjectTest: linkedList];
        [DataCollectionTest dataCollectionAddRemoveTests: doublyLinkedList];
        [DataCollectionTest dataCollectionReturnObjectTest: doublyLinkedList];
        [DataCollectionTest dataCollectionAddRemoveTests: swLinkedList];
        [DataCollectionTest dataCollectionReturnObjectTest: swLinkedList];
        //[DataCollectionTest basicDataCollectionTest: swLinkedList];

        //Stack* stack = [[Stack alloc] initWithCollection: doublyLinkedList];
        //[LIFOCollectionTests LIFOCollectionPushPopTest: stack];

        // Queue* queue = [[Queue alloc] initWithCollection: linkedList];
        // [FIFOCollectionTests FIFOCollectionPushPopTest: queue];
        // BinaryTree* binaryTree = [[BinaryTree alloc] init];
        // [TreeCollectionTests addRemoveTest: binaryTree];
    }

    return 0;
}