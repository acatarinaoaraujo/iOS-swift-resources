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