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

/*############*/
// Arithmetic:
/*############*/

/********************************/
/*    PART FOR THE ADDITIION    */
/********************************/

func add (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "lhs" : lhs,
      "op"  : Value ("+"),
      "rhs" : rhs,
  ]
}

// Abstract syntax for the addition :
// l, r in Nat
// ------------
// l + r in Nat

// Semantic for the addition :
// l =N=> l', r =N=> r'
// ---------------------
// l + r =N=> l' +Nat r'

// Function to add two digit and returning the result and the rest
func addDigit (_ lhs: Term, _ rhs: Term, _ result: Term, _ rest: Term) -> Goal {
  return
        (lhs === d0 && result === rhs && rest === d0) ||
        (rhs === d0 && result === lhs && rest === d0) ||

        (lhs === d1 && rhs === d1 && result === d2 && rest === d0) ||
        (lhs === d1 && rhs === d2 && result === d3 && rest === d0) ||
        (lhs === d1 && rhs === d3 && result === d4 && rest === d0) ||
        (lhs === d1 && rhs === d4 && result === d5 && rest === d0) ||
        (lhs === d1 && rhs === d5 && result === d6 && rest === d0) ||
        (lhs === d1 && rhs === d6 && result === d7 && rest === d0) ||
        (lhs === d1 && rhs === d7 && result === d8 && rest === d0) ||
        (lhs === d1 && rhs === d8 && result === d9 && rest === d0) ||
        (lhs === d1 && rhs === d9 && result === d0 && rest === d1) ||

        (lhs === d2 && rhs === d1 && result === d3 && rest === d0) ||
        (lhs === d2 && rhs === d2 && result === d4 && rest === d0) ||
        (lhs === d2 && rhs === d3 && result === d5 && rest === d0) ||
        (lhs === d2 && rhs === d4 && result === d6 && rest === d0) ||
        (lhs === d2 && rhs === d5 && result === d7 && rest === d0) ||
        (lhs === d2 && rhs === d6 && result === d8 && rest === d0) ||
        (lhs === d2 && rhs === d7 && result === d9 && rest === d0) ||
        (lhs === d2 && rhs === d8 && result === d0 && rest === d1) ||
        (lhs === d2 && rhs === d9 && result === d1 && rest === d1) ||

        (lhs === d3 && rhs === d1 && result === d4 && rest === d0) ||
        (lhs === d3 && rhs === d2 && result === d5 && rest === d0) ||
        (lhs === d3 && rhs === d3 && result === d6 && rest === d0) ||
        (lhs === d3 && rhs === d4 && result === d7 && rest === d0) ||
        (lhs === d3 && rhs === d5 && result === d8 && rest === d0) ||
        (lhs === d3 && rhs === d6 && result === d9 && rest === d0) ||
        (lhs === d3 && rhs === d7 && result === d0 && rest === d1) ||
        (lhs === d3 && rhs === d8 && result === d1 && rest === d1) ||
        (lhs === d3 && rhs === d9 && result === d2 && rest === d1) ||

        (lhs === d4 && rhs === d1 && result === d5 && rest === d0) ||
        (lhs === d4 && rhs === d2 && result === d6 && rest === d0) ||
        (lhs === d4 && rhs === d3 && result === d7 && rest === d0) ||
        (lhs === d4 && rhs === d4 && result === d8 && rest === d0) ||
        (lhs === d4 && rhs === d5 && result === d9 && rest === d0) ||
        (lhs === d4 && rhs === d6 && result === d0 && rest === d1) ||
        (lhs === d4 && rhs === d7 && result === d1 && rest === d1) ||
        (lhs === d4 && rhs === d8 && result === d2 && rest === d1) ||
        (lhs === d4 && rhs === d9 && result === d3 && rest === d1) ||

        (lhs === d5 && rhs === d1 && result === d6 && rest === d0) ||
        (lhs === d5 && rhs === d2 && result === d7 && rest === d0) ||
        (lhs === d5 && rhs === d3 && result === d8 && rest === d0) ||
        (lhs === d5 && rhs === d4 && result === d9 && rest === d0) ||
        (lhs === d5 && rhs === d5 && result === d0 && rest === d1) ||
        (lhs === d5 && rhs === d6 && result === d1 && rest === d1) ||
        (lhs === d5 && rhs === d7 && result === d2 && rest === d1) ||
        (lhs === d5 && rhs === d8 && result === d3 && rest === d1) ||
        (lhs === d5 && rhs === d9 && result === d4 && rest === d1) ||

        (lhs === d6 && rhs === d1 && result === d7 && rest === d0) ||
        (lhs === d6 && rhs === d2 && result === d8 && rest === d0) ||
        (lhs === d6 && rhs === d3 && result === d9 && rest === d0) ||
        (lhs === d6 && rhs === d4 && result === d0 && rest === d1) ||
        (lhs === d6 && rhs === d5 && result === d1 && rest === d1) ||
        (lhs === d6 && rhs === d6 && result === d2 && rest === d1) ||
        (lhs === d6 && rhs === d7 && result === d3 && rest === d1) ||
        (lhs === d6 && rhs === d8 && result === d4 && rest === d1) ||
        (lhs === d6 && rhs === d9 && result === d5 && rest === d1) ||

        (lhs === d7 && rhs === d1 && result === d8 && rest === d0) ||
        (lhs === d7 && rhs === d2 && result === d9 && rest === d0) ||
        (lhs === d7 && rhs === d3 && result === d0 && rest === d1) ||
        (lhs === d7 && rhs === d4 && result === d1 && rest === d1) ||
        (lhs === d7 && rhs === d5 && result === d2 && rest === d1) ||
        (lhs === d7 && rhs === d6 && result === d3 && rest === d1) ||
        (lhs === d7 && rhs === d7 && result === d4 && rest === d1) ||
        (lhs === d7 && rhs === d8 && result === d5 && rest === d1) ||
        (lhs === d7 && rhs === d9 && result === d6 && rest === d1) ||

        (lhs === d8 && rhs === d1 && result === d9 && rest === d0) ||
        (lhs === d8 && rhs === d2 && result === d0 && rest === d1) ||
        (lhs === d8 && rhs === d3 && result === d1 && rest === d1) ||
        (lhs === d8 && rhs === d4 && result === d2 && rest === d1) ||
        (lhs === d8 && rhs === d5 && result === d3 && rest === d1) ||
        (lhs === d8 && rhs === d6 && result === d4 && rest === d1) ||
        (lhs === d8 && rhs === d7 && result === d5 && rest === d1) ||
        (lhs === d8 && rhs === d8 && result === d6 && rest === d1) ||
        (lhs === d8 && rhs === d9 && result === d7 && rest === d1) ||

        (lhs === d9 && rhs === d1 && result === d0 && rest === d1) ||
        (lhs === d9 && rhs === d2 && result === d1 && rest === d1) ||
        (lhs === d9 && rhs === d3 && result === d2 && rest === d1) ||
        (lhs === d9 && rhs === d4 && result === d3 && rest === d1) ||
        (lhs === d9 && rhs === d5 && result === d4 && rest === d1) ||
        (lhs === d9 && rhs === d6 && result === d5 && rest === d1) ||
        (lhs === d9 && rhs === d7 && result === d6 && rest === d1) ||
        (lhs === d9 && rhs === d8 && result === d7 && rest === d1) ||
        (lhs === d9 && rhs === d9 && result === d8 && rest === d1)
}

// Function to help the reverse one
func reverseAcc(_ list: Term, _ acc: Term, _ reversed: Term) -> Goal {
  return (list === List.empty && reversed === acc) ||
         freshn { i in
           let head = i ["head"]
           let tail = i ["tail"]
           return list === List.cons(head,tail) &&
                  delayed(reverseAcc(tail, List.cons(head, acc), reversed))
         }
}

// Function to reverse a list
func reverse(_ list: Term, _ reversed: Term) -> Goal {
  return reverseAcc(list, List.empty, reversed)
}

// To avoid having a zero at the first place of a result
func notZero(_ term : Term) -> Goal {
  var goal : Goal = (term === Value(1))
  for i in 2...9 {
      goal = goal || (term === Value(i))
  }
  return goal
 }


// Function to add two numbers
func addNumber (_ lhs: Term, _ rhs: Term, _ result: Term) -> Goal {
  return (lhs === List.empty && result === rhs) ||
         (rhs === List.empty && result === lhs) ||
         delayed(freshn { i in
             let lhead = i ["lhead"]
             let rhead = i ["rhead"]
             let ltail = i ["ltail"]
             let rtail = i ["rtail"]
             let result_digit = i ["result_digit"]
             let rest_digit = i ["rest_digit"]
             let result_added_rest = i ["result_added_rest"]
             let result_temp = i ["result_temp"]

                    // takes the first digit of lhs
             return lhs === List.cons(lhead, ltail) &&

                    // takes the first digit of rhs
                    rhs === List.cons(rhead, rtail) &&

                    // adds those two numbers
                    addDigit(lhead, rhead, result_digit, rest_digit) &&

                    // adds the rest to lhs tail
                    addNumber(ltail, List.cons(rest_digit, List.empty),result_added_rest) &&

                    // recursion with the rest of the digits
                    addNumber(result_added_rest, rtail, result_temp) &&

                    // gives the result
                    result === List.cons(result, result_temp)
         }
     )
}

// Function to evaluate the addition
func evalAdd(_ lhs: Term, _ rhs: Term, _ output: Term) -> Goal {
  return freshn { i in
            let reversed_lhs = i ["reversed_lhs"]
            let reversed_rhs = i ["reversed_rhs"]
            let inversed_output = i ["inversed_output"]
            return reverse(lhs,reversed_lhs) && // To reverse lhs
                 reverse(rhs,reversed_rhs) && // To reverse rhs
                 addNumber(reversed_lhs,reversed_rhs,inversed_output) && // To add the two numbers
                 reverse(inversed_output, output) // Reverse the result
         }
}


/***********************************/
/*    PART FOR THE SUBSTRACTION    */
/***********************************/

func subtract (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "lhs" : lhs,
      "op"  : Value ("-"),
      "rhs" : rhs,
  ]
}

// Abstract syntax for the subtraction :
// l, r in Nat
// ------------
// l - r in Nat

// Semantic for the subtraction :
// l =N=> l', r =N=> r'
// ---------------------
// l - r =N=> l' -Nat r'

// With a little manipulation, we can see that the substraction can use the addition. And LogicKit can solve this equation
// lhs - rhs = result <=> lhs = result + rhs
func evalSub(_ lhs : Term,_ rhs : Term,_ result : Term) -> Goal {
  return
        delayed(freshn { i in
            let reversed_lhs = i ["reversed_lhs"]
            let reversed_rhs = i ["reversed_rhs"]
            let reversed_result = i["reversed_result"]
            let head = i["head"]
            let tail = i["tail"]
            return
                reverse (lhs, reversed_lhs) && // To reverse lhs
                reverse (rhs, reversed_rhs) && // To reverse rhs
                addNumber (reversed_result, reversed_rhs, reversed_lhs) && // To add the two numbers (rhs and result) and find lhs
                reverse (reversed_result, result) && // Reverse the result
                result === List.cons(head, tail) //&& notZero(head)
        })
}


/*************************************/
/*    PART FOR THE MULTIPLICATION    */
/*************************************/

func multiply (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "lhs" : lhs,
      "op"  : Value ("*"),
      "rhs" : rhs,
  ]
}

// Abstract syntax for the multiplication :
// l, r in Nat
// ------------
// l * r in Nat

// Semantic for the multiplication :
// l =N=> l', r =N=> r'
// ---------------------
// l * r =N=> l' *Nat r'

// When you multiply l and r, it like you add l times the value r (or r times l, it's equal)
func evalMultiply (_ lhs : Term,_ rhs : Term,_ result : Term) -> Goal {
  return (lhs === toNumber(1) && rhs === result ) || // 1 * rhs = result <=> rhs = result
        delayed(freshn { i in
          let new_lhs = i["new_lhs"]
          let helper = i["helper"]
          return
              evalSub (lhs, toNumber(1), new_lhs) && // Decreases the multiplier, new_lhs
              evalMultiply (rhs, new_lhs, helper) && // Recursion of the multiplication
              evalAdd (helper, rhs, result) // Stock the result
         }
     )
}


/*******************************/
/*    PART FOR THE DIVISION    */
/*******************************/

func divide (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value ("/"),
    "rhs" : rhs,
  ]
}

// Abstract syntax for the division :
// l, r in Nat
// ------------
// l / r in Nat

// Semantic for the division :
// l =N=> l', r =N=> r'
// ---------------------
// l / r =N=> l' /Nat r'

// In the same way we used the add function to create the substraction one, here we can use the multiplication function
// We can see that l / r = result <=> l = result * r
func evalDivision (_ lhs : Term,_ rhs : Term,_ result : Term) -> Goal {
    return evalMultiply(rhs, result, lhs)
}


/*############*/
// Booleans:
/*############*/

let t = Value (true)
let f = Value (false)

func not (_ of: Term) -> Map {
  return [
    "op"  : Value ("not"),
    "value" : of,
  ]
}

func and (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value ("and"),
    "rhs" : rhs,
  ]
}

func or (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value ("or"),
    "rhs" : rhs,
  ]
}

func implies (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value ("implies"),
    "rhs" : rhs,
  ]
}

// Comparisons:

func lessthan (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value ("<"),
    "rhs" : rhs,
  ]
}

func lessequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value ("<="),
    "rhs" : rhs,
  ]
}

func greaterthan (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value (">"),
    "rhs" : rhs,
  ]
}

func greaterequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value (">="),
    "rhs" : rhs,
  ]
}

func equal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value ("="),
    "rhs" : rhs,
  ]
}

func notequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
    "lhs" : lhs,
    "op"  : Value ("!="),
    "rhs" : rhs,
  ]
}

/*
// Evaluation:

func evalArithmetic (input: Term, output: Term) -> Goal {
    assert (false)
}
*/

func evalBoolean (input: Term, output: Term) -> Goal {
  return (input === t && output === t) || 
        (input === f && output === f) ||

        (freshn { g in
            let l_in  = g ["l_in"]
            let r_in  = g ["r_in"]
            let l_out = g ["l_out"]
            let r_out = g ["r_out"]
            return input === and (l_in, r_in) &&
                evalBoolean (input: l_in, output: l_out) &&
                evalBoolean (input: r_in, output: r_out) &&
                ((l_out === t && output === r_out) || (l_out === f && output === f))
        }) ||

        (freshn { g in
            let l_in  = g ["l_in"]
            let r_in  = g ["r_in"]
            let l_out = g ["l_out"]
            let r_out = g ["r_out"]
            return input === or (l_in, r_in) &&
                evalBoolean (input: l_in, output: l_out) &&
                evalBoolean (input: r_in, output: r_out) &&
                ((l_out === f && output === r_out) || (l_out === t && output === t))
        }) ||

        (freshn { g in
            let l_in  = g ["l_in"]
            let r_in  = g ["r_in"]
            let l_out = g ["l_out"]
            let r_out = g ["r_out"]
            return input === implies (l_in, r_in) &&
                evalBoolean (input: l_in, output: l_out) &&
                evalBoolean (input: r_in, output: r_out) &&
                ((l_out === t && output === r_out) || (l_out === f && output === t))
        }) ||

        (freshn { g in
            let r_in  = g ["r_in"]
            let r_out = g ["r_out"]
            return input === not(r_in) &&
                evalBoolean(input: r_in, output: r_out) &&
                ((r_out === f && output === t) || (r_out === t && output === f))
        })
}

/*
func evalComparison (input: Term, output: Term) -> Goal {
    assert (false)
}

// Main evaluation:

func eval (input: Term, output: Term) -> Goal {
    assert (false)
}
*/
