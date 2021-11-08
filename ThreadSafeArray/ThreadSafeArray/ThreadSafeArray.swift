import Foundation

class ThreadSafeArray<T> {
    private var internalArray: [T] = []
    
    private let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    
    var isEmpty: Bool {
        self.queue.sync {
            if self.internalArray.isEmpty {
            return true
        }
        return false
        }
    }
    
    var count: Int {
        return internalArray.count
    }
    
    func append(_ item: T) {
        self.queue.async(flags: .barrier) {
            self.internalArray.append(item)
        }
    }
    
    func remove(at index: Int) {
        guard self.internalArray.indices.contains(index) else { return }
            self.queue.async(flags: .barrier) {
                self.internalArray.remove(at: index)
            }
        }
    
    subscript (index: Int) -> T {
        get {
            return self.internalArray[index]
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
