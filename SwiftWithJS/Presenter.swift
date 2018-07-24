//
//  Presenter.swift
//  SwiftWithJS
//
//  Created by Swapnil Sankla on 23/07/18.
//  Copyright © 2018 Swapnil Sankla. All rights reserved.
//

import Foundation
import JavaScriptCore

protocol View {
    func setResult(result: String)
    func setCopyRightInfo(info: String)
}

class Presenter {
    var view: View?
    let computationJSBridge = ComputationJSBridge()

    func viewDidLoad() {
        if let copyrightObj = CopyRightJSBridge().get() {
            view?.setCopyRightInfo(info: copyrightObj.info)
        }
    }

    func addButtonTapped(argument1: String?, argument2: String?) {
        view?.setResult(result: process(text1: argument1, text2: argument2, op: .Add))
    }

    func subtractButtonTapped(argument1: String?, argument2: String?) {
        view?.setResult(result: process(text1: argument1, text2: argument2, op: .Subtract))
    }

    func multiplyButtonTapped(argument1: String?, argument2: String?) {
        view?.setResult(result: process(text1: argument1, text2: argument2, op: .Multiply))
    }

    func divideButtonTapped(argument1: String?, argument2: String?) {
        view?.setResult(result: process(text1: argument1, text2: argument2, op: .Divide))
    }

    private func process(text1: String?, text2: String?, op: Operation) -> String {
        let input1 = parseInput(text: text1)
        let input2 = parseInput(text: text2)
        let computationObject = ComputationObject(argument1: input1,
                                                  argument2: input2)
        return computationJSBridge.compute(functionName: op.functionName(), computationObject: computationObject)
    }

    private func parseInput(text: String?) -> Double {
        guard let val = text else {
            return 0
        }
        if val == "" {
            return 0
        }
        return Double(val) ?? 0
    }
}
