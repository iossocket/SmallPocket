//
//  ViewController.swift
//  SmallPocket
//
//  Created by XueliangZhu on 17/01/2018.
//  Copyright © 2018 iossocket. All rights reserved.
//

import UIKit
import VasSonic

class ViewController: UIViewController, UIWebViewDelegate, SonicSessionDelegate {

    @IBOutlet weak var webView: UIWebView!
    private let url = "https://www.baidu.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        URLProtocol.registerClass(SonicURLProtocol.self)
        webView.delegate = self
        SonicEngine.shared().createSession(withUrl: self.url, withWebDelegate: self)
        
        let request = URLRequest(url: URL(string: self.url)!)
        if let session = SonicEngine.shared().session(withWebDelegate: self) {
            self.webView.loadRequest(SonicUtil.sonicWebRequest(with: session, withOrigin: request))
        } else {
            self.webView.loadRequest(request)
        }
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    func sessionWillRequest(_ session: SonicSession!) {
        
    }
    
    func session(_ session: SonicSession!, requireWebViewReload request: URLRequest!) {
        webView.loadRequest(request)
    }
}

