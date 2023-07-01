import UIKit

let name: String? = "Andrey"

func testGuard() {
    guard let unwrappedName = name else { return }
    print(unwrappedName)
}

testGuard()

func sum( a: Int, _ b: Int) -> Int {
    return a+b
}

sum(a: 3, 6)
