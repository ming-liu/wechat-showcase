//
//  FriendService.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/5.
//  Copyright © 2017年 刘明. All rights reserved.
//

import Foundation
import Gzip
import EVReflection

class FriendService {
    
    
     static let key = "07C1276A22153AE5";
     static let iv = "55F9567817BDABFD";
    
    func getFriends(id:String, offset:Int,limit:Int,callBack: @escaping (_ friends: [Friend])->Void ) {
        print("getFriends method in ")

        DispatchQueue.global().async {
            let url = URL(string: "http://localhost:8080/wechat-showcase-web/friends.ac")
            var request = URLRequest(url: url!)
            let queryStr = "id=\(id)&offset=\(offset)&limit=\(limit)"
            
            
            do {
                let params = try EncryptionUtil.encrypt(content: queryStr, key: FriendService.key, iv: FriendService.iv)
                
                request.httpMethod = "POST"
                request.httpBody = Data(params)
                request.setValue("utf-8", forHTTPHeaderField: "Accept-Charset")
                request.setValue("\(params.count)", forHTTPHeaderField: "Content-Length")
                request.setValue("application/octet-stream", forHTTPHeaderField: "Content-type")
                
                
                
                let configuration = URLSessionConfiguration.default
                let session = URLSession(configuration: configuration)
                let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                    if error == nil {
                        do {
                            //let responseData =   String(data: data!, encoding: String.Encoding.utf8)
                            //let bytes = data?.bytes
                            let stript = try EncryptionUtil.decrypt(encrypto: (data?.bytes)!, key: FriendService.key, iv: FriendService.iv, strict: true)
                            let unzipped = try Data(stript).gunzipped()
                            //print("data=\(bytes)")
                            //print("stript=\(stript)")
                            //print("unzipped=\(unzipped.bytes)")

                            let result = String(bytes: unzipped.bytes, encoding: String.Encoding.utf8)!
                            let friendList = FriendList(json: result)
                            let friends = friendList.friends
                            
                            DispatchQueue.main.async {
                                callBack(friends!)
                            }
                            //print("response=\(result)")
                            //print("friendList=\(friendList)")
                        } catch {
                            print(error)
                        }
                    } else {
                        print("error=\(error)")
                    }
                    
                })

                task.resume()
            } catch {
                let friends = [Friend]()
                DispatchQueue.main.async {
                    callBack(friends)
                }
            }
            
        }
        
    }
    

}
