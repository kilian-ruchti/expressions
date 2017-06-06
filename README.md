# Homework #3: Expressions

In this homework, you will implement the abstract syntax and semantics for
expressions over numbers and Booleans.

Numbers are represented as lists of decimal digits.
For instance, `51` is represented as:

```swift
  List.cons (Value (5), List.cons (Value (1), List.empty))
```

## Test

You can run the tests using:
```shell
$ swift test     # for mac users
$ docker build . # for linux users
```

You **must** add tests!

## Grade

* Have you done something? yes
* Does your code compile? yes
* Do your tests succeeds? yes
* Have you added more tests? not really
* Do the automatic tests succeed? no
* Have you written the semantics as inference rules? some

__Additional automatic tests need the function signatures to be unchanged,
and cannot thus compile. Please fix it.__

| Grade |
| ----- |
|   3   |
