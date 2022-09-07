//
//  ScFifthViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 25.08.2022.
//

import UIKit

class ScFifthViewController: UIViewController {
    @IBOutlet var field: UITextField!

    let nt = NotificationCenter.default
    let ntName = Notification.Name("104FM")
    var isOnline = false


    override func viewDidLoad() {
        super.viewDidLoad()


    }
    override func viewWillDisappear(_ animated: Bool) {
        let userInfo: [String: Any] = [
            "name": field.text ?? "",
            "isOnline": isOnline
        ]
        nt.post(name: ntName, object: nil, userInfo: userInfo)
    }
    @IBAction func isOnline(_ sender: UISwitch) {
        self.isOnline = sender.isOn
    }


}
