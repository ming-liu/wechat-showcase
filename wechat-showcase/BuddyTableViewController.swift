//
//  BuddyTableViewController.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/4.
//  Copyright © 2017年 刘明. All rights reserved.
//

import Foundation
import UIKit

class BuddyTableViewController: UITableViewController {

    private var friendService = FriendService()
    private var offset = 0
    @IBOutlet weak var footerView: UIView!
    private let pageSize = 10
    private var loadedAll = 0
    
    //private var refreshControl: UIRefreshControl?
    
    private struct Constants {
        static let FriendCellReuseIdentifier = "Friend"
    }
    
    private var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Hello baby")
        refreshControl?.addTarget(self, action: #selector(BuddyTableViewController.refresh), for: .valueChanged)
        refresh()
        
    }
    
    
    func refresh() {
        print("begin to refresh")
        loadFriends(id: "2")
        refreshControl?.endRefreshing()
        print("refreshed")
        print("hidden=\(footerView.isHidden)"   )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func loadFriends(id:String) {
        friendService.getFriends(id:id,offset: offset, limit: offset + pageSize) { (friends) in
            self.friends.append(contentsOf: friends)
            if friends.count < self.pageSize {
                self.loadedAll = 1
            }
            self.offset = self.offset + self.pageSize
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.FriendCellReuseIdentifier, for: indexPath) as? FriendCell
        cell?.friend = friends[indexPath.row]
        
        if (indexPath.row == friends.count - 1) && (loadedAll == 0){
            refresh()
        }
        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // close popup model dialog,return
    @IBAction func back(segue:UIStoryboardSegue) {
        print("back method in .....")
    }
}
