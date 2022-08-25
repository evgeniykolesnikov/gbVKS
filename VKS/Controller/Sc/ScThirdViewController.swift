//
//  ScThirdViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 25.08.2022.
//

import UIKit

protocol Observer: AnyObject {
    func getContent(content: Observable)
}

protocol Observable {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notify(content:String)
}

class Center: Observable{

    var content: String = ""
    private var observers = [Observer]()


    func add(observer: Observer) {
        self.observers.append(observer)
    }

    func remove(observer: Observer) {
        if let index = observers.firstIndex(where: {$0 === observer}) {
            observers.remove(at: index)
        }
    }

    func notify(content: String) {
        for observer in observers {
            observer.getContent(content: self)
        }
    }


}

class ScThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
