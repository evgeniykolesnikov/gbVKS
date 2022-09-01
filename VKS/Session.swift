//
//  Session.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 24.08.2022.
//

import Foundation

class Session{


    static var shared = Session()
    private init(){}
    
    var session = ""
    var uid = ""
    var age = ""
    var name = ""
    var rate: Float = 1.1

    func connectDB(){
        //some code
        self.session = "new key"
    }

    func getUID(){
        // some code
        self.uid = "new uid"
    }

    func getName(){
        // some code
        self.name = "Itan"
    }
}
