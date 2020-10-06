//
//  AboutViewController.swift
//  BullsEyePractice
//
//  Created by Goutham Mac Mini on 05/10/20.
//  Copyright © 2020 df. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let htmlPath = Bundle.main.path(forResource: "Challenge_ Styling with Labels _ raywenderlich.com", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }

}
