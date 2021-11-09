import Foundation

var thread = ThreadSafeArray<Int>()

let queue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
let group = DispatchGroup()

group.enter()
queue.async {
    for number in 0...1000 {
        thread.append(number)
    }
    group.leave()
}
group.enter()
queue.async {
    for number in 0...1000 {
        thread.append(number)
    }
    group.leave()
}

group.wait()

sleep(arc4random() % 4)
print(thread.count)
