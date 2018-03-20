//: Playground - noun: a place where people can play
//
// Demonstrate self retaining


protocol ProtocolForAll {
    
}

protocol ProtocolForStruct {
    
}

struct Struct: ProtocolForStruct, ProtocolForAll {
    
}

protocol ProtocolForClass: class {
    
}

class Class: ProtocolForClass, ProtocolForAll {
    
}

struct StructUsingClassProtocol: ProtocolForClass, ProtocolForAll {
    
}

enum Enum: ProtocolForStruct, ProtocolForAll {
    
}

enum EnumUsingClassProtocol: ProtocolForClass, ProtocolForAll {
    
}

weak var a: ProtocolForStruct?
weak var b: Struct?
weak var c: ProtocolForClass?
weak var d: Enum?
weak var e: EnumUsingClassProtocol?

