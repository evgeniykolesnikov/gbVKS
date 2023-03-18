//
//  ScThirdViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 25.08.2022.
//

import UIKit

protocol Observer: AnyObject {
    func getContent(content: Center)
}

protocol Observable {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notify(content:String)
}

class Center: Observable{

    var state: String = "" {
        didSet{
            notify(content: state)
        }
    }
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

class Subscriber: Observer{



    var name: String

    init(name: String){
        self.name = name
    }
    func getContent(content: Center) {
        print("User \(name) get content \(content.state)")
    }

}

class ScThirdViewController: UIViewController {
let center = Center()

    let userOne = Subscriber(name: "Itan")
    let userTwo = Subscriber(name: "Hunt")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func sendAction(_ sender: Any) {
        center.state = "New content"
    }

    @IBAction func userOneFollow(_ sender: UISwitch) {
        if sender.isOn{
            center.add(observer: userOne)
        } else {
            center.remove(observer: userOne)
        }

    }

    @IBAction func userTwoFollow(_ sender: UISwitch) {
        if sender.isOn{
            center.add(observer: userTwo)
        } else {
            center.remove(observer: userTwo)
        }
    }
}
