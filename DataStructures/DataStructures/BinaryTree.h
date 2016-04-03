//
// Created by Raj on 4/3/16.
// Copyright (c) 2016 Rajusa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeCollection.h"

@interface BinaryTreeNode : NSObject
{
@protected
    id data_;
    BinaryTreeNode* left_;
    BinaryTreeNode* right_;
}

@property (atomic, retain) id data;
@property (atomic, retain) BinaryTreeNode* left;
@property (atomic, retain) BinaryTreeNode* right;
@end

@interface BinaryTree : NSObject<TreeCollection, TreeCollectionDebug>
{
@protected
    BinaryTreeNode* root_;
    NSUInteger count_;
}

- (void)addObject: (id) data;
- (void)removeObject: (id) data;
- (BOOL)contains: (id) data;

@end