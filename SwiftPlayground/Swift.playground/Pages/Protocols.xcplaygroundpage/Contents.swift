/*:
 ## Protocols
 
 Demonstrate different type of basic protocols in Swift
 */

protocol ProtocolForAll {
    
}

protocol ProtocolForStruct {
    
}

//: > Protocol that conforming to class can only be used by classes

protocol ProtocolForClass: class {
    
}

//: > This three declarations below can be compiled

struct Struct: ProtocolForStruct, ProtocolForAll {
    
}

class Class: ProtocolForClass, ProtocolForAll {
    
}

enum Enum: ProtocolForStruct, ProtocolForAll {
    
}

//: > While these two declarations below cannot be compiled

struct StructUsingClassProtocol: ProtocolForClass, ProtocolForAll {
    
}

enum EnumUsingClassProtocol: ProtocolForClass, ProtocolForAll {
    
}

//: > These protocols below cannot be used as a weak var as they are not class-bound protocol

weak var a: ProtocolForStruct?
weak var b: Struct?
weak var c: Enum?
weak var d: EnumUsingClassProtocol?

//: > While these class-bound protocol can be used as a weak var

weak var e: ProtocolForClass?
