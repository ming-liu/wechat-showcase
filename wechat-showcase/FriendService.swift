//
//  FriendService.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/5.
//  Copyright © 2017年 刘明. All rights reserved.
//

import Foundation

class FriendService {
    
   
    func getById(id:String) -> Friend {
        return Friend()
    }
    
    
    func getFriends(offset:Int,limit:Int,callBack: @escaping (_ friends: [Friend])->Void ) {
        DispatchQueue.global().async {
            let url = URL(string: "http://localhost:8080/wechat-showcase-web/friend.ac?id=2")
            var request = URLRequest(url: url!)
            let queryStr = "name=jordan&age=23"
            
            // queryStr.u
            //let origin = queryStr.data(using: String.Encoding.utf8)
            // queryStr.utf8
            let params = queryStr.data(using: String.Encoding.utf8)
            request.httpBody = params
            
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                
                if error == nil {
                    
                        let responseData =   String(data: data!, encoding: String.Encoding.utf8)
                    print("data=\(data)")
                    print("response=\(responseData)")
                    
                } else {
                    print("error=\(error)")
                }
                
            })
            print("before task resume")
            task.resume()
            print("after task resume")
            
            
            var friends = [Friend]()
            friends.append(Friend(id: "1",name: "Lily",headerImg: "lilyHeader",lastMsg: "hello"))
            friends.append(Friend(id: "1",name: "zizi",headerImg: "xuan",lastMsg: "world"))
            //friends.append(Friend(id: "1",name: "zizi",headerImg: "",lastMsg: "world"))
            DispatchQueue.main.async {
                callBack(friends)
            }
        }
        
    }
    

}
