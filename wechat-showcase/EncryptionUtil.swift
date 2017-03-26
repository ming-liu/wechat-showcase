//
//  EncryptionUtil.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/26.
//  Copyright © 2017年 刘明. All rights reserved.
//

import Foundation
import CryptoSwift

class EncryptionUtil {

    private static func padding(bytes:[UInt8]) -> [UInt8] {
        let mod = bytes.count % 16
        if(mod != 0) {
            var result = bytes
            result.append(contentsOf: Array(repeating: 0, count: 16-mod))
            return result
        }
        return bytes
    }
    
    static func encrypt(content: String,key: String,iv:String) throws -> [UInt8]{
        var bytes = [UInt8](content.utf8)
        bytes = padding(bytes: bytes)
        
        do {
            let encrypted = try AES(key: key, iv: iv, blockMode: .CBC, padding: NoPadding()).encrypt(bytes)
            return encrypted
        } catch {
            print(error)
            throw EncryptionExcetion()
        }
    }
}
