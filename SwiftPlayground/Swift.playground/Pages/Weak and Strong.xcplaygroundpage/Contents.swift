//: Playground - noun: a place where people can play
//
// Demonstrate weak and strong effect on circular reference

import UIKit

protocol Delegate: class {
    
}

class Retainer {
    
    var `strong`: Delegate?
    
    weak var `weak`: Delegate?
    
    deinit {
        print("\(self) is released")
    }
}

class RetainedExample: Retainer, Delegate {
    
    override init() {
        super.init()
        self.strong = self
    }
}

class NotRetainedExample: Retainer, Delegate {
    
    override init() {
        super.init()
        self.weak = self
    }
}

var retainers: [Retainer]? = [
    RetainedExample(),
    NotRetainedExample()
]
retainers = nil

