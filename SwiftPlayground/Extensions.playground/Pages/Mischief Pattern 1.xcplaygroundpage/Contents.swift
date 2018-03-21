/*:
 ## Mischief extension patterns
 
 Demonstrate some extension pattern seems to work but they can be mischief
 */

protocol Protocol {
    
    func output() -> String
}

extension Protocol {
    
    func output() -> String {
        return "protocol"
    }
}

class Class<B>: Protocol {
    
    func output() -> String {
        return "base"
    }
}

//: > Attempt to create a function extension so when `B` conforms to `One` in `Class<B>`, the behavior change

class One { }
extension Class where B: One {

    func output() -> String {
        return "one"
    }
}

//: > Execution of the function below seems to works as expected
var a = Class<One>()
a.output()

//: > However when a is assigned to a `Protocol` type var, the `output()` function will refer to `Class<B>` rather than extension
var b: Protocol = a
b.output()
