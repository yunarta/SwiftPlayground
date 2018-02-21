//: Playground - noun: a place where people can play
// Demonstrate locator by class
//
// The idea is that the we can make a module store and select, as well with versioning support
// Inspired by micro-service version support

class Definition {
    
    func method() {
        
    }
}

class Implementation1: Definition {
    
    // implementation of method
    override func method() {
        
    }
    
    func methodOfImpl1() {
        
    }
}

class Implementation2: Definition {
    
    // implementation of method
    override func method() {
        
    }
    
    func methodOfImpl2() {
        
    }
}

class Implementation3: Definition {
    
    // implementation of method
    override func method() {
        
    }
    
    func methodOfImpl3() {
        
    }
}

// locate for instance by class
func locateByClass<C>(_ type: C.Type) -> C? {
    var map: [String: Definition] = [
        String(describing: Implementation1.self): Implementation1(),
        String(describing: Implementation2.self): Implementation2()
    ]
    
    return map[String(describing: type)] as? C
}

var impl1: Any? = locateByClass(Implementation1.self)
assert(impl1 is Implementation1)

var impl2: Any? = locateByClass(Implementation2.self)
assert(impl2 is Implementation2)

var impl3: Any? = locateByClass(Implementation3.self)
assert(impl3 == nil)

locateByClass(Implementation1.self)?.methodOfImpl1()
locateByClass(Implementation2.self)?.methodOfImpl2()
locateByClass(Implementation3.self)?.methodOfImpl3()

// locate for instance by protocol, with version
func locateWithVersion<C>(_ type: C.Type, version: Int) -> C? {
    var map: [Int: Definition] = [
        1: Implementation1(),
        2: Implementation2()
    ]
    
    return map[version] as? C
}

locateWithVersion(Definition.self, version: 1)
locateWithVersion(Definition.self, version: 2)
