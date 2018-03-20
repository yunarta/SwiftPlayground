//: Playground - noun: a place where people can play
//
// Demonstrate that component assignment executed after awakeFromNIB

import UIKit
import UIPlayground

protocol Protocol {
    
}

protocol ClassProtocol: class {
    
}

@objc protocol ObjcProtocol {
    
}

@objc protocol ObjcClassProtocol: class {
    
}

class DirectTest {
    
    @IBOutlet weak var `protocol`: Protocol?
    
    @IBOutlet weak var classProtocol: ClassProtocol?
    
    @IBOutlet weak var objcProtocol: ObjcProtocol?
    
    @IBOutlet weak var objcClassProtocol: ObjcClassProtocol?
}

class GenericTest<P, CP, ObjcP, ObjCP> where P: Protocol, CP: ClassProtocol, ObjCP: ObjcProtocol, ObjCP: ObjcClassProtocol {
    
    @IBOutlet weak var `protocol`: P?
    
    // @IBOutlet weak var `protocol`: P?
    @IBOutlet weak var classProtocol: CP?
    
    @IBOutlet weak var objcProtocol: ObjCP?
    
    // @IBOutlet weak var objcProtocol: ObjcP?
    @IBOutlet weak var objcClassProtocol: ObjCP?
}

