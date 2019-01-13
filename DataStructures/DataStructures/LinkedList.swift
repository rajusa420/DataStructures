//
// Created by Raj on 2019-01-13.
// Copyright (c) 2019 Rajusa. All rights reserved.
//

import Foundation

class SwLinkedListNode
{
    var data: NSObject?;
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
        guard let head = self.head else {
            return nil;
        }

        var current : SwLinkedListNode? = head;
        if let tail = self.tail {
            if tail === head {
                self.head = nil;
                self.tail = nil;
                self.nodeCount = 0;
                return current!.data;
            }
        }

        while current != nil {
            if (current!.next === self.tail) {
                let lastNode : SwLinkedListNode? = current!.next;
                current!.next = nil;
                self.tail = current;
                self.nodeCount -= 1;
                return lastNode!.data;
            }

            current = current!.next;
        }

        return nil;
    }

    public func remove(_ object: NSObject!) -> NSObject! {
        guard let head = self.head else {
            return nil;
        }

        var previous : SwLinkedListNode? = nil;
        var current : SwLinkedListNode? = head;
        while current != nil {
            if (current!.data == object)
            {
                if head === current {
                    self.head = current!.next;
                }

                if self.tail === current {
                    self.tail = previous;
                }

                if previous != nil {
                    previous!.next = current!.next;
                }
                return current!.data;
            }

            previous = current;
            current = current!.next;
        }
        return nil;
    }

    public func removeAllObjects()
    {
        guard let head = self.head else {
            return;
        }

        // Note: We need to go through and release one object at a time
        // else we get a stack overflow
        var current : SwLinkedListNode? = head;
        while current != nil {
            let next: SwLinkedListNode? = current!.next;
            current!.data = nil;
            current!.next = nil;
            current = next;
        }

        self.head = nil;
        self.tail = nil;
        self.nodeCount = 0;
    }

    public func contains(_ object: NSObject) -> Bool {
        guard let head = self.head else {
            return false;
        }

        var current : SwLinkedListNode? = head;
        while current != nil {
            if (current!.data == object) {
                return true;
            }

            current = current!.next;
        }
        return false;
    }

    public func getFirstObject() -> NSObject? {
        guard let head = self.head else {
            return nil;
        }

        return head.data;
    }

    public func getLastObject() -> NSObject? {
        guard let tail = self.tail else {
            return nil;
        }

        return tail.data;
    }

    public func getObjectAt(_ index: UInt) -> NSObject? {
        guard let head = self.head else {
            return nil;
        }

        var current : SwLinkedListNode? = head;
        var position : UInt = 0;
        while current != nil {
            if (position == index) {
                return current!.data;
            }

            position += 1;
            current = current!.next;
        }

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
