//: Playground - noun: a place where people can play

import UIKit
import CryptoSwift


func padding(bytes:[UInt8]) -> [UInt8] {
    let mod = bytes.count % 16
    if(mod != 0) {
        var result = bytes
        result.append(contentsOf: Array(repeating: 0, count: 16-mod))
        return result
    }
    return bytes
}


var str = "Hello, playground"

var postParam = "name=jordan&age=23"
//let postParam = "微信hello world ! 微信"

var key = "07C1276A22153AE5";
var iv = "55F9567817BDABFD";


let bytes = [UInt8](postParam.utf8)
let padded = padding(bytes: bytes)


do {
    let aes = try AES(key: key, iv: iv, blockMode: .CBC, padding: NoPadding())
    let encrpt = try aes.encrypt(padded)
    print(encrpt)
}



