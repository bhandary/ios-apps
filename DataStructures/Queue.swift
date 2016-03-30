//
//  Queue.swift
//  DataStructures
//
//  Created by manbhand on 2/18/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import Foundation

public class Queue<T> {
    
    private var top: QNode<T>! = QNode<T>()
    
    //enqueue the specified object
    func enqueue(key: T) {
        
        //check for the instance
        if top == nil {
            top = QNode<T>()
        }
        
        //establish the top node
        if top.key == nil {
            top.key = key
            return
        }
        
        let childToUse: QNode<T> = QNode<T>()
        var current: QNode = top
        
        //cycle through the list of items to get to the end.
        while (current.next != nil) {
            current = current.next!
        }
        
        //append a new item
        childToUse.key = key
        current.next = childToUse
    }
    
    //retrieve items from the top level in O(1) contant time
    func deQueue() -> T? {
        
        //determine if the key or instance e
    }
}
