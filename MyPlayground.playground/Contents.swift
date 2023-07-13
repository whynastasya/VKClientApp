
let a = 10

if a > 9 {
    print(a)
} else {
    print("b")
}

func g() -> Int {
    guard a > 9 else { return 0 }
    return a
}

g()
