/*:
 ## Class and struct
 
 Demonstrate differences between class and struct in Swift in a very basic point of view
*/

class Class {
    
    var value: Int
    
    init(_ value: Int = 0) {
        self.value = value
    }
}

struct OtherStruct {
    
    var value: Int = 0
}

struct StructWithClass {
    
    // struct may contain class as var, in case you were wondering
    var c: Class
    
    var o: OtherStruct
}

//: > Assigning classA to classB will assign the instance by reference, which means classA and classB points to same instance. Therefore change classB value will also change classA value

var classA = Class(10)
var classB = classA
classB.value = 20

assert(classA.value == classB.value)

//: > Assigning structA to structB will assign the instance by value, which means structA and structB is two difference instance with structA properties being copied onto structB. Therefore change structB value will **NOT** change structA value

var structA = OtherStruct(value: 10)

var structB = structA
structB.value = 20

assert(structA.value != structB.value)

//: > Same with operation above, structWithClassA and structWithClassB are two difference instance, however the value of property `var o: Class` is copied by reference, hence structWithClassA.o and structWithClassB.o value is pointing to same instance

var structWithClassA = StructWithClass(c: Class(10), o: OtherStruct(value: 10))
var structWithClassB = structWithClassA

structWithClassB.c.value = 20
structWithClassB.o.value = 20

assert(structWithClassA.c.value == structWithClassB.c.value)
assert(structWithClassA.o.value != structWithClassB.o.value)
