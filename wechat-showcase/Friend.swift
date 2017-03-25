//
//  Friend.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/5.
//  Copyright © 2017年 刘明. All rights reserved.
//

import Foundation

class Friend {
    var id : String?
    var name : String?
    var headerImg : String?
    var lastMsg = "nothing"
    
    init(id:String,name:String,headerImg:String,lastMsg:String) {
        self.id = id
        self.name = name
        self.headerImg = headerImg
        self.lastMsg = lastMsg
    }
    
    init() {
        
    }
}
