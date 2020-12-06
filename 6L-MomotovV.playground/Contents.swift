import UIKit
import Foundation

class Queue<T> {
    private var array: [T] = []
    
    func pop() -> T? {
        guard array.count > 0 else {return nil}
        return array.removeFirst()
    }
    
    func push(_ element: T) {
        array.append(element)
    }
    
    func filter(closure: (T) -> Bool) -> [T] {
        var tempArray: [T] = []
        
        for value in array {
            if closure(value) {
                tempArray.append(value)
            }
        }
        
        return tempArray
    }
}

let queueOfStrings = Queue<String>()
queueOfStrings.push("Az")
queueOfStrings.push("Buki")
queueOfStrings.push("Vedi")
queueOfStrings.pop()
queueOfStrings.filter{$0 > "Buki"}
