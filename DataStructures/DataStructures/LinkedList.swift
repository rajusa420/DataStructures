//
// Created by Raj on 2019-01-13.
// Copyright (c) 2019 Rajusa. All rights reserved.
//

import Foundation

class SwLinkedListNode
{
    var data: NSObject;
    fileprivate var next: SwLinkedListNode?;

    init(data: NSObject) {
        self.data = data;
    }

    init(data: NSObject, next: SwLinkedListNode) {
        self.data = data;
        self.next = next;
    }
}

public class SwLinkedList : NSObject, DataCollection, DataCollectionDebug
{
    var head: SwLinkedListNode?;
    var tail: SwLinkedListNode?;
    var nodeCount: UInt = 0;

    public class func newInstance() -> SwLinkedList {
        return SwLinkedList()
    }

    public func count() -> UInt {
        return self.nodeCount;
    }

    public func add(_ object: NSObject!) {
        let newNode = SwLinkedListNode(data: object);

        if let tail = self.tail {
            tail.next = newNode;
        }

        self.tail = newNode;

        if self.head == nil {
            self.head = newNode;
        }

        self.nodeCount += 1;
    }

    public func removeFirstObject() -> NSObject? {
        guard let head = self.head else {
            return nil;
        }

        if let tail = self.tail {
            if tail === head {
                self.tail = nil;
            }
        }

        self.head = head.next;
        self.nodeCount -= 1;
        return head.data;
    }

    public func removeLastObject() -> NSObject? {
        return nil;
    }

    public func remove(_ object: NSObject!) -> NSObject! {
        return object;
    }

    public func removeAllObjects()
    {

    }

    public func contains(_ object: NSObject) -> Bool {
        return false;
    }

    public func getFirstObject() -> NSObject? {
        return nil;
    }

    public func getLastObject() -> NSObject? {
        return nil;
    }

    public func getObjectAt(_ index: UInt) -> NSObject? {
        return nil;
    }

    public func printAllObjects(withDataType dataType: AnyClass) {
        guard let head = self.head else { return; }
        var current: SwLinkedListNode? = head;
        while current != nil {
            if current?.data.self is NSNumber {
                let data: NSNumber = current?.data as! NSNumber;
                NSLog("%@", data.stringValue);
            }

            current = current?.next;
        }
    }
}
