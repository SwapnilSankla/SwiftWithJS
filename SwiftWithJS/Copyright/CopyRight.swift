//
//  Copyright.swift
//  SwiftWithJS
//
//  Created by Swapnil Sankla on 24/07/18.
//  Copyright © 2018 Swapnil Sankla. All rights reserved.
//

import Foundation
import JavaScriptCore

@objc protocol CopyRight: JSExport {
    @objc static func create(info: String) -> CopyRightInfo
}

@objc class CopyRightInfo: NSObject, CopyRight {
    let info: String

    init(info: String) {
        self.info = info
    }

    @objc static func create(info: String) -> CopyRightInfo {
        return CopyRightInfo(info: info)
    }
}
