//: Playground - noun: a place where people can play
//
// Demonstrate self retaining

import UIKit

typealias Closure = () -> Void

class Retainer {
    
    var closure: Closure?
    
    var selector: Selector?
    
    deinit {
        print("\(self) is released")
    }
}

class RetainedExample1: Retainer {
    
    override init() {
        super.init()
        self.closure = {
            // capturing self here causing retention
            print("self = \(self)")
        }
    }
}

class RetainedExample2: Retainer {
    
    override init() {
        super.init()
        // passing own method will capture self strongly
        self.closure = self.describe
    }
    
    func describe() {
        print("self = \(self)")
    }
}

class NotRetainedExample1: Retainer {
    
    override init() {
        super.init()
        self.closure = {
            // self is not capture, release is possible
            print("Hello world")
        }
    }
}

class NotRetainedExample2: Retainer {
    
    override init() {
        super.init()
        self.closure = { [unowned self] in
            // capturing unowned self here, release is possible
            print("self = \(self)")
        }
    }
}

class NotRetainedExample3: Retainer {
    
    override init() {
        super.init()
        self.closure = { [weak self] in
            // capturing weak self here, release is possible
            print("self = \(self)")
        }
    }
}

class NotRetainedExample4: Retainer {
    
    override init() {
        super.init()
        // using selector allow release even though self is captured
        // this come with a price of dynamic dispatch execution
        self.selector = #selector(self.describe)
    }
    
    @objc func describe() {
        print("self = \(self)")
    }
}

var retainers: [Retainer]? = [
    RetainedExample1(),
    RetainedExample2(),
    NotRetainedExample1(),
    NotRetainedExample2(),
    NotRetainedExample3(),
    NotRetainedExample4()
]
retainers = nil
