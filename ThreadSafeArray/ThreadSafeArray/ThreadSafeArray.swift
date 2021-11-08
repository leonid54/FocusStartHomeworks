import Foundation

class ThreadSafeArray<T> {
    private var internalArray: [T] = []
    
    private let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    
    var count: Int {
        self.queue.sync(flags: .barrier) {
            return internalArray.count
        }
    }
    
    var isEmpty: Bool {
        return self.queue.sync {
            self.internalArray.isEmpty
        }
    }
    
    func append(_ item: T) {
        self.queue.async(flags: .barrier) {
            self.internalArray.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.queue.async(flags: .barrier) {
            guard self.internalArray.indices.contains(index) else { return }
            self.internalArray.remove(at: index)
        }
    }
    
    subscript (index: Int) -> T {
        get {
            return self.queue.sync {
                self.internalArray[index]
            }
        }
    }
}

extension ThreadSafeArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        return self.queue.sync {
            self.internalArray.contains(element)
        }
    }
}
