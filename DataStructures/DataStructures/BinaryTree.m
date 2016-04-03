//
// Created by Raj on 4/3/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import "BinaryTree.h"

@implementation BinaryTreeNode

- (instancetype) initWithData: (id) data
{
    if (self = [super init])
    {
        self.data = data;
        self.left = nil;
        self.right = nil;
    }

    return self;
}
@synthesize data = data_;
@synthesize left = left_;
@synthesize right = right_;
@end

@implementation BinaryTree

- (instancetype) init
{
    if (self = [super init])
    {
        root_ = nil;
        count_ = 0;
    }

    return self;
}

- (void) addObject: (id) data
{
    root_ = [self insertNodeRecursive: root_ data: data];
    count_++;
}

- (BinaryTreeNode*) insertNodeRecursive: (BinaryTreeNode*) binaryTreeNode data: (id) data
{
    if (!binaryTreeNode)
    {
        return [[BinaryTreeNode alloc] initWithData: data];
    }
    else
    {
        if (binaryTreeNode.data < data)
            binaryTreeNode.right = [self insertNodeRecursive: binaryTreeNode.right data: data];
        else
            binaryTreeNode.left = [self insertNodeRecursive: binaryTreeNode.left data: data];
    }

    return binaryTreeNode;
}

- (void) removeObject: (id) data
{
    BinaryTreeNode* current = root_;

}

- (BOOL) contains: (id) data
{
    if (!root_)
        return NO;

    return [self containsRecursive: root_ data: data];
}

- (BOOL) containsRecursive: (BinaryTreeNode*) node data:(id) data
{
    if (node.data == data)
        return YES;

    if (node.data >= data)
    {
        if (node.left)
            return [self containsRecursive: node.left data: data];
    }
    else
    {
        if (node.right)
            return [self containsRecursive: node.right data: data];
    }

    return NO;
}

- (void) printNodeData: (BinaryTreeNode*) node dataType: (Class) dataType
{
    if ([NSNumber class] == dataType)
    {
        NSNumber *object = (NSNumber *) node.data;
        NSLog(@"%@", [object stringValue]);
    }
}

- (void) printAllObjectsPreOrderWithDataType: (Class) dataType
{
    NSLog(@"Printing objects Pre Order");
    [self preOrderPrintRecursive: root_ dataType: dataType];
}

- (void) preOrderPrintRecursive: (BinaryTreeNode*) node dataType: (Class) dataType
{
    if (!node)
        return;

    [self printNodeData: node dataType: dataType];
    [self preOrderPrintRecursive: node.left dataType: dataType];
    [self preOrderPrintRecursive: node.right dataType: dataType];
}

- (void) printAllObjectsInOrderWithDataType: (Class) dataType
{
    NSLog(@"Printing objects In Order");
    [self inOrderPrintRecursive: root_ dataType: dataType];
}

- (void) inOrderPrintRecursive: (BinaryTreeNode*) node dataType: (Class) dataType
{
    if (!node)
        return;

    [self inOrderPrintRecursive: node.left dataType: dataType];
    [self printNodeData: node dataType: dataType];
    [self inOrderPrintRecursive: node.right dataType: dataType];
}

- (void) printAllObjectsPostOrderWithDataType: (Class) dataType
{
    NSLog(@"Printing objects Post Order");
    [self postOrderPrintRecursive: root_ dataType: dataType];
}

- (void) postOrderPrintRecursive: (BinaryTreeNode*) node dataType: (Class) dataType
{
    if (!node)
        return;

    [self postOrderPrintRecursive: node.left dataType: dataType];
    [self postOrderPrintRecursive: node.right dataType: dataType];
    [self printNodeData: node dataType: dataType];
}
@end