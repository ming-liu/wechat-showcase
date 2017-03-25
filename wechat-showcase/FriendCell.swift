//
//  FriendCell.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/11.
//  Copyright © 2017年 刘明. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var lastMsg: UILabel!
    
    var friend : Friend? {
        didSet {
            refreshUI()
        }
    }
    
    func refreshUI() {
        header.text = nil
        lastMsg.text = nil
        
        if let friend = self.friend {
            header.text = friend.name
            lastMsg.text = friend.lastMsg
            if let imageUrl = friend.headerImg?.trimmingCharacters(in: NSCharacterSet.whitespaces) {
                cellImage.image = UIImage(named: imageUrl.characters.count == 0 ? "default" : imageUrl)
            } else {
                cellImage.image = UIImage(named: "default")
            }
            
        }
    }
}
