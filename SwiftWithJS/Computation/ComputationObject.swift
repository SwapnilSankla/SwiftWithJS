//
//  ComputationObject.swift
//  SwiftWithJS
//
//  Created by Swapnil Sankla on 24/07/18.
//  Copyright © 2018 Swapnil Sankla. All rights reserved.
//

import Foundation
import JavaScriptCore

@objc protocol Computation: JSExport {
    var argument1: Double { get }
    var argument2: Double { get }
}

class ComputationObject: NSObject, Computation {
    var argument1: Double
    var argument2: Double

    init(argument1: Double, argument2: Double) {
        self.argument1 = argument1
        self.argument2 = argument2
    }
}
