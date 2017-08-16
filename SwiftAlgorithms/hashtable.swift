//
//  hashtable.swift
//  Swift_algorithms
//
//  Created by Vivian Liu on 8/14/17.
//  Copyright © 2017 Vivian Liu. All rights reserved.
//

import Foundation

class seperateChainingST {
    var m = 31 // count of chains
    var nodes = [Node<Int>?](repeating: nil, count: 31) // array of chains
    
    func hash(_ key: Int) -> Int {
        return key.hashValue % m
    }
    
    func contains(key: Int) -> Bool {
        let chain = hash(key)
        var node = nodes[chain]
        while node != nil {
            if node!.key == key {
                return true
            }
            node = node!.next
        }
        return false
    }
    
    func get(key: Int) -> Int? {
        let chain = hash(key)
        var node = nodes[chain]
        while node != nil {
            if node!.key == key {
                return node!.value
            }
            node = node!.next
        }
        return nil
    }
    
    
    func insert(key: Int, value: Int) {
        if contains(key: key) {
            return
        }
        let chainToInsert = hash(key)
        let newNode = Node(key, value)
        let oldHead = nodes[chainToInsert]
        nodes[chainToInsert] = newNode
        newNode.next = oldHead
        //print(nodes[chainToInsert]?.key ?? "not Inserted")
        //print(seperateChainingST().nodes)  // why the seperateChainingST is all nil?
    }
    
    func delete(key: Int) {
        if !contains(key: key) {
            return
        }
        let chainToDelete = hash(key)
        var node = nodes[chainToDelete]
        while node != nil {
            if node!.key == key {
                if let preNode = node?.previous, let nextNode = node?.next {
                    preNode.next = nextNode
                } else if node?.previous == nil {
                    nodes[chainToDelete] = node?.next
                } else if node?.next == nil {
                    node!.previous!.next = nil
                }
                node!.previous = nil // Assign nil to the removed nodes previous and next pointers.
                node!.next = nil
                return
            }
            node = node?.next
        }
    }
    
}

// In Node, it has properties next and previous that need to reference to itsself. Value types such as enum and struct can not be used. That's why Node is declared as a class.

class Node<T> {
    var key: T
    var value: T
    var next: Node?
    var previous: Node?
    init(_ key: T, _ value: T) {
        self.key = key
        self.value = value
    }
}

