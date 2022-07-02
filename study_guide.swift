/* 1. Naming Conventions

    - camelCase: application programs
    - kebab-case: web development
    - snake_case: file naming */

/* 2. Print Statament */
    print("Hello \(2+3) World")

/* 3. Random */

    Int.random(in: 1 ... 3)
    Float.random(in: 1 ... < 3)         // [not including upper bound]

    let array = [1, 2, 3]
    array.randomElement()
    array.shuffle()                     // [items change position in the array]

// 4. Functions and Scope

    func greeting1() {
        print("Hello")

        func greeting2() {
            print("Hey")
        }
        greeting2()                     // [calling outside of greeting1 does not work]
    }

// 5. Type Inteference

    var cookies = 4                     // [able to infer the datatype]

// 6. Dictionaries

    var dict : [String: Int] = ["Angela" : 4, "John" : 7]

// 7. Unwrapping Optionals

    var player1: String? = nil
    player1 = "John Smith"
    print(player1!)                     // [became a normal string]

    player1 = nil
    print(player1!)                     // [error: can't unwrap nil value]

// 8. Struct = Blueprint

    struct Town {
        /* properties */
        let name = "Disneyland"
        var citizens = ["Catariana", "Louis"]

        /* method */
        func fortify() {
            print("Defenses increased!")
        }
    }

    var myTown = Town()
    myTown.citizens
    myTown.citizens.append("Richard")

    // Why we have initializers? Be able to customize each town.

    struct Town {
        let name: String                // [immutable]
        var citizens: [String]          // [mutable]

        init(name: String, citizens: [String]) {
            self.name = name
            self.citizens = citizens
        }

        func fortify() {
            print("Defenses increased!")
        }
    }

    var town = Town(townName: "Munich", people: ["Tom Hanks"])
    town.citizens

// 9. Immutability
    /* In order to modify any properties within the struct, 'mutating' must be added. */

    struct Town {
        // [...]
        mutating func harvestRice() {
            citizens.append("Jason")
        }
    }

// 10. Structs vs Classes

    /* Structs cannot inherit, while subclasses can inherit from superclasses.
       Structs are immutable, classes are mutable (does not need to specify 'mutation' in a function).
       Structs are passed by value, creates a new object. Classes are passed by reference. Thus, you
       Structs live on a Stack, Classes in a Heap.
       Classes create another reference to the same object. Ex:
       
       let a = Enemy(health: 100, attackStrength: 10)
       let b = a                                               [points to the same object]
       a.takeDamage(amount: 10)                                [changes for b as well]

       correct way:
       let a = Enemy(health: 100, attackStrength: 10)
       let b = Enemy(health: 100, attackStrength: 10)   

       When to use?
       Structs: Simpler, faster, deep copies, true immutability, no memory leaks, threadsafe.
       Classes: Has inheritance, works with objetive-C code.                            
     */

  // 11. Optional Binding, Chaining, and Nil Coalescing Operator

    var optional : String? = nul
    val defaultValue = 0

    // Force Unwrapping 
    optional!

    // Check for nil value 
    if optional != nil {
            optional!
    }

    // Optional Binding:
    if let safeOptional = optional {
            safeOptional
    }

    // Nil Coalescing Operator
    optional ?? defaultValue

    // Optional Chaining:
    optional?.property
    optional?.method()
    
        
// 12. Protocols

    // Defining the Protocol
    protocol MyProtocol {
        // define requirements, must be implemented by the adopter
    }

    // Adopting the Protocol
    struct MyStruct: MyProtocol {}
    class MyClass: MyProtocol {}

    // Adopting superclasses and protocols
    class MyClass: Superclass, FirstProtocol, SecondProtocol {/*[...]*/}

// 13. Closures

    func sum (firstNumber : Int, secondNumber : Int) -> Int {
        return firstNumber + secondNumber
    }

    // Anonymous functions without a name. Example: 
    { (firstNumber : Int, secondNumber : Int) -> Int in
        return firstNumber + secondNumber
    }

    // Example 2: 
    import UIKit

    func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
        return operation(n1, n2)
    }

    func multiply (no1: Int, no2: Int) -> Int {
        retunr no1 * no2
    }

    calculator(n1: 2, n2: 3, operation: multiply)

    // Convert to closure
    calculator(n1: 2, n2: 3, operation: {(no1: Int, no2: Int) -> Int in
        return no1 * no2
    })

    // Cut further due to type inferance 
    calculator(n1: 2, n2: 3, operation: {(no1, no2) in no1 * no2})

    // Cut even further due to anonymous parameter names
    calculator(n1: 2, n2: 3, operation: {$0 * $1})

    // Cut with trailing closure
    calculator(n1: 2, n2: 3) {$0 * $1}

// 14. Internal and External Parameter Names

    func myFunc(external internal: Type) {
        // use internal
    }
    myFunc(external: value)  

    // To omit the external value   
    func myFunc(_ internal: Type) {}

    myFunc(value)    

// 15. Extensions and Default Implementations for Protocols

    extension Double {

        func round(to places: Int) -> Double {
            let precision = pow(10, Double(places))
            var n = self
            n = n * precision
            n.round()
            n = n / precision
            return n
        }
    }   

    var myDoule = 3.14159
    myDouble.round(to: 1)    

// 16. Casting

    // as! 
    let messageCell = cell as! messageCell               // forced downcast

    // as
    let newCell = messageCell as UITableViewCell        // upcast

    // as? - only do the casting if it is possible
    if let messageCell = cell as? messageCell {}

    /* Any: All objects
       AnyObject: Objects derived from classes
       NSObject: Foundation objects, NSString NSNum ...
     */

// 17. Singleton

    /* It does not matter how many constants or variables points towards the singleton.
       It always is going to be the same copy. Example: */

    class Car {
        var colour = "Red"
    }

    let myCar = Car()
    myCar.colour = "Blue"

    let yourCar = Car()
    yourCar.colour                              // prints Red

    class Car2 {
        var colour = "Red"

        static let singletonCar = Car()
    }

    let myCar2 = Car.singletonCar
    myCar2.colour = "Blue"
    
    let youCar2 = Car.singletonCar
    yourCar2.color                              // prints Blue

// 18. Getter and Setters, and Computed Properties

    import Foundation

    let pizzaInInches: Int = 16
    var numberOfPeople: Int = 12
    let slicesPerPerson: Int = 4

    var numberOfSlices: Int {
        get {
            return pizzaInInches - 4
        }
    }

    var numberOfPizza: Int {
        get {
            let peopleFedPerPizza = numberOfSlices / slicesPerPerson
            return numberOfPeople / peopleFedPerPizza
        }
        set {
            let totalSlices = numberOfSlices * newValue
            numberOfPeople = totalSlices / slicesPerPerson
        }
    }

    numberOfPizza = 6
    print(numberOfPeople)

    // Example 2

    var width: Float = 3.4
    var height: Float = 2.1

    var bucketOfPaint: Int {
        get {
            let area = width * height
            let areaCoveredPerBucket: Float = 1.5
            let numberOfBuckets = area / areaCoveredPerBucket
            let roundedBuckets = ceil(numberOfBuckets)
            return Int(roundedBuckets)
        }
        set {
            let areaCanCover = Double(newValue) * 1.5
            print("This amount of paint can cover an area of \(areaCanCover)")
        }
    }

    bucketOfPaint = 8

// 19. Observed Properties

    var pizzaInInches: Int = 10 {
        willSet {
        }
        didSet {
            if pizzaInInches >= 18 {
                print("Invalid szie, set to 18")
                pizzaInInches = 18
            }
        }
    }

    pizzaInInches = 33
    print(pizzaInInches)

// 20. Truples

    let touple1 = ("Angela", 12)
    let touple2 = (name: "Catarina", age: 12)
    let touple3: (name: String, age: Int)
    touple3 = (name: "Catarina", age: 21)














