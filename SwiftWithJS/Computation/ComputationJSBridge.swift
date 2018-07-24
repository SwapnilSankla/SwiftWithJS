//
//  JSBridge.swift
//  SwiftWithJS
//
//  Created by Swapnil Sankla on 24/07/18.
//  Copyright © 2018 Swapnil Sankla. All rights reserved.
//

import Foundation
import JavaScriptCore

class ComputationJSBridge {
    let jsContext = JSContext()

    func compute(functionName: String, computationObject: ComputationObject) -> String {
        if let scriptFilePath = Bundle.main.url(forResource: "calc", withExtension: "js")?.path {
            if let scriptFile = try? String(contentsOfFile: scriptFilePath) {
                jsContext?.evaluateScript(scriptFile)

                if functionName == "add" {
                    return (jsContext?.objectForKeyedSubscript("add")
                        .call(withArguments: [computationObject.argument1,
                                              computationObject.argument2])
                        .toString()) ?? ""
                } else {
                    return (jsContext?.objectForKeyedSubscript(functionName)
                        .call(withArguments: [computationObject]).toString()) ?? ""
                }
            }
        }
        return ""
    }
}
