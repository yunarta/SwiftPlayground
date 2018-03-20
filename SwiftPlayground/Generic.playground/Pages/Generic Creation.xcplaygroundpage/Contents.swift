//: Playground - noun: a place where people can play
//
// Demonstrate that with required protocol, instance can be created from generic
// Better than Java

import UIKit

class Animal {

    required init() {
    }
    
    func makeSound() {
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Bark")
    }
}


class MyPet<Pet> where Pet: Animal {
    
    let pet: Pet
    
    init() {
        // since Animal has required init, instance can be created from <Pet>
        self.pet = Pet()
    }
}

var my = MyPet<Dog>()
my.pet.makeSound()
