//
//  ImageViewController.swift
//  wechat-showcase
//
//  Created by 刘明 on 2017/3/5.
//  Copyright © 2017年 刘明. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    var imageUrl : URL? {
        didSet {
            if(view.window != nil) {
                fetchImage()
            }
        }
    }
    
    private var imageView = UIImageView()
    private var image : UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    private func fetchImage() {
        print("ImageViewController fetchImage\(imageUrl)")

        if let url = imageUrl {
            do {
                print(NSDate.timeIntervalSinceReferenceDate)
                image = try UIImage(data: Data(contentsOf: url))
            } catch let exception {
                image = nil
                print("Exception \(exception)")
            }
        }
    }
    
    override func viewDidLoad() {
        print("ImageViewController viewDidLoad")
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ImageViewController viewWillAppear")
        if image == nil {
            fetchImage()
        }
    }

}
