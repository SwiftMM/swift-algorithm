//: [Previous](@previous)

import Foundation

// 栈是后进先出的结构。
// 可以理解成有好几个盘子要垒成一叠，哪个盘子最后叠上去，
// 下次使用的时候它就最先被抽出去。
// 基本操作：push, pop, isEmpty, peek, size。

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var peek: T? {
        return array.last
    }
    
    public var size: Int {
        return array.count
    }
}


//: [Next](@next)
