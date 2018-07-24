//
//  Operation.swift
//  SwiftWithJS
//
//  Created by Swapnil Sankla on 24/07/18.
//  Copyright © 2018 Swapnil Sankla. All rights reserved.
//

import Foundation

enum Operation {
    case Add
    case Subtract
    case Multiply
    case Divide

    func functionName() -> String {
        switch self {
        case .Add      : return "add"
        case .Subtract : return "subtract"
        case .Multiply : return "multiply"
        default        : return "divide"
        }
    }
}
