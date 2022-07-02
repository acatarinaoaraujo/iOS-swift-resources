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

