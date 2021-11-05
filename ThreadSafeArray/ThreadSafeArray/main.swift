import Foundation

protocol Container {
    associatedtype Item
    
    subscript (index: Int) -> Item { get }
}

class ThreadSafe<T: Equatable, Container>{
    typealias Item = T
    var threadSafeArray: [T] = []
    
    let queue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
    
    var isEmpty: Bool {
        if threadSafeArray.isEmpty{
            return true
        }
        return false
    }
    
    var count: Int {
        return threadSafeArray.count
    }
    
    func append(_ item: T) {
        self.queue.async(flags: .barrier) {
            self.threadSafeArray.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.queue.async(flags: .barrier) {
            self.threadSafeArray.remove(at: index)
        }
    }
    
    subscript (index: Int) -> Item {
        get {
            return self.threadSafeArray[index]
        }
    }

    func contains(_ element: T) -> Bool {
        for item in self.threadSafeArray {
            if element == item {
                return true
            }
        }
        return false
    }
}

var thread = ThreadSafe<Int, Int>()

thread.queue.async {
    for number in 0...1000 {
        thread.append(number)
    }
}

thread.queue.async {
    for number in 0...1000 {
        thread.append(number)
    }
}

sleep(arc4random() % 4)
print(thread.count)
