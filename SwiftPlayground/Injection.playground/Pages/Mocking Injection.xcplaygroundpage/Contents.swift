//: Playground - noun: a place where people can play
//

import Foundation

@objc protocol PowerPlant {
    
}

class I4PowerPlant: PowerPlant {
    
}

class Car: NSObject {
    
    @objc dynamic var powerPlant: PowerPlant?
    
    override init() {
        super.init()
        Assembler.assemble(self)
    }
}

class Assembler {
    
    class func assemble<Assembly>(_ assembly: Assembly) where Assembly: NSObject {
        var count = UInt32()
        guard let properties = class_copyPropertyList(Assembly.self, &count) else {
            assertionFailure()
            return
        }
        
        for i in 0..<Int(count) {
            if let property: objc_property_t = properties[i] {
                NSString(utf8String: property_getName(property))
            }
        }
    }
}


var assembler = Car()

//var count = UInt32()
//guard let properties = class_copyPropertyList(Car.self, &count) else {
//    assertionFailure()
//    exit(-1)
//}
//
//for i in 0..<Int(count) {
//    if let property: objc_property_t = properties[i] {
//        NSString(utf8String: property_getName(property))
//    }
//}



// assembler.value(forKey: "ab")
// assembler.setValue("x", forKey: "ab")

//
//
//protocol Injectable {
//
//}
//
//protocol Provider {
//
//    func injectable() -> Injectable
//}
//
//@objc class Dependency: NSObject {
//
//    class func createProvider() -> Provider? {
//        return nil
//    }
//}
//
//class Instantiable {
//
//}
//
//extension Injectable {
//
//    func instance() -> Instantiable {
//        return Instantiable()
//    }
//}
//
//class DependencyInjection: Injectable {
//
//}
//
//class DependencyProvider: Provider {
//
//    func injectable() -> Injectable {
//        return DependencyInjection()
//    }
//}
//
//class DependencyImpl: Dependency {
//
//    override class func createProvider() -> Provider? {
//        return DependencyProvider()
//    }
//}
//
//let name = NSStringFromClass(DependencyImpl.self)
//let type: Dependency.Type? = NSClassFromString(name) as? Dependency.Type
//let provider = type?.createProvider()
//provider?.injectable().instance()

