//: Playground - noun: a place where people can play
// Demonstrate locator by generic is not feasible
//
// The idea is that the Generic class will be the base where the implementation is called as delegate
// Similar to Java-style abstract class

protocol Base: class {
    
}

protocol Definition: Base {
    
    func method()
}
    
class Implementation1: Definition {
    
    // implementation of method
    func method() {
        
    }
}

class Implementation2: Definition {
    
    // implementation of method
    func method() {
        
    }
}

class Generic<D> where D: Definition {
    
    var delegate: D?
    
    func method() {
        delegate?.method()
    }
}

func locate<P>(_ proto: P.Type) -> P? {
    return nil
}

locate(Generic<Definition>.self)

