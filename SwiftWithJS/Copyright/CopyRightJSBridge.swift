//
//  CopyRightJSBridge.swift
//  SwiftWithJS
//
//  Created by Swapnil Sankla on 24/07/18.
//  Copyright © 2018 Swapnil Sankla. All rights reserved.
//

import Foundation
import JavaScriptCore

class CopyRightJSBridge {
    let jsContext = JSContext()

    init() {
        jsContext?.setObject(CopyRightInfo.self, forKeyedSubscript: "CopyRightInfo" as NSCopying & NSObjectProtocol)
    }

    func get() -> CopyRightInfo? {
        if let scriptFilePath = Bundle.main.url(forResource: "copyright", withExtension: "js")?.path {
            if let scriptFile = try? String(contentsOfFile: scriptFilePath) {
                jsContext?.evaluateScript(scriptFile)
                if let copyrightInfo = jsContext?
                    .objectForKeyedSubscript("get")
                    .call(withArguments: []).toObject() as? CopyRightInfo {
                    return copyrightInfo
                }
                return nil
            }
        }
        return nil
    }
}
