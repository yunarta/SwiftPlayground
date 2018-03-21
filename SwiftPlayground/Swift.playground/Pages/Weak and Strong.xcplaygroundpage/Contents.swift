/*:
 ## Weak and Strong
 
 Demonstrate usage of weak var to solve circular reference retention in Swift
 */

//: > Template class and protocol for checking retention

class Named {
    
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    deinit {
        print("Named \(name) is released")
    }
}

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

//: > An instance assigned to a weak reference need a strong reference in order for it to being retained
weak var weakReference = Named("A")
assert(weakReference == nil)

//: > While a strong reference is still referencing Named("B"), the weak reference still holds the reference
var strongReference: Named? = Named("B")
weakReference = strongReference
assert(weakReference != nil)

var retainers: [Retainer]? = [
    RetainedExample(),
    NotRetainedExample()
]

retainers = nil
strongReference = nil


