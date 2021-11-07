import Foundation

class ThreadSafeArray<T: Equatable> {
    typealias Item = T
    private var threadArray: [T] = []
    
    fileprivate let queue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
    
    var isEmpty: Bool {
        if threadArray.isEmpty{
            return true
        }
        return false
    }
    
    var count: Int {
        return threadArray.count
    }
    
    func append(_ item: T) {
        self.queue.async(flags: .barrier) {
            self.threadArray.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.queue.async(flags: .barrier) {
            self.threadArray.remove(at: index)
        }
    }
    
    subscript (index: Int) -> Item {
        get {
            return self.threadArray[index]
        }
    }

    func contains(_ element: T) -> Bool {
        for item in self.threadArray {
            if element == item {
                return true
            }
        }
        return false
    }
}

var thread = ThreadSafeArray<Int>()

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
