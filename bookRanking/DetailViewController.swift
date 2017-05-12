//
//  DetailViewController.swift
//  bookRanking
//
//  Created by Hitomi Mikuni on 2017/04/15.
//  Copyright © 2017年 Hitomi Mikuni. All rights reserved.
//

import UIKit

private let kBaseURL: String = "http://books.rakuten.co.jp/rb/"

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    // MARK: Variables
    var bookId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: String = "\(kBaseURL)\(bookId)/"
        let requestURL = URL(string: url)
        let request: URLRequest = URLRequest(url: requestURL!)
        
        webview.loadRequest(request)
        
        
      
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
