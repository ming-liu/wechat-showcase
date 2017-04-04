//
//  VisionViewController.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/4/3.
//  Copyright © 2017年 刘明. All rights reserved.
//

import Foundation
import UIKit


class VisionViewController : UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://m.dianping.com/waimai/mindex#!index/source=mine")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        print("uuid=\(UIDevice.current.identifierForVendor?.uuidString)")
    }
    
    
}
