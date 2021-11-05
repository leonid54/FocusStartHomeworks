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
            print(self.count)
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
//thread.append(1)
//thread.append(100)
//print(thread.count)
//print(thread.isEmpty)
//print(thread.contains(2))
//print(thread.contains(100))
//print(thread[1])
print(" ================================ ")
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
