//
//  MainViewController.swift
//  SmallPocket
//
//  Created by XueliangZhu on 17/01/2018.
//  Copyright © 2018 iossocket. All rights reserved.
//

import UIKit
import SwiftLinkPreview

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let slp = SwiftLinkPreview(session: URLSession.shared, workQueue: SwiftLinkPreview.defaultWorkQueue, responseQueue: DispatchQueue.main, cache: DisabledCache.instance)
        
        slp.preview("https://github.com/mxcl/PromiseKit",
                    onSuccess: { result in print("\(result)") },
                    onError: { error in print("\(error)")})
    }
    
    @IBAction func getUrl(_ sender: Any) {
        guard let url = UIPasteboard.general.url else {
            return
        }
        print(url)
    }
}
