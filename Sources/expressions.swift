import LogicKit

// Numbers:

let d0 = Value (0)
let d1 = Value (1)
let d2 = Value (2)
let d3 = Value (3)
let d4 = Value (4)
let d5 = Value (5)
let d6 = Value (6)
let d7 = Value (7)
let d8 = Value (8)
let d9 = Value (9)

func toNumber (_ n : Int) -> Term {
    var result = List.empty
    for char in String (n).characters.reversed () {
        switch char {
        case "0":
            result = List.cons (d0, result)
        case "1":
            result = List.cons (d1, result)
        case "2":
            result = List.cons (d2, result)
        case "3":
            result = List.cons (d3, result)
        case "4":
            result = List.cons (d4, result)
        case "5":
            result = List.cons (d5, result)
        case "6":
            result = List.cons (d6, result)
        case "7":
            result = List.cons (d7, result)
        case "8":
            result = List.cons (d8, result)
        case "9":
            result = List.cons (d9, result)
        default:
            assert (false)
        }
    }
    return result
}

// Arithmetic:

func add (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func subtract (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func multiply (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func divide (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

// Booleans:

let t = Value (true)
let f = Value (false)

func not (_ of: Term) -> Map {
    assert (false)
}

func and (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func or (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func implies (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

// Comparisons:

func lessthan (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func lessequal (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func greaterthan (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func greaterequal (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func equal (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

func notequal (_ lhs: Term, _ rhs: Term) -> Map {
    assert (false)
}

// Evaluation:

func evalArithmetic (input: Term, output: Term) -> Goal {
    assert (false)
}

func evalBoolean (input: Term, output: Term) -> Goal {
    assert (false)
}

func evalComparison (input: Term, output: Term) -> Goal {
    assert (false)
}

// Main evaluation:

func eval (input: Term, output: Term) -> Goal {
    assert (false)
}
