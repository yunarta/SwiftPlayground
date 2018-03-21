/*:
 ## Protocol Optional Method
 
 Demonstrate that generic will prevent the optional method without @objc
 */

import Foundation

@objc protocol Base: NSObjectProtocol {
    @objc optional func method()
}

class NoGenericBase: NSObject, Base { }

class NoGenericImpl: NoGenericBase {
    func method() { }
}


class GenericBase<Anything>: NSObject, Base { }
class GenericImpl: GenericBase<String> { }

class GenericImpl2: GenericImpl {
    func method() { }
}

class GenericImpl3: GenericImpl {
    @objc func method() { }
}

//: > As `GenericImpl2` is not annotated with @objc, the method is not responding to `Base.method`

assert(NoGenericImpl().responds(to: #selector(Base.method)))
assert(!GenericImpl2().responds(to: #selector(Base.method)))
assert(GenericImpl3().responds(to: #selector(Base.method)))

//: > An optional method need to be unwrapped before called

var a: Base = NoGenericImpl()
a.method?()

var b: Base = GenericImpl2()
b.method?() // returns nil as method is not visible from Base due to generic

var c: Base = GenericImpl3()
c.method?()
