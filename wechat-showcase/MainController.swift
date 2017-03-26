//
//  MainController.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/25.
//  Copyright © 2017年 刘明. All rights reserved.
//

import UIKit

class MainController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tColor = UIColor(red: 73/255, green: 190/255, blue: 43/255, alpha: 1)
        self.tabBar.tintColor = tColor
        self.tabBar.barTintColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
        
        
        //let attrs = ["font":UIFont(name: "Helvetica-Bold", size: 25)!]
        //tabBarItem.setTitleTextAttributes(attrs, for: UIControlState.selected)
        //self.tabBar.selectedItem?.setTitleTextAttributes(attrs, for: UIControlState.normal)

        // print(self.tabBar.tintColor)
    }

    
    

}
