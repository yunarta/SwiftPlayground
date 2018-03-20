//: Playground - noun: a place where people can play
//

struct SuperHero {
    let name: String
}

protocol SuperHeroAssembler {
    func resolve() -> SuperHero
}

extension SuperHeroAssembler {
    func resolve() -> SuperHero {
        return SuperHero(name: "Iron Man")
    }
}

class AppAssembler: SuperHeroAssembler { }

let assembler: SuperHeroAssembler = AppAssembler()
let superHero: SuperHero = assembler.resolve()
print(superHero.name)

//

class TestAssembler: SuperHeroAssembler { }

extension SuperHeroAssembler where Self: TestAssembler {
    func resolve() -> SuperHero {
        return SuperHero(name: "Test SuperHero!")
    }
}

let testAssembler: SuperHeroAssembler = TestAssembler()
let testSuperHero: SuperHero = testAssembler.resolve()
print(testSuperHero.name)

