//
//  ChooseViewController.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/5.
//  Copyright © 2017年 刘明. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {

    let MetuanUrl = URL(fileURLWithPath: "/Users/liuming/Desktop/tony/11118998_10153341495679060_1839339137130497563_o.jpg")
    let DianpingUrl = URL(fileURLWithPath: "/Users/liuming/Desktop/tony/535188_10154032731559060_6688818449079396659_n.jpg")

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ivc = segue.destination as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "showDpSegue":
                    ivc.imageUrl = DianpingUrl
                    ivc.title = "DianPing"
                case "showMeituanSegue":
                    ivc.imageUrl = MetuanUrl
                    ivc.title = "Meituan"
                default:
                    ivc.imageUrl = DianpingUrl
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
