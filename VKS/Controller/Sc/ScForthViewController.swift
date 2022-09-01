//
//  ScForthViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 25.08.2022.
//

import UIKit

class ScForthViewController: UIViewController {

    let nt = NotificationCenter.default
    let ntName = Notification.Name("104FM")

    override func viewDidLoad() {
        super.viewDidLoad()

        nt.addObserver(self, selector: #selector(someFunc(nt:)), name: ntName, object: nil)
    }
    


    @objc func someFunc(nt: Notification){
        if let userInfo = nt.userInfo as? [String: Any]{
        print(userInfo)
        }
    }

}
