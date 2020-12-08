import UIKit
import Foundation


enum MathErrors: Error {
    case wrongLogarythmArgument
}

func calculateLog2(x: Double) throws -> Double {
    guard x > 0 else { throw MathErrors.wrongLogarythmArgument}
    return log2(x)
}

do {
    var result = try calculateLog2(x: -2)
} catch  {
    print("неверный аргумент к логарифму")
}
